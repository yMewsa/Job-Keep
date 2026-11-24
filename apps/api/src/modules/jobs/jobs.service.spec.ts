import {
  CompanyMemberRole,
  CompanyVerificationStatus,
  ContractType,
  JobSeniority,
  JobStatus,
  Prisma,
  SkillRequirementType,
  WorkMode,
} from '@prisma/client';
import { ConfigService } from '@nestjs/config';
import { AppEnv } from '../../common/config/env.schema';
import { DomainException } from '../../common/exceptions/domain.exception';
import { CompaniesService } from '../companies/companies.service';
import { CreateJobDto } from './dto/job.dto';
import { JobsRepository } from './jobs.repository';
import { JobsService } from './jobs.service';

const companyId = 'c0a80123-0000-4000-8000-000000000001';
const jobId = 'c0a80123-0000-4000-8000-000000000002';

type CompanyJob = Prisma.JobGetPayload<{
  include: { jobSkills: { include: { skill: true } } };
}>;

function createJob(): CompanyJob {
  return {
    id: jobId,
    companyId,
    createdByUserId: 'c0a80123-0000-4000-8000-000000000003',
    title: 'Desenvolvedor backend',
    description: 'Desenvolvimento de serviços para a plataforma.',
    requirements: 'Experiência com APIs e bancos de dados.',
    area: 'Tecnologia',
    city: 'São Paulo',
    state: 'SP',
    workMode: WorkMode.HIBRIDO,
    salaryMin: 700_000,
    salaryMax: 1_200_000,
    benefits: ['Vale-refeição'],
    seniority: JobSeniority.MID,
    contractType: ContractType.CLT,
    status: JobStatus.DRAFT,
    responseDeadlineDays: 14,
    isSuspicious: false,
    suspiciousReasons: [],
    contentFingerprint: 'fingerprint',
    publishedAt: null,
    closedAt: null,
    createdAt: new Date(),
    updatedAt: new Date(),
    deletedAt: null,
    jobSkills: [
      {
        id: 'c0a80123-0000-4000-8000-000000000004',
        jobId,
        skillId: 'c0a80123-0000-4000-8000-000000000005',
        requirementType: SkillRequirementType.REQUIRED,
        weight: 5,
        minimumLevel: null,
        createdAt: new Date(),
        skill: {
          id: 'c0a80123-0000-4000-8000-000000000005',
          name: 'Node.js',
          slug: 'node-js',
          category: 'Tecnologia',
          isApproved: true,
          suggestedByUserId: null,
          createdAt: new Date(),
        },
      },
    ],
  };
}

function createService(
  verificationStatus: CompanyVerificationStatus = CompanyVerificationStatus.VERIFIED,
) {
  const jobsRepository = {
    findCompanyJob: jest.fn(),
    updateJob: jest.fn(),
    setJobStatus: jest.fn(),
    publishJobWithinLimit: jest.fn(),
    hasDuplicateContent: jest.fn().mockResolvedValue(null),
    findActiveComparableSalaries: jest.fn().mockResolvedValue([]),
    updateModeration: jest.fn().mockResolvedValue(undefined),
  } as unknown as jest.Mocked<JobsRepository>;
  const companiesService = {
    requireMembership: jest.fn().mockResolvedValue({
      companyId,
      role: CompanyMemberRole.OWNER,
      company: {
        id: companyId,
        verificationStatus,
        maxActiveJobs: null,
      },
    }),
  } as unknown as jest.Mocked<CompaniesService>;
  const configService = {
    get: jest.fn().mockReturnValue(10),
  } as unknown as ConfigService<AppEnv, true>;
  return {
    service: new JobsService(jobsRepository, companiesService, configService),
    jobsRepository,
  };
}

describe('JobsService', () => {
  it('impede que uma empresa altere uma vaga pertencente a outra empresa', async () => {
    const { service, jobsRepository } = createService();
    jobsRepository.findCompanyJob.mockResolvedValue(null);

    await expect(
      service.updateJob('company-user', jobId, { title: 'Título alterado' }),
    ).rejects.toMatchObject({ errorCode: 'JOB_NOT_FOUND' });

    expect(jobsRepository.updateJob.mock.calls).toHaveLength(0);
  });

  it('não publica vagas de empresas ainda não verificadas', async () => {
    const { service, jobsRepository } = createService(CompanyVerificationStatus.PENDING);
    jobsRepository.findCompanyJob.mockResolvedValue(createJob());

    await expect(
      service.changeStatus('company-user', jobId, { status: JobStatus.ACTIVE }),
    ).rejects.toMatchObject({ errorCode: 'COMPANY_NOT_VERIFIED' });

    expect(jobsRepository.setJobStatus.mock.calls).toHaveLength(0);
    expect(jobsRepository.publishJobWithinLimit.mock.calls).toHaveLength(0);
  });

  it('exige cidade, estado e competência obrigatória para publicar', async () => {
    const { service, jobsRepository } = createService();
    const incompleteJob: CompanyJob = {
      ...createJob(),
      city: null,
      jobSkills: [],
    };
    jobsRepository.findCompanyJob.mockResolvedValue(incompleteJob);

    await expect(
      service.changeStatus('company-user', jobId, { status: JobStatus.ACTIVE }),
    ).rejects.toBeInstanceOf(DomainException);

    expect(jobsRepository.setJobStatus.mock.calls).toHaveLength(0);
  });

  it('publica uma vaga completa de empresa verificada dentro do limite', async () => {
    const { service, jobsRepository } = createService();
    const job = createJob();
    jobsRepository.findCompanyJob.mockResolvedValue(job);
    jobsRepository.publishJobWithinLimit.mockResolvedValue({
      job: { ...job, status: JobStatus.ACTIVE },
    });

    await service.changeStatus('company-user', jobId, { status: JobStatus.ACTIVE });

    expect(jobsRepository.publishJobWithinLimit.mock.calls).toEqual([[companyId, jobId, 10]]);
    expect(jobsRepository.updateModeration.mock.calls).toEqual([[jobId, []]]);
  });

  it('impede publicar acima do limite de vagas ativas da empresa', async () => {
    const { service, jobsRepository } = createService();
    jobsRepository.findCompanyJob.mockResolvedValue(createJob());
    jobsRepository.publishJobWithinLimit.mockResolvedValue({
      error: 'ACTIVE_JOB_LIMIT_REACHED',
    } as never);

    await expect(
      service.changeStatus('company-user', jobId, { status: JobStatus.ACTIVE }),
    ).rejects.toMatchObject({ errorCode: 'ACTIVE_JOB_LIMIT_REACHED' });

    expect(jobsRepository.publishJobWithinLimit.mock.calls).toEqual([[companyId, jobId, 10]]);
  });

  it('rejeita criação de faixa salarial invertida', async () => {
    const { service } = createService();
    const invalidJob = {
      title: 'Desenvolvedor',
      description: 'Descrição preenchida',
      requirements: 'Requisitos',
      area: 'Tecnologia',
      salaryMin: 1_200_000,
      salaryMax: 700_000,
    } as CreateJobDto;

    await expect(service.createJob('company-user', invalidJob)).rejects.toMatchObject({
      errorCode: 'INVALID_SALARY_RANGE',
    });
  });

  it('rejeita título, descrição ou área vazios após remover espaços', async () => {
    const { service } = createService();
    const invalidJob: CreateJobDto = {
      title: '   ',
      description: 'Descrição preenchida',
      requirements: 'Requisitos',
      area: 'Tecnologia',
      workMode: WorkMode.HIBRIDO,
      salaryMin: 700_000,
      salaryMax: 1_200_000,
      benefits: ['Vale-refeição'],
      seniority: JobSeniority.MID,
      contractType: ContractType.CLT,
    };

    await expect(service.createJob('company-user', invalidJob)).rejects.toMatchObject({
      errorCode: 'JOB_TEXT_FIELDS_REQUIRED',
    });
  });
});
