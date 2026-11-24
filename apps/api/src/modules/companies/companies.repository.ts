import { Injectable } from '@nestjs/common';
import {
  CompanyInvitation,
  CompanyMember,
  CompanyMemberRole,
  CompanyProfile,
  CompanyVerificationStatus,
  Prisma,
  ThemeSettings,
  User,
} from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';

export type CompanyWithMembership = CompanyProfile & {
  themeSettings: ThemeSettings | null;
  members: Array<CompanyMember & { user: Pick<User, 'id' | 'email' | 'role' | 'status'> }>;
};

/**
 * Repositorio do perfil empresarial, membros recrutadores e convites.
 */
@Injectable()
export class CompaniesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findCompanyMembershipForUser(
    userId: string,
  ): Promise<(CompanyMember & { company: CompanyWithMembership }) | null> {
    return this.prisma.companyMember.findFirst({
      where: { userId, company: { deletedAt: null } },
      include: {
        company: {
          include: {
            themeSettings: true,
            members: {
              include: {
                user: { select: { id: true, email: true, role: true, status: true } },
              },
              orderBy: { createdAt: 'asc' },
            },
          },
        },
      },
    });
  }

  async findCompanyById(companyId: string): Promise<CompanyProfile | null> {
    return this.prisma.companyProfile.findFirst({
      where: { id: companyId, deletedAt: null },
    });
  }

  async findPublicCompanyById(companyId: string) {
    return this.prisma.companyProfile.findFirst({
      where: { id: companyId, deletedAt: null },
      select: {
        id: true,
        tradeName: true,
        sector: true,
        size: true,
        description: true,
        logoUrl: true,
        websiteUrl: true,
        city: true,
        state: true,
        verificationStatus: true,
        themeSettings: true,
      },
    });
  }

  async updateCompany(
    companyId: string,
    data: Prisma.CompanyProfileUpdateInput,
  ): Promise<CompanyProfile> {
    return this.prisma.companyProfile.update({
      where: { id: companyId },
      data,
    });
  }

  async softDeleteCompany(companyId: string): Promise<{ closedJobsCount: number }> {
    const activeApplicationStatuses = [
      'INTERESTED',
      'MATCHED',
      'IN_REVIEW',
      'INTERVIEW',
      'OFFER',
    ] as const;
    return this.prisma.$transaction(async (tx) => {
      const now = new Date();
      const jobs = await tx.job.findMany({
        where: {
          companyId,
          deletedAt: null,
          status: { in: ['DRAFT', 'ACTIVE', 'PAUSED'] },
        },
        include: {
          applications: {
            where: { status: { in: [...activeApplicationStatuses] } },
            select: { id: true, candidate: { select: { userId: true } } },
          },
        },
      });

      for (const job of jobs) {
        if (job.applications.length > 0) {
          await tx.notification.createMany({
            data: job.applications.map(({ id, candidate }) => ({
              userId: candidate.userId,
              type: 'SYSTEM',
              title: 'Vaga encerrada',
              body: `A vaga "${job.title}" foi encerrada porque a empresa desativou seu perfil. Sua candidatura permanece registrada.`,
              payload: { jobId: job.id, applicationId: id, event: 'JOB_CLOSED' },
              channel: 'IN_APP',
              sentAt: now,
            })),
          });
        }
      }

      await tx.job.updateMany({
        where: {
          companyId,
          deletedAt: null,
          status: { in: ['DRAFT', 'ACTIVE', 'PAUSED'] },
        },
        data: { status: 'CLOSED', closedAt: now },
      });
      await tx.companyProfile.update({
        where: { id: companyId },
        data: { deletedAt: now },
      });
      return { closedJobsCount: jobs.length };
    });
  }

  async createInvitation(input: {
    companyId: string;
    email: string;
    role: CompanyMemberRole;
    tokenHash: string;
    invitedByUserId: string;
    expiresAt: Date;
  }): Promise<CompanyInvitation> {
    return this.prisma.companyInvitation.create({ data: input });
  }

  async findInvitationByTokenHash(tokenHash: string): Promise<CompanyInvitation | null> {
    return this.prisma.companyInvitation.findUnique({ where: { tokenHash } });
  }

  async acceptInvitation(invitation: CompanyInvitation, userId: string): Promise<CompanyMember> {
    return this.prisma.$transaction(async (tx) => {
      await tx.companyInvitation.update({
        where: { id: invitation.id },
        data: { acceptedAt: new Date() },
      });

      return tx.companyMember.upsert({
        where: {
          userId_companyId: {
            userId,
            companyId: invitation.companyId,
          },
        },
        update: { role: invitation.role },
        create: {
          userId,
          companyId: invitation.companyId,
          role: invitation.role,
        },
      });
    });
  }

  async removeMember(companyId: string, memberId: string): Promise<number> {
    const result = await this.prisma.companyMember.deleteMany({
      where: { id: memberId, companyId },
    });
    return result.count;
  }

  async updateVerificationStatus(
    companyId: string,
    status: CompanyVerificationStatus,
    adminUserId: string,
    notes?: string,
  ): Promise<CompanyProfile> {
    const now = new Date();
    return this.prisma.$transaction(async (tx) => {
      const updated = await tx.companyProfile.update({
        where: { id: companyId },
        data: {
          verificationStatus: status,
          verifiedAt: status === CompanyVerificationStatus.VERIFIED ? now : null,
          verificationNotes: notes ?? null,
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId: adminUserId,
          action: 'COMPANY_VERIFICATION_UPDATED',
          entityType: 'CompanyProfile',
          entityId: companyId,
          metadata: { status, notes: notes ?? null },
        },
      });

      return updated;
    });
  }
}
