import { Injectable } from '@nestjs/common';
import {
  ApplicationStatus,
  CompanyVerificationStatus,
  Job,
  JobStatus,
  NotificationChannel,
  NotificationType,
  Prisma,
  ReportReason,
  ReportTargetType,
} from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';
import { CreateJobDto, JobQueryDto, JobSkillInputDto, UpdateJobDto } from './dto/job.dto';

const ACTIVE_APPLICATION_STATUSES: ApplicationStatus[] = [
  ApplicationStatus.INTERESTED,
  ApplicationStatus.MATCHED,
  ApplicationStatus.IN_REVIEW,
  ApplicationStatus.INTERVIEW,
  ApplicationStatus.OFFER,
];

const JOB_SKILLS_SELECT = {
  jobSkills: {
    select: {
      id: true,
      skillId: true,
      requirementType: true,
      weight: true,
      minimumLevel: true,
      skill: { select: { id: true, name: true, slug: true, category: true } },
    },
  },
} satisfies Prisma.JobSelect;

const COMPANY_JOB_SELECT = {
  id: true,
  companyId: true,
  title: true,
  description: true,
  requirements: true,
  area: true,
  city: true,
  state: true,
  workMode: true,
  salaryMin: true,
  salaryMax: true,
  benefits: true,
  seniority: true,
  contractType: true,
  status: true,
  responseDeadlineDays: true,
  publishedAt: true,
  closedAt: true,
  createdAt: true,
  updatedAt: true,
  ...JOB_SKILLS_SELECT,
} satisfies Prisma.JobSelect;

const JOB_PUBLIC_SELECT = {
  ...COMPANY_JOB_SELECT,
  company: {
    select: {
      id: true,
      tradeName: true,
      sector: true,
      logoUrl: true,
      verificationStatus: true,
    },
  },
} satisfies Prisma.JobSelect;

@Injectable()
export class JobsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findCompanyJob(companyId: string, jobId: string) {
    return this.prisma.job.findFirst({
      where: { id: jobId, companyId, deletedAt: null },
      select: COMPANY_JOB_SELECT,
    });
  }

  async createJob(
    companyId: string,
    userId: string,
    dto: CreateJobDto,
    skills: JobSkillInputDto[],
    fingerprint: string,
  ): Promise<Job> {
    return this.prisma.job.create({
      data: {
        companyId,
        createdByUserId: userId,
        title: dto.title.trim(),
        description: dto.description.trim(),
        requirements: dto.requirements.trim(),
        area: dto.area.trim(),
        city: dto.city?.trim() ?? null,
        state: dto.state?.trim() ?? null,
        workMode: dto.workMode,
        salaryMin: dto.salaryMin,
        salaryMax: dto.salaryMax,
        benefits: dto.benefits,
        seniority: dto.seniority,
        contractType: dto.contractType,
        responseDeadlineDays: dto.responseDeadlineDays ?? 14,
        contentFingerprint: fingerprint,
        jobSkills: { create: this.toSkillCreates(skills) },
      },
    });
  }

  async updateJob(
    companyId: string,
    jobId: string,
    dto: UpdateJobDto,
    skills: JobSkillInputDto[] | undefined,
    fingerprint: string,
  ) {
    return this.prisma.$transaction(async (tx) => {
      if (skills !== undefined) {
        await tx.jobSkill.deleteMany({ where: { jobId } });
      }

      return tx.job.update({
        where: { id: jobId, companyId },
        data: {
          ...(dto.title !== undefined ? { title: dto.title.trim() } : {}),
          ...(dto.description !== undefined ? { description: dto.description.trim() } : {}),
          ...(dto.requirements !== undefined ? { requirements: dto.requirements.trim() } : {}),
          ...(dto.area !== undefined ? { area: dto.area.trim() } : {}),
          ...(dto.city !== undefined ? { city: dto.city.trim() } : {}),
          ...(dto.state !== undefined ? { state: dto.state.trim() } : {}),
          ...(dto.workMode !== undefined ? { workMode: dto.workMode } : {}),
          ...(dto.salaryMin !== undefined ? { salaryMin: dto.salaryMin } : {}),
          ...(dto.salaryMax !== undefined ? { salaryMax: dto.salaryMax } : {}),
          ...(dto.benefits !== undefined ? { benefits: dto.benefits } : {}),
          ...(dto.seniority !== undefined ? { seniority: dto.seniority } : {}),
          ...(dto.contractType !== undefined ? { contractType: dto.contractType } : {}),
          ...(dto.responseDeadlineDays !== undefined
            ? { responseDeadlineDays: dto.responseDeadlineDays }
            : {}),
          contentFingerprint: fingerprint,
          ...(skills !== undefined ? { jobSkills: { create: this.toSkillCreates(skills) } } : {}),
        },
        select: COMPANY_JOB_SELECT,
      });
    });
  }

  async findApprovedSkills(skillIds: string[]): Promise<string[]> {
    const skills = await this.prisma.skill.findMany({
      where: { id: { in: skillIds }, isApproved: true },
      select: { id: true },
    });
    return skills.map((skill) => skill.id);
  }

  async findActiveComparableSalaries(
    area: string,
    workMode: Job['workMode'],
    excludeJobId?: string,
  ) {
    const jobs = await this.prisma.job.findMany({
      where: {
        area: { equals: area, mode: 'insensitive' },
        workMode,
        status: JobStatus.ACTIVE,
        deletedAt: null,
        ...(excludeJobId ? { id: { not: excludeJobId } } : {}),
      },
      select: { salaryMin: true, salaryMax: true },
      orderBy: { publishedAt: 'desc' },
      take: 100,
    });
    return jobs.map((job) => (job.salaryMin + job.salaryMax) / 2);
  }

  async hasDuplicateContent(companyId: string, fingerprint: string, excludeJobId?: string) {
    return this.prisma.job.findFirst({
      where: {
        companyId: { not: companyId },
        contentFingerprint: fingerprint,
        deletedAt: null,
        ...(excludeJobId ? { id: { not: excludeJobId } } : {}),
        company: { deletedAt: null },
      },
      select: { id: true },
    });
  }

  async updateModeration(jobId: string, reasons: string[]): Promise<void> {
    await this.prisma.job.update({
      where: { id: jobId },
      data: { isSuspicious: reasons.length > 0, suspiciousReasons: reasons },
    });
  }

  async setJobStatus(jobId: string, status: JobStatus, publishedAt?: Date) {
    return this.prisma.job.update({
      where: { id: jobId },
      data: {
        status,
        ...(status === JobStatus.ACTIVE ? { publishedAt: publishedAt ?? new Date() } : {}),
        ...(status === JobStatus.CLOSED ? { closedAt: new Date() } : {}),
      },
      select: COMPANY_JOB_SELECT,
    });
  }

  async publishJobWithinLimit(companyId: string, jobId: string, limit: number) {
    return this.prisma.$transaction(async (tx) => {
      await tx.$queryRaw`SELECT id FROM company_profiles WHERE id = ${companyId}::uuid FOR UPDATE`;
      const company = await tx.companyProfile.findUnique({
        where: { id: companyId },
        select: { verificationStatus: true, deletedAt: true, maxActiveJobs: true },
      });
      if (
        !company ||
        company.deletedAt !== null ||
        company.verificationStatus !== CompanyVerificationStatus.VERIFIED
      ) {
        return { error: 'COMPANY_NOT_VERIFIED' as const };
      }

      const companyLimit = company.maxActiveJobs ?? limit;
      const activeCount = await tx.job.count({
        where: { companyId, status: JobStatus.ACTIVE, deletedAt: null },
      });
      if (activeCount >= companyLimit) {
        return { error: 'ACTIVE_JOB_LIMIT_REACHED' as const };
      }

      return {
        job: await tx.job.update({
          where: { id: jobId, companyId },
          data: { status: JobStatus.ACTIVE, publishedAt: new Date() },
          select: COMPANY_JOB_SELECT,
        }),
      };
    });
  }

  async closeOrDeleteJob(
    companyId: string,
    jobId: string,
    deleteWithoutActiveApplications: boolean,
  ) {
    return this.prisma.$transaction(async (tx) => {
      const job = await tx.job.findFirst({
        where: { id: jobId, companyId, deletedAt: null },
        include: {
          applications: {
            where: { status: { in: ACTIVE_APPLICATION_STATUSES } },
            select: {
              id: true,
              candidate: { select: { userId: true } },
            },
          },
        },
      });
      if (!job) return null;

      const now = new Date();
      const shouldCloseInstead = job.applications.length > 0;
      if (job.status === JobStatus.CLOSED) {
        if (!shouldCloseInstead && deleteWithoutActiveApplications) {
          const deleted = await tx.job.update({
            where: { id: job.id },
            data: { deletedAt: now },
          });
          return { job: deleted, closedInsteadOfDeleted: false };
        }
        return { job, closedInsteadOfDeleted: shouldCloseInstead };
      }

      const updated = await tx.job.update({
        where: { id: job.id },
        data: {
          status: JobStatus.CLOSED,
          closedAt: now,
          ...(!shouldCloseInstead && deleteWithoutActiveApplications ? { deletedAt: now } : {}),
        },
      });

      if (shouldCloseInstead) {
        await tx.notification.createMany({
          data: job.applications.map(({ id, candidate }) => ({
            userId: candidate.userId,
            type: NotificationType.SYSTEM,
            title: 'Vaga encerrada',
            body: `A vaga "${job.title}" foi encerrada pela empresa. Sua candidatura permanece registrada.`,
            payload: { jobId: job.id, applicationId: id, event: 'JOB_CLOSED' },
            channel: NotificationChannel.IN_APP,
            sentAt: now,
          })),
        });
      }

      return { job: updated, closedInsteadOfDeleted: shouldCloseInstead };
    });
  }

  async listPublicJobs(query: JobQueryDto) {
    const where: Prisma.JobWhereInput = {
      status: JobStatus.ACTIVE,
      deletedAt: null,
      company: { deletedAt: null, verificationStatus: 'VERIFIED' },
      ...(query.area ? { area: { contains: query.area, mode: 'insensitive' } } : {}),
      ...(query.workMode ? { workMode: query.workMode } : {}),
      ...(query.city ? { city: { contains: query.city, mode: 'insensitive' } } : {}),
      ...(query.state ? { state: { equals: query.state, mode: 'insensitive' } } : {}),
      ...(query.salaryMin ? { salaryMax: { gte: query.salaryMin } } : {}),
      ...(query.salaryMax ? { salaryMin: { lte: query.salaryMax } } : {}),
    };
    const [items, total] = await this.prisma.$transaction([
      this.prisma.job.findMany({
        where,
        select: JOB_PUBLIC_SELECT,
        orderBy: [{ publishedAt: 'desc' }, { id: 'asc' }],
        skip: (query.page - 1) * query.limit,
        take: query.limit,
      }),
      this.prisma.job.count({ where }),
    ]);
    return { items, total, page: query.page, limit: query.limit };
  }

  async getPublicJob(jobId: string) {
    return this.prisma.job.findFirst({
      where: {
        id: jobId,
        status: JobStatus.ACTIVE,
        deletedAt: null,
        company: { deletedAt: null, verificationStatus: 'VERIFIED' },
      },
      select: JOB_PUBLIC_SELECT,
    });
  }

  async listCompanyJobs(companyId: string) {
    return this.prisma.job.findMany({
      where: { companyId, deletedAt: null },
      select: COMPANY_JOB_SELECT,
      orderBy: { createdAt: 'desc' },
    });
  }

  async createReport(
    reporterUserId: string,
    jobId: string,
    reason: ReportReason,
    description?: string,
  ) {
    return this.prisma.report.create({
      data: {
        reporterUserId,
        targetType: ReportTargetType.JOB,
        targetJobId: jobId,
        reason,
        description: description?.trim() || null,
      },
    });
  }

  async hasReportedJob(reporterUserId: string, jobId: string) {
    return this.prisma.report.findFirst({
      where: {
        reporterUserId,
        targetType: ReportTargetType.JOB,
        targetJobId: jobId,
      },
      select: { id: true },
    });
  }

  async listModerationQueue() {
    return this.prisma.job.findMany({
      where: {
        deletedAt: null,
        OR: [{ isSuspicious: true }, { reports: { some: { status: 'OPEN' } } }],
      },
      select: {
        ...COMPANY_JOB_SELECT,
        isSuspicious: true,
        suspiciousReasons: true,
        company: {
          select: {
            id: true,
            tradeName: true,
            sector: true,
            logoUrl: true,
            verificationStatus: true,
          },
        },
        reports: {
          where: { status: 'OPEN' },
          select: { id: true, reason: true, description: true, status: true, createdAt: true },
          orderBy: { createdAt: 'desc' },
        },
      },
      orderBy: [{ isSuspicious: 'desc' }, { updatedAt: 'desc' }],
    });
  }

  private toSkillCreates(skills: JobSkillInputDto[]) {
    return skills.map((skill) => ({
      skillId: skill.skillId,
      requirementType: skill.requirementType,
      weight: skill.weight,
      ...(skill.minimumLevel ? { minimumLevel: skill.minimumLevel } : {}),
    }));
  }
}
