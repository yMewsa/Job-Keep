import { HttpStatus, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { CompanyVerificationStatus, Job, JobStatus, SkillRequirementType } from '@prisma/client';
import { createHash } from 'node:crypto';
import { AppEnv } from '../../common/config/env.schema';
import { DomainException } from '../../common/exceptions/domain.exception';
import { CompaniesService } from '../companies/companies.service';
import {
  ChangeJobStatusDto,
  CreateJobDto,
  CreateJobReportDto,
  JobQueryDto,
  JobSkillInputDto,
  UpdateJobDto,
} from './dto/job.dto';
import { JobsRepository } from './jobs.repository';

@Injectable()
export class JobsService {
  constructor(
    private readonly jobsRepository: JobsRepository,
    private readonly companiesService: CompaniesService,
    private readonly configService: ConfigService<AppEnv, true>,
  ) {}

  async listPublicJobs(query: JobQueryDto) {
    if (query.salaryMin && query.salaryMax && query.salaryMin > query.salaryMax) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'INVALID_SALARY_FILTER',
        'O salário mínimo do filtro não pode superar o salário máximo.',
      );
    }
    return this.jobsRepository.listPublicJobs(query);
  }

  private validateRequiredJobText(job: Pick<Job, 'title' | 'description' | 'area'>) {
    if (!job.title.trim() || !job.description.trim() || !job.area.trim()) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'JOB_TEXT_FIELDS_REQUIRED',
        'Título, descrição e área profissional da vaga são obrigatórios.',
      );
    }
  }

  async getPublicJob(jobId: string) {
    const job = await this.jobsRepository.getPublicJob(jobId);
    if (!job) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'JOB_NOT_FOUND', 'Vaga não encontrada.');
    }
    return job;
  }

  async listCompanyJobs(userId: string) {
    const membership = await this.companiesService.requireMembership(userId);
    return this.jobsRepository.listCompanyJobs(membership.companyId);
  }

  async createJob(userId: string, dto: CreateJobDto) {
    const membership = await this.companiesService.requireMembership(userId);
    this.validateRequiredJobText(dto);
    this.validateSalaryRange(dto.salaryMin, dto.salaryMax);
    const skills = dto.skills ?? [];
    await this.validateSkills(skills);
    const fingerprint = this.createContentFingerprint(dto);
    const job = await this.jobsRepository.createJob(
      membership.companyId,
      userId,
      dto,
      skills,
      fingerprint,
    );
    await this.refreshModeration(job, fingerprint);
    return this.jobsRepository.findCompanyJob(membership.companyId, job.id);
  }

  async updateJob(userId: string, jobId: string, dto: UpdateJobDto) {
    const membership = await this.companiesService.requireMembership(userId);
    const job = await this.requireCompanyJob(membership.companyId, jobId);
    if (job.status === JobStatus.CLOSED) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'JOB_CLOSED',
        'Vagas encerradas não podem ser editadas.',
      );
    }

    this.validateRequiredJobText({
      title: dto.title ?? job.title,
      description: dto.description ?? job.description,
      area: dto.area ?? job.area,
    });
    const salaryMin = dto.salaryMin ?? job.salaryMin;
    const salaryMax = dto.salaryMax ?? job.salaryMax;
    this.validateSalaryRange(salaryMin, salaryMax);

    const skills = dto.skills;
    if (skills !== undefined) await this.validateSkills(skills);
    if (job.status === JobStatus.ACTIVE) {
      this.validatePublishRequirements(
        {
          ...job,
          ...dto,
          city: dto.city ?? job.city,
          state: dto.state ?? job.state,
          benefits: dto.benefits ?? job.benefits,
          responseDeadlineDays: dto.responseDeadlineDays ?? job.responseDeadlineDays,
        },
        skills ?? job.jobSkills,
      );
    }
    const fingerprint = this.createContentFingerprint({
      title: dto.title ?? job.title,
      description: dto.description ?? job.description,
      requirements: dto.requirements ?? job.requirements,
    });

    const updated = await this.jobsRepository.updateJob(
      membership.companyId,
      jobId,
      dto,
      skills,
      fingerprint,
    );
    await this.refreshModeration(updated, fingerprint);
    return this.jobsRepository.findCompanyJob(membership.companyId, jobId);
  }

  async changeStatus(userId: string, jobId: string, dto: ChangeJobStatusDto) {
    const membership = await this.companiesService.requireMembership(userId);
    const job = await this.requireCompanyJob(membership.companyId, jobId);

    if (dto.status === JobStatus.CLOSED) {
      const result = await this.jobsRepository.closeOrDeleteJob(membership.companyId, jobId, false);
      if (!result) {
        throw new DomainException(HttpStatus.NOT_FOUND, 'JOB_NOT_FOUND', 'Vaga não encontrada.');
      }
      return result.job;
    }
    if (job.status === JobStatus.CLOSED) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'JOB_CLOSED',
        'Vagas encerradas não podem ser reabertas.',
      );
    }
    if (dto.status === JobStatus.PAUSED && job.status !== JobStatus.ACTIVE) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'JOB_NOT_ACTIVE',
        'Somente vagas ativas podem ser pausadas.',
      );
    }
    if (dto.status === JobStatus.DRAFT) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'INVALID_JOB_TRANSITION',
        'Uma vaga não pode voltar ao estado de rascunho.',
      );
    }
    let updated: Awaited<ReturnType<JobsRepository['setJobStatus']>>;
    if (dto.status === JobStatus.ACTIVE && job.status !== JobStatus.ACTIVE) {
      this.validatePublishRequirements(job, job.jobSkills);
      if (membership.company.verificationStatus !== CompanyVerificationStatus.VERIFIED) {
        throw new DomainException(
          HttpStatus.FORBIDDEN,
          'COMPANY_NOT_VERIFIED',
          'A empresa precisa estar verificada para publicar vagas.',
        );
      }
      const limit =
        membership.company.maxActiveJobs ??
        this.configService.get('MAX_ACTIVE_JOBS_PER_COMPANY', { infer: true }) ??
        10;
      const publication = await this.jobsRepository.publishJobWithinLimit(
        membership.companyId,
        jobId,
        limit,
      );
      if ('error' in publication && publication.error === 'COMPANY_NOT_VERIFIED') {
        throw new DomainException(
          HttpStatus.FORBIDDEN,
          'COMPANY_NOT_VERIFIED',
          'A empresa precisa estar verificada para publicar vagas.',
        );
      }
      if ('error' in publication) {
        throw new DomainException(
          HttpStatus.CONFLICT,
          'ACTIVE_JOB_LIMIT_REACHED',
          `A empresa atingiu o limite de ${limit} vagas ativas.`,
        );
      }
      updated = publication.job;
    } else {
      updated = await this.jobsRepository.setJobStatus(job.id, dto.status);
    }

    const fingerprint = this.createContentFingerprint(updated);
    await this.refreshModeration(updated, fingerprint);
    return this.jobsRepository.findCompanyJob(membership.companyId, jobId);
  }

  async deleteJob(userId: string, jobId: string) {
    const membership = await this.companiesService.requireMembership(userId);
    await this.requireCompanyJob(membership.companyId, jobId);
    const result = await this.jobsRepository.closeOrDeleteJob(membership.companyId, jobId, true);
    if (!result) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'JOB_NOT_FOUND', 'Vaga não encontrada.');
    }
    return {
      message: result.closedInsteadOfDeleted
        ? 'A vaga foi encerrada e os candidatos ativos foram notificados.'
        : 'A vaga foi excluída logicamente.',
      status: result.job.status,
      deletedAt: result.job.deletedAt,
    };
  }

  async reportJob(userId: string, jobId: string, dto: CreateJobReportDto) {
    const job = await this.jobsRepository.getPublicJob(jobId);
    if (!job) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'JOB_NOT_FOUND', 'Vaga não encontrada.');
    }
    if (await this.jobsRepository.hasReportedJob(userId, jobId)) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'JOB_ALREADY_REPORTED',
        'Você já denunciou esta vaga.',
      );
    }
    const report = await this.jobsRepository.createReport(
      userId,
      jobId,
      dto.reason,
      dto.description,
    );
    return {
      id: report.id,
      reason: report.reason,
      description: report.description,
      status: report.status,
      createdAt: report.createdAt,
    };
  }

  async listModerationQueue() {
    return this.jobsRepository.listModerationQueue();
  }

  private async requireCompanyJob(companyId: string, jobId: string) {
    const job = await this.jobsRepository.findCompanyJob(companyId, jobId);
    if (!job) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'JOB_NOT_FOUND', 'Vaga não encontrada.');
    }
    return job;
  }

  private validateSalaryRange(min: number, max: number) {
    if (min > max) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'INVALID_SALARY_RANGE',
        'O salário mínimo não pode superar o salário máximo.',
      );
    }
  }

  private async validateSkills(skills: JobSkillInputDto[]) {
    const ids = skills.map((skill) => skill.skillId);
    if (new Set(ids).size !== ids.length) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'DUPLICATE_JOB_SKILL',
        'A mesma competência não pode ser adicionada mais de uma vez.',
      );
    }
    if (ids.length === 0) return;
    const approvedIds = await this.jobsRepository.findApprovedSkills(ids);
    if (approvedIds.length !== ids.length) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'JOB_SKILL_NOT_FOUND',
        'Uma ou mais competências são inválidas ou não estão aprovadas.',
      );
    }
  }

  private validatePublishRequirements(
    job: Pick<
      Job,
      | 'salaryMin'
      | 'salaryMax'
      | 'title'
      | 'description'
      | 'area'
      | 'workMode'
      | 'city'
      | 'state'
      | 'requirements'
      | 'benefits'
      | 'responseDeadlineDays'
    >,
    skillList: Array<{ requirementType: SkillRequirementType }>,
  ) {
    const hasRequiredSkill = skillList.some(
      (skill) => skill.requirementType === SkillRequirementType.REQUIRED,
    );
    const benefits = Array.isArray(job.benefits)
      ? job.benefits.filter((benefit) => typeof benefit === 'string' && benefit.trim().length > 0)
      : [];
    if (
      job.salaryMin <= 0 ||
      job.salaryMax < job.salaryMin ||
      !job.title.trim() ||
      !job.description.trim() ||
      !job.area.trim() ||
      !job.workMode ||
      !job.city?.trim() ||
      !job.state?.trim() ||
      !job.requirements.trim() ||
      !hasRequiredSkill ||
      benefits.length === 0 ||
      job.responseDeadlineDays < 1
    ) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'JOB_PUBLICATION_REQUIREMENTS_MISSING',
        'Para publicar, informe faixa salarial válida, modalidade, cidade e estado, requisitos, ao menos uma competência obrigatória, benefícios e prazo de resposta.',
      );
    }
  }

  private createContentFingerprint(job: Pick<Job, 'title' | 'description' | 'requirements'>) {
    const normalized = [job.title, job.description, job.requirements]
      .join(' ')
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLocaleLowerCase('pt-BR')
      .replace(/[^\p{L}\p{N}]+/gu, ' ')
      .trim()
      .replace(/\s+/g, ' ');
    return createHash('sha256').update(normalized).digest('hex');
  }

  private async refreshModeration(
    job: Pick<
      Job,
      | 'id'
      | 'companyId'
      | 'title'
      | 'description'
      | 'requirements'
      | 'area'
      | 'workMode'
      | 'salaryMin'
      | 'salaryMax'
    >,
    fingerprint: string,
  ) {
    const reasons: string[] = [];
    const duplicate = await this.jobsRepository.hasDuplicateContent(
      job.companyId,
      fingerprint,
      job.id,
    );
    if (duplicate) reasons.push('TEXTO_DUPLICADO_ENTRE_EMPRESAS');

    const salarySamples = await this.jobsRepository.findActiveComparableSalaries(
      job.area,
      job.workMode,
      job.id,
    );
    if (salarySamples.length >= 5) {
      const median = this.calculateMedian(salarySamples);
      if (job.salaryMin < median / 3 || job.salaryMax > median * 3) {
        reasons.push('FAIXA_SALARIAL_FORA_DO_PADRAO');
      }
    }
    await this.jobsRepository.updateModeration(job.id, reasons);
  }

  private calculateMedian(values: number[]) {
    const sorted = [...values].sort((a, b) => a - b);
    const middle = Math.floor(sorted.length / 2);
    return sorted.length % 2 === 0 ? (sorted[middle - 1] + sorted[middle]) / 2 : sorted[middle];
  }
}
