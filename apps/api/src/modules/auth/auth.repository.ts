import { Injectable } from '@nestjs/common';
import {
  CompanyMemberRole,
  CompanySize,
  CompanyVerificationStatus,
  ConsentType,
  EmailVerificationToken,
  PasswordResetToken,
  Prisma,
  RefreshToken,
  User,
  UserRole,
  UserStatus,
} from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';

export interface CreateCandidateAccountInput {
  email: string;
  passwordHash: string;
  fullName: string;
  termsVersion: string;
  privacyPolicyVersion: string;
  ipAddress?: string;
  userAgent?: string;
  verificationCodeHash: string;
  verificationLinkTokenHash: string;
  verificationExpiresAt: Date;
}

export interface CreateCompanyAccountInput {
  email: string;
  passwordHash: string;
  legalName: string;
  tradeName: string;
  cnpj: string;
  sector: string;
  size: CompanySize;
  termsVersion: string;
  privacyPolicyVersion: string;
  ipAddress?: string;
  userAgent?: string;
  verificationCodeHash: string;
  verificationLinkTokenHash: string;
  verificationExpiresAt: Date;
}

export interface CreateRefreshTokenInput {
  id: string;
  userId: string;
  tokenHash: string;
  familyId: string;
  deviceName?: string;
  platform?: string;
  userAgent?: string;
  ipAddress?: string;
  expiresAt: Date;
}

/**
 * Repositorio do modulo de autenticacao, sessoes e tokens temporarios.
 */
@Injectable()
export class AuthRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findUserByEmail(email: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { email: email.toLowerCase().trim() } });
  }

  async findUserById(id: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { id } });
  }

  async existsCompanyByCnpj(cnpj: string): Promise<boolean> {
    const count = await this.prisma.companyProfile.count({ where: { cnpj } });
    return count > 0;
  }

  async createCandidateAccount(input: CreateCandidateAccountInput): Promise<User> {
    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
        data: {
          email: input.email.toLowerCase().trim(),
          passwordHash: input.passwordHash,
          role: UserRole.CANDIDATE,
          status: UserStatus.ACTIVE,
          candidateProfile: {
            create: {
              fullName: input.fullName.trim(),
            },
          },
          preferences: {
            create: {
              notificationSettings: {
                newMatch: true,
                newMessage: true,
                applicationUpdates: true,
                channels: ['IN_APP', 'PUSH', 'EMAIL'],
              },
              privacySettings: {
                hideFullNameBeforeMatch: false,
                hidePhotoBeforeMatch: false,
              },
              savedFilters: {},
            },
          },
          consentRecords: {
            create: [
              {
                consentType: ConsentType.TERMS_OF_USE,
                documentVersion: input.termsVersion,
                accepted: true,
                ipAddress: input.ipAddress,
                userAgent: input.userAgent,
              },
              {
                consentType: ConsentType.PRIVACY_POLICY,
                documentVersion: input.privacyPolicyVersion,
                accepted: true,
                ipAddress: input.ipAddress,
                userAgent: input.userAgent,
              },
            ],
          },
          emailVerificationCodes: {
            create: {
              codeHash: input.verificationCodeHash,
              linkTokenHash: input.verificationLinkTokenHash,
              expiresAt: input.verificationExpiresAt,
            },
          },
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId: user.id,
          action: 'CANDIDATE_REGISTERED',
          entityType: 'User',
          entityId: user.id,
          ipAddress: input.ipAddress,
          userAgent: input.userAgent,
        },
      });

      return user;
    });
  }

  async createCompanyAccount(input: CreateCompanyAccountInput): Promise<User> {
    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
        data: {
          email: input.email.toLowerCase().trim(),
          passwordHash: input.passwordHash,
          role: UserRole.COMPANY,
          status: UserStatus.ACTIVE,
          preferences: {
            create: {
              notificationSettings: {
                newMatch: true,
                newMessage: true,
                applicationUpdates: true,
                channels: ['IN_APP', 'PUSH', 'EMAIL'],
              },
              privacySettings: {},
              savedFilters: {},
            },
          },
          consentRecords: {
            create: [
              {
                consentType: ConsentType.TERMS_OF_USE,
                documentVersion: input.termsVersion,
                accepted: true,
                ipAddress: input.ipAddress,
                userAgent: input.userAgent,
              },
              {
                consentType: ConsentType.PRIVACY_POLICY,
                documentVersion: input.privacyPolicyVersion,
                accepted: true,
                ipAddress: input.ipAddress,
                userAgent: input.userAgent,
              },
            ],
          },
          emailVerificationCodes: {
            create: {
              codeHash: input.verificationCodeHash,
              linkTokenHash: input.verificationLinkTokenHash,
              expiresAt: input.verificationExpiresAt,
            },
          },
        },
      });

      await tx.companyProfile.create({
        data: {
          legalName: input.legalName.trim(),
          tradeName: input.tradeName.trim(),
          cnpj: input.cnpj,
          sector: input.sector.trim(),
          size: input.size,
          verificationStatus: CompanyVerificationStatus.PENDING,
          members: {
            create: {
              userId: user.id,
              role: CompanyMemberRole.OWNER,
            },
          },
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId: user.id,
          action: 'COMPANY_REGISTERED',
          entityType: 'User',
          entityId: user.id,
          metadata: { cnpj: input.cnpj } as Prisma.InputJsonValue,
          ipAddress: input.ipAddress,
          userAgent: input.userAgent,
        },
      });

      return user;
    });
  }

  async findLatestActiveVerificationToken(userId: string): Promise<EmailVerificationToken | null> {
    return this.prisma.emailVerificationToken.findFirst({
      where: { userId, usedAt: null },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findVerificationTokenByLinkHash(
    linkTokenHash: string,
  ): Promise<(EmailVerificationToken & { user: User }) | null> {
    return this.prisma.emailVerificationToken.findUnique({
      where: { linkTokenHash },
      include: { user: true },
    });
  }

  async replaceEmailVerificationToken(
    userId: string,
    codeHash: string,
    linkTokenHash: string,
    expiresAt: Date,
  ): Promise<void> {
    const now = new Date();
    await this.prisma.$transaction(async (tx) => {
      await tx.emailVerificationToken.updateMany({
        where: { userId, usedAt: null },
        data: { usedAt: now },
      });
      await tx.emailVerificationToken.create({
        data: {
          userId,
          codeHash,
          linkTokenHash,
          expiresAt,
        },
      });
    });
  }

  async incrementVerificationAttempts(tokenId: string): Promise<void> {
    await this.prisma.emailVerificationToken.update({
      where: { id: tokenId },
      data: { attempts: { increment: 1 } },
    });
  }

  async markEmailVerified(userId: string, tokenId: string): Promise<void> {
    const now = new Date();
    await this.prisma.$transaction(async (tx) => {
      await tx.emailVerificationToken.update({
        where: { id: tokenId },
        data: { usedAt: now },
      });
      await tx.user.update({
        where: { id: userId },
        data: { emailVerifiedAt: now },
      });
    });
  }

  async recordFailedLoginAttempt(
    userId: string,
    attempts: number,
    lockedUntil: Date | null,
  ): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: {
        failedLoginAttempts: attempts,
        lockedUntil,
      },
    });
  }

  async resetFailedLoginAttempts(userId: string): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: {
        failedLoginAttempts: 0,
        lockedUntil: null,
      },
    });
  }

  async createRefreshToken(input: CreateRefreshTokenInput): Promise<RefreshToken> {
    return this.prisma.refreshToken.create({
      data: {
        id: input.id,
        userId: input.userId,
        tokenHash: input.tokenHash,
        familyId: input.familyId,
        deviceName: input.deviceName,
        platform: input.platform,
        userAgent: input.userAgent,
        ipAddress: input.ipAddress,
        lastUsedAt: new Date(),
        expiresAt: input.expiresAt,
      },
    });
  }

  async findRefreshTokenByHash(
    tokenHash: string,
  ): Promise<(RefreshToken & { user: User }) | null> {
    return this.prisma.refreshToken.findUnique({
      where: { tokenHash },
      include: { user: true },
    });
  }

  async rotateRefreshToken(
    oldTokenId: string,
    nextToken: CreateRefreshTokenInput,
  ): Promise<RefreshToken> {
    const now = new Date();
    return this.prisma.$transaction(async (tx) => {
      await tx.refreshToken.update({
        where: { id: oldTokenId },
        data: {
          revokedAt: now,
          replacedByTokenId: nextToken.id,
        },
      });

      return tx.refreshToken.create({
        data: {
          id: nextToken.id,
          userId: nextToken.userId,
          tokenHash: nextToken.tokenHash,
          familyId: nextToken.familyId,
          deviceName: nextToken.deviceName,
          platform: nextToken.platform,
          userAgent: nextToken.userAgent,
          ipAddress: nextToken.ipAddress,
          lastUsedAt: now,
          expiresAt: nextToken.expiresAt,
        },
      });
    });
  }

  async revokeRefreshTokenFamily(familyId: string): Promise<void> {
    await this.prisma.refreshToken.updateMany({
      where: { familyId, revokedAt: null },
      data: { revokedAt: new Date() },
    });
  }

  async revokeRefreshTokenById(id: string, userId: string): Promise<number> {
    const result = await this.prisma.refreshToken.updateMany({
      where: { id, userId, revokedAt: null },
      data: { revokedAt: new Date() },
    });
    return result.count;
  }

  async revokeRefreshTokenByHash(tokenHash: string, userId: string): Promise<void> {
    await this.prisma.refreshToken.updateMany({
      where: { tokenHash, userId, revokedAt: null },
      data: { revokedAt: new Date() },
    });
  }

  async revokeAllUserSessions(userId: string): Promise<void> {
    await this.prisma.refreshToken.updateMany({
      where: { userId, revokedAt: null },
      data: { revokedAt: new Date() },
    });
  }

  async listActiveSessions(userId: string): Promise<RefreshToken[]> {
    return this.prisma.refreshToken.findMany({
      where: {
        userId,
        revokedAt: null,
        expiresAt: { gt: new Date() },
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async replacePasswordResetToken(
    userId: string,
    codeHash: string,
    tokenHash: string,
    expiresAt: Date,
  ): Promise<void> {
    const now = new Date();
    await this.prisma.$transaction(async (tx) => {
      await tx.passwordResetToken.updateMany({
        where: { userId, usedAt: null },
        data: { usedAt: now },
      });
      await tx.passwordResetToken.create({
        data: {
          userId,
          codeHash,
          tokenHash,
          expiresAt,
        },
      });
    });
  }

  async findLatestActivePasswordResetToken(userId: string): Promise<PasswordResetToken | null> {
    return this.prisma.passwordResetToken.findFirst({
      where: { userId, usedAt: null },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findPasswordResetTokenByHash(
    tokenHash: string,
  ): Promise<(PasswordResetToken & { user: User }) | null> {
    return this.prisma.passwordResetToken.findUnique({
      where: { tokenHash },
      include: { user: true },
    });
  }

  async incrementPasswordResetAttempts(tokenId: string): Promise<void> {
    await this.prisma.passwordResetToken.update({
      where: { id: tokenId },
      data: { attempts: { increment: 1 } },
    });
  }

  async completePasswordReset(
    userId: string,
    tokenId: string,
    newPasswordHash: string,
  ): Promise<void> {
    const now = new Date();
    await this.prisma.$transaction(async (tx) => {
      await tx.passwordResetToken.update({
        where: { id: tokenId },
        data: { usedAt: now },
      });
      await tx.user.update({
        where: { id: userId },
        data: {
          passwordHash: newPasswordHash,
          failedLoginAttempts: 0,
          lockedUntil: null,
        },
      });
      // Revoga todas as sessoes ativas apos redefinicao de senha
      await tx.refreshToken.updateMany({
        where: { userId, revokedAt: null },
        data: { revokedAt: now },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          action: 'PASSWORD_RESET_COMPLETED',
          entityType: 'User',
          entityId: userId,
        },
      });
    });
  }
}
