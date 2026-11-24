import { Injectable } from '@nestjs/common';
import {
  ConsentRecord,
  ConsentType,
  Prisma,
  User,
  UserRole,
  UserStatus,
} from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';

export interface CreateConsentInput {
  userId: string;
  consentType: ConsentType;
  documentVersion: string;
  accepted: boolean;
  ipAddress?: string;
  userAgent?: string;
}

/**
 * Repositorio de usuarios, consentimentos LGPD e encerramento de conta.
 */
@Injectable()
export class UsersRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findById(id: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { id } });
  }

  async findByEmail(email: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { email: email.toLowerCase().trim() } });
  }

  async listConsentsByUserId(userId: string): Promise<ConsentRecord[]> {
    return this.prisma.consentRecord.findMany({
      where: { userId },
      orderBy: { consentedAt: 'desc' },
    });
  }

  async deactivateAccount(userId: string, scheduledDeletionAt: Date, reason?: string): Promise<void> {
    const now = new Date();
    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id: userId },
        data: {
          status: UserStatus.DEACTIVATED,
          deactivatedAt: now,
          scheduledDeletionAt,
        },
      });

      await tx.refreshToken.updateMany({
        where: { userId, revokedAt: null },
        data: { revokedAt: now },
      });

      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          action: 'ACCOUNT_DEACTIVATED',
          entityType: 'User',
          entityId: userId,
          metadata: {
            scheduledDeletionAt: scheduledDeletionAt.toISOString(),
            reason: reason ?? null,
          } as Prisma.InputJsonValue,
        },
      });
    });
  }

  async reactivateAccount(userId: string): Promise<void> {
    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id: userId },
        data: {
          status: UserStatus.ACTIVE,
          deactivatedAt: null,
          scheduledDeletionAt: null,
          failedLoginAttempts: 0,
          lockedUntil: null,
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          action: 'ACCOUNT_REACTIVATED',
          entityType: 'User',
          entityId: userId,
        },
      });
    });
  }

  async anonymizeAndDeleteAccount(
    userId: string,
    role: UserRole,
    unusablePasswordHash: string,
  ): Promise<void> {
    const now = new Date();
    const anonymizedEmail = `deleted+${userId}@anonymized.jobkeep.local`;

    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id: userId },
        data: {
          email: anonymizedEmail,
          passwordHash: unusablePasswordHash,
          status: UserStatus.DELETED,
          deletedAt: now,
          deactivatedAt: now,
          scheduledDeletionAt: now,
          failedLoginAttempts: 0,
          lockedUntil: null,
        },
      });

      if (role === UserRole.CANDIDATE) {
        const profile = await tx.candidateProfile.findUnique({ where: { userId } });
        if (profile) {
          await tx.experience.deleteMany({ where: { candidateId: profile.id } });
          await tx.education.deleteMany({ where: { candidateId: profile.id } });
          await tx.resume.deleteMany({ where: { candidateId: profile.id } });
          await tx.candidateSkill.deleteMany({ where: { candidateId: profile.id } });
          await tx.candidateProfile.update({
            where: { id: profile.id },
            data: {
              fullName: 'Usuario Removido',
              headline: null,
              bio: null,
              city: null,
              state: null,
              links: Prisma.DbNull,
              visibilitySettings: Prisma.DbNull,
              resumeUrl: null,
              photoUrl: null,
              photoThumbnailUrl: null,
            },
          });
        }
      }

      if (role === UserRole.COMPANY) {
        await tx.companyMember.deleteMany({ where: { userId } });
      }

      await tx.refreshToken.updateMany({
        where: { userId, revokedAt: null },
        data: { revokedAt: now },
      });
      await tx.emailVerificationToken.deleteMany({ where: { userId } });
      await tx.passwordResetToken.deleteMany({ where: { userId } });
      await tx.devicePushToken.deleteMany({ where: { userId } });

      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          action: 'ACCOUNT_PERMANENTLY_DELETED_LGPD',
          entityType: 'User',
          entityId: userId,
          metadata: { anonymizedAt: now.toISOString() } as Prisma.InputJsonValue,
        },
      });
    });
  }
}
