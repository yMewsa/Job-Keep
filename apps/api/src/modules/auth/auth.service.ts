import { HttpStatus, Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { User, UserStatus } from '@prisma/client';
import { randomUUID } from 'node:crypto';
import { AppEnv } from '../../common/config/env.schema';
import { DomainException } from '../../common/exceptions/domain.exception';
import { AccessTokenPayload } from '../../common/guards/jwt-auth.guard';
import { normalizeCnpj } from '../../common/validators/cnpj.validator';
import { MailerService } from '../../infrastructure/mail/mailer.service';
import { AuthRepository } from './auth.repository';
import {
  EmailOnlyDto,
  LoginDto,
  LogoutDto,
  RefreshTokenDto,
  RegisterCandidateDto,
  RegisterCompanyDto,
  ResetPasswordDto,
  VerifyEmailDto,
} from './dto/auth.dto';
import {
  AuthTokensResponseDto,
  AuthUserDto,
  MessageResponseDto,
  RegisterResponseDto,
  SessionDto,
} from './dto/auth-response.dto';
import {
  generateOpaqueToken,
  generateSixDigitOtp,
  hashPassword,
  safeCompareHex,
  sha256Hex,
  verifyPassword,
} from './utils/crypto.util';

export interface RequestClientContext {
  ipAddress?: string;
  userAgent?: string;
}

const OTP_EXPIRATION_MINUTES = 15;
const MAX_OTP_ATTEMPTS = 5;
const ACCESS_TOKEN_EXPIRES_IN_SECONDS = 15 * 60;

/**
 * Regras de negocio para registro, login, sessoes JWT/Refresh, verificacao e recuperacao de senha.
 */
@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    private readonly authRepository: AuthRepository,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService<AppEnv, true>,
    private readonly mailerService: MailerService,
  ) {}

  async registerCandidate(
    dto: RegisterCandidateDto,
    ctx: RequestClientContext,
  ): Promise<RegisterResponseDto> {
    this.ensureRequiredConsents(dto.acceptTerms, dto.acceptPrivacyPolicy);

    const existing = await this.authRepository.findUserByEmail(dto.email);
    if (existing) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'EMAIL_ALREADY_IN_USE',
        'Nao foi possivel concluir o cadastro com este e-mail.',
      );
    }

    const passwordHash = await hashPassword(dto.password);
    const code = generateSixDigitOtp();
    const linkToken = generateOpaqueToken(24);
    const expiresAt = this.minutesFromNow(OTP_EXPIRATION_MINUTES);

    const user = await this.authRepository.createCandidateAccount({
      email: dto.email,
      passwordHash,
      fullName: dto.fullName,
      termsVersion: dto.termsVersion ?? '1.0.0',
      privacyPolicyVersion: dto.privacyPolicyVersion ?? '1.0.0',
      ipAddress: ctx.ipAddress,
      userAgent: ctx.userAgent,
      verificationCodeHash: sha256Hex(code),
      verificationLinkTokenHash: sha256Hex(linkToken),
      verificationExpiresAt: expiresAt,
    });

    await this.sendVerificationEmail(user.email, code, linkToken);

    return {
      message: 'Cadastro realizado com sucesso. Verifique seu e-mail com o codigo enviado.',
      user: this.toAuthUserDto(user),
      ...(this.shouldExposeDevCode() ? { devVerificationCode: code } : {}),
    };
  }

  async registerCompany(
    dto: RegisterCompanyDto,
    ctx: RequestClientContext,
  ): Promise<RegisterResponseDto> {
    this.ensureRequiredConsents(dto.acceptTerms, dto.acceptPrivacyPolicy);

    const normalizedCnpj = normalizeCnpj(dto.cnpj);
    const existingUser = await this.authRepository.findUserByEmail(dto.email);
    if (existingUser) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'EMAIL_ALREADY_IN_USE',
        'Nao foi possivel concluir o cadastro com este e-mail.',
      );
    }

    const cnpjExists = await this.authRepository.existsCompanyByCnpj(normalizedCnpj);
    if (cnpjExists) {
      throw new DomainException(
        HttpStatus.CONFLICT,
        'CNPJ_ALREADY_REGISTERED',
        'Ja existe uma empresa cadastrada com este CNPJ.',
      );
    }

    const passwordHash = await hashPassword(dto.password);
    const code = generateSixDigitOtp();
    const linkToken = generateOpaqueToken(24);
    const expiresAt = this.minutesFromNow(OTP_EXPIRATION_MINUTES);

    const user = await this.authRepository.createCompanyAccount({
      email: dto.email,
      passwordHash,
      legalName: dto.legalName,
      tradeName: dto.tradeName,
      cnpj: normalizedCnpj,
      sector: dto.sector,
      size: dto.size,
      termsVersion: dto.termsVersion ?? '1.0.0',
      privacyPolicyVersion: dto.privacyPolicyVersion ?? '1.0.0',
      ipAddress: ctx.ipAddress,
      userAgent: ctx.userAgent,
      verificationCodeHash: sha256Hex(code),
      verificationLinkTokenHash: sha256Hex(linkToken),
      verificationExpiresAt: expiresAt,
    });

    await this.sendVerificationEmail(user.email, code, linkToken);

    return {
      message:
        'Empresa cadastrada com sucesso. Verifique seu e-mail e aguarde a validacao administrativa do CNPJ.',
      user: this.toAuthUserDto(user),
      ...(this.shouldExposeDevCode() ? { devVerificationCode: code } : {}),
    };
  }

  async verifyEmail(dto: VerifyEmailDto): Promise<MessageResponseDto> {
    if (dto.token) {
      const tokenRecord = await this.authRepository.findVerificationTokenByLinkHash(
        sha256Hex(dto.token),
      );
      if (
        !tokenRecord ||
        tokenRecord.usedAt !== null ||
        tokenRecord.expiresAt.getTime() < Date.now()
      ) {
        throw new DomainException(
          HttpStatus.BAD_REQUEST,
          'EMAIL_VERIFICATION_INVALID',
          'Codigo ou link de verificacao invalido ou expirado.',
        );
      }

      await this.authRepository.markEmailVerified(tokenRecord.userId, tokenRecord.id);
      return { message: 'E-mail verificado com sucesso.' };
    }

    if (!dto.email || !dto.code) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'EMAIL_VERIFICATION_PARAMS_REQUIRED',
        'Informe e-mail e codigo de 6 digitos ou o token de verificacao.',
      );
    }

    const user = await this.authRepository.findUserByEmail(dto.email);
    if (!user || user.status === UserStatus.DELETED) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'EMAIL_VERIFICATION_INVALID',
        'Codigo de verificacao invalido ou expirado.',
      );
    }

    if (user.emailVerifiedAt) {
      return { message: 'E-mail verificado com sucesso.' };
    }

    const tokenRecord = await this.authRepository.findLatestActiveVerificationToken(user.id);
    if (
      !tokenRecord ||
      tokenRecord.expiresAt.getTime() < Date.now() ||
      tokenRecord.attempts >= MAX_OTP_ATTEMPTS
    ) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'EMAIL_VERIFICATION_INVALID',
        'Codigo de verificacao invalido ou expirado. Solicite um novo codigo.',
      );
    }

    const candidateHash = sha256Hex(dto.code.trim());
    if (!safeCompareHex(candidateHash, tokenRecord.codeHash)) {
      await this.authRepository.incrementVerificationAttempts(tokenRecord.id);
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'EMAIL_VERIFICATION_INVALID',
        'Codigo de verificacao invalido ou expirado.',
      );
    }

    await this.authRepository.markEmailVerified(user.id, tokenRecord.id);
    return { message: 'E-mail verificado com sucesso.' };
  }

  async resendVerification(dto: EmailOnlyDto): Promise<MessageResponseDto> {
    const genericMessage =
      'Se o e-mail estiver cadastrado e pendente de verificacao, enviaremos um novo codigo.';
    const user = await this.authRepository.findUserByEmail(dto.email);

    if (!user || user.status !== UserStatus.ACTIVE || user.emailVerifiedAt) {
      return { message: genericMessage };
    }

    const code = generateSixDigitOtp();
    const linkToken = generateOpaqueToken(24);
    await this.authRepository.replaceEmailVerificationToken(
      user.id,
      sha256Hex(code),
      sha256Hex(linkToken),
      this.minutesFromNow(OTP_EXPIRATION_MINUTES),
    );

    await this.sendVerificationEmail(user.email, code, linkToken);

    return {
      message: genericMessage,
      ...(this.shouldExposeDevCode() ? { devCode: code } : {}),
    };
  }

  async login(dto: LoginDto, ctx: RequestClientContext): Promise<AuthTokensResponseDto> {
    const user = await this.authRepository.findUserByEmail(dto.email);

    if (!user || user.status === UserStatus.DELETED) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_INVALID_CREDENTIALS',
        'E-mail ou senha invalidos.',
      );
    }

    if (user.lockedUntil && user.lockedUntil.getTime() > Date.now()) {
      throw new DomainException(
        HttpStatus.TOO_MANY_REQUESTS,
        'AUTH_TEMPORARILY_LOCKED',
        'Muitas tentativas de login sem sucesso. Aguarde alguns minutos e tente novamente.',
      );
    }

    const passwordValid = await verifyPassword(user.passwordHash, dto.password);
    if (!passwordValid) {
      const maxAttempts = this.configService.get('LOGIN_MAX_ATTEMPTS', { infer: true });
      const lockoutMinutes = this.configService.get('LOGIN_LOCKOUT_MINUTES', { infer: true });
      const nextAttempts = user.failedLoginAttempts + 1;
      const shouldLock = nextAttempts >= maxAttempts;

      await this.authRepository.recordFailedLoginAttempt(
        user.id,
        shouldLock ? 0 : nextAttempts,
        shouldLock ? this.minutesFromNow(lockoutMinutes) : null,
      );

      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_INVALID_CREDENTIALS',
        'E-mail ou senha invalidos.',
      );
    }

    if (user.status === UserStatus.SUSPENDED) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'ACCOUNT_SUSPENDED',
        'Sua conta esta suspensa. Entre em contato com o suporte.',
      );
    }

    if (user.status === UserStatus.DEACTIVATED) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'ACCOUNT_DEACTIVATED',
        'Sua conta esta temporariamente desativada. Reative-a antes de entrar.',
      );
    }

    if (!user.emailVerifiedAt) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'EMAIL_NOT_VERIFIED',
        'Confirme seu e-mail com o codigo enviado antes de fazer login.',
      );
    }

    if (user.failedLoginAttempts > 0 || user.lockedUntil !== null) {
      await this.authRepository.resetFailedLoginAttempts(user.id);
    }

    return this.issueSessionTokens(user, {
      deviceName: dto.deviceName,
      platform: dto.platform,
      ipAddress: ctx.ipAddress,
      userAgent: ctx.userAgent,
    });
  }

  async refresh(
    dto: RefreshTokenDto,
    ctx: RequestClientContext,
  ): Promise<AuthTokensResponseDto> {
    const tokenHash = sha256Hex(dto.refreshToken.trim());
    const stored = await this.authRepository.findRefreshTokenByHash(tokenHash);

    if (!stored) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_REFRESH_INVALID',
        'Sessao invalida ou expirada. Faca login novamente.',
      );
    }

    // Deteccao de reuso de refresh token ja rotacionado/revogado -> revoga toda a familia
    if (stored.revokedAt !== null || stored.replacedByTokenId !== null) {
      this.logger.warn(`Reuso de refresh token detectado para familia ${stored.familyId}`);
      await this.authRepository.revokeRefreshTokenFamily(stored.familyId);
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_REFRESH_REUSE_DETECTED',
        'Sessao invalidada por seguranca. Faca login novamente.',
      );
    }

    if (
      stored.expiresAt.getTime() < Date.now() ||
      stored.user.status !== UserStatus.ACTIVE
    ) {
      await this.authRepository.revokeRefreshTokenFamily(stored.familyId);
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_REFRESH_EXPIRED',
        'Sessao expirada. Faca login novamente.',
      );
    }

    const nextSessionId = randomUUID();
    const rawRefreshToken = generateOpaqueToken(48);
    const refreshDays = this.configService.get('JWT_REFRESH_EXPIRES_DAYS', { infer: true });
    const expiresAt = new Date(Date.now() + refreshDays * 24 * 60 * 60 * 1000);

    await this.authRepository.rotateRefreshToken(stored.id, {
      id: nextSessionId,
      userId: stored.userId,
      tokenHash: sha256Hex(rawRefreshToken),
      familyId: stored.familyId,
      deviceName: stored.deviceName ?? undefined,
      platform: stored.platform ?? undefined,
      ipAddress: ctx.ipAddress ?? stored.ipAddress ?? undefined,
      userAgent: ctx.userAgent ?? stored.userAgent ?? undefined,
      expiresAt,
    });

    const accessToken = await this.signAccessToken(stored.user, nextSessionId);

    return {
      accessToken,
      refreshToken: rawRefreshToken,
      expiresInSeconds: ACCESS_TOKEN_EXPIRES_IN_SECONDS,
      user: this.toAuthUserDto(stored.user),
    };
  }

  async logout(userId: string, sessionId: string, dto: LogoutDto): Promise<MessageResponseDto> {
    if (dto.refreshToken) {
      await this.authRepository.revokeRefreshTokenByHash(sha256Hex(dto.refreshToken), userId);
    } else {
      await this.authRepository.revokeRefreshTokenById(sessionId, userId);
    }
    return { message: 'Sessao encerrada com sucesso.' };
  }

  async listSessions(userId: string, currentSessionId: string): Promise<SessionDto[]> {
    const sessions = await this.authRepository.listActiveSessions(userId);
    return sessions.map((session) => ({
      id: session.id,
      deviceName: session.deviceName,
      platform: session.platform,
      ipAddress: session.ipAddress,
      lastUsedAt: session.lastUsedAt,
      createdAt: session.createdAt,
      expiresAt: session.expiresAt,
      isCurrent: session.id === currentSessionId,
    }));
  }

  async revokeSession(userId: string, sessionId: string): Promise<MessageResponseDto> {
    const count = await this.authRepository.revokeRefreshTokenById(sessionId, userId);
    if (count === 0) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'SESSION_NOT_FOUND',
        'Sessao nao encontrada ou ja encerrada.',
      );
    }
    return { message: 'Dispositivo desconectado com sucesso.' };
  }

  async logoutAllDevices(userId: string): Promise<MessageResponseDto> {
    await this.authRepository.revokeAllUserSessions(userId);
    return { message: 'Todas as sessoes ativas foram encerradas.' };
  }

  async forgotPassword(dto: EmailOnlyDto): Promise<MessageResponseDto> {
    const genericMessage =
      'Se o e-mail estiver cadastrado, enviaremos um codigo de 6 digitos para redefinicao de senha.';
    const user = await this.authRepository.findUserByEmail(dto.email);

    if (!user || user.status === UserStatus.DELETED || user.status === UserStatus.SUSPENDED) {
      return { message: genericMessage };
    }

    const code = generateSixDigitOtp();
    const linkToken = generateOpaqueToken(24);
    await this.authRepository.replacePasswordResetToken(
      user.id,
      sha256Hex(code),
      sha256Hex(linkToken),
      this.minutesFromNow(OTP_EXPIRATION_MINUTES),
    );

    const publicUrl = this.configService.get('APP_PUBLIC_URL', { infer: true });
    await this.mailerService.sendMail({
      to: user.email,
      subject: 'Job Keep — Codigo para redefinir sua senha',
      text: `Use o codigo ${code} (valido por ${OTP_EXPIRATION_MINUTES} minutos) ou acesse ${publicUrl}/reset-password?token=${linkToken}.`,
      html: `<p>Seu codigo de recuperacao de senha e <strong>${code}</strong> (valido por ${OTP_EXPIRATION_MINUTES} minutos).</p>`,
    });

    return {
      message: genericMessage,
      ...(this.shouldExposeDevCode() ? { devCode: code } : {}),
    };
  }

  async resetPassword(dto: ResetPasswordDto): Promise<MessageResponseDto> {
    const newPasswordHash = await hashPassword(dto.newPassword);

    if (dto.token) {
      const record = await this.authRepository.findPasswordResetTokenByHash(sha256Hex(dto.token));
      if (!record || record.usedAt !== null || record.expiresAt.getTime() < Date.now()) {
        throw new DomainException(
          HttpStatus.BAD_REQUEST,
          'PASSWORD_RESET_INVALID',
          'Codigo ou link de recuperacao invalido ou expirado.',
        );
      }

      await this.authRepository.completePasswordReset(record.userId, record.id, newPasswordHash);
      return {
        message: 'Senha redefinida com sucesso. Todas as sessoes anteriores foram encerradas.',
      };
    }

    if (!dto.email || !dto.code) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'PASSWORD_RESET_PARAMS_REQUIRED',
        'Informe e-mail e codigo de 6 digitos ou o token de recuperacao.',
      );
    }

    const user = await this.authRepository.findUserByEmail(dto.email);
    if (!user || user.status === UserStatus.DELETED) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'PASSWORD_RESET_INVALID',
        'Codigo de recuperacao invalido ou expirado.',
      );
    }

    const record = await this.authRepository.findLatestActivePasswordResetToken(user.id);
    if (
      !record ||
      record.expiresAt.getTime() < Date.now() ||
      record.attempts >= MAX_OTP_ATTEMPTS
    ) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'PASSWORD_RESET_INVALID',
        'Codigo de recuperacao invalido ou expirado.',
      );
    }

    if (!safeCompareHex(sha256Hex(dto.code.trim()), record.codeHash)) {
      await this.authRepository.incrementPasswordResetAttempts(record.id);
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'PASSWORD_RESET_INVALID',
        'Codigo de recuperacao invalido ou expirado.',
      );
    }

    await this.authRepository.completePasswordReset(user.id, record.id, newPasswordHash);
    return {
      message: 'Senha redefinida com sucesso. Todas as sessoes anteriores foram encerradas.',
    };
  }

  private async issueSessionTokens(
    user: User,
    metadata: {
      deviceName?: string;
      platform?: string;
      ipAddress?: string;
      userAgent?: string;
    },
  ): Promise<AuthTokensResponseDto> {
    const sessionId = randomUUID();
    const familyId = randomUUID();
    const rawRefreshToken = generateOpaqueToken(48);
    const refreshDays = this.configService.get('JWT_REFRESH_EXPIRES_DAYS', { infer: true });
    const expiresAt = new Date(Date.now() + refreshDays * 24 * 60 * 60 * 1000);

    await this.authRepository.createRefreshToken({
      id: sessionId,
      userId: user.id,
      tokenHash: sha256Hex(rawRefreshToken),
      familyId,
      deviceName: metadata.deviceName,
      platform: metadata.platform,
      ipAddress: metadata.ipAddress,
      userAgent: metadata.userAgent,
      expiresAt,
    });

    const accessToken = await this.signAccessToken(user, sessionId);

    return {
      accessToken,
      refreshToken: rawRefreshToken,
      expiresInSeconds: ACCESS_TOKEN_EXPIRES_IN_SECONDS,
      user: this.toAuthUserDto(user),
    };
  }

  private async signAccessToken(user: User, sessionId: string): Promise<string> {
    const payload: AccessTokenPayload = {
      sub: user.id,
      email: user.email,
      role: user.role,
      sid: sessionId,
      type: 'access',
    };

    return this.jwtService.signAsync(payload, {
      secret: this.configService.get('JWT_ACCESS_SECRET', { infer: true }),
      expiresIn: this.configService.get('JWT_ACCESS_EXPIRES_IN', { infer: true }),
    });
  }

  private ensureRequiredConsents(acceptTerms: boolean, acceptPrivacyPolicy: boolean): void {
    if (!acceptTerms || !acceptPrivacyPolicy) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'CONSENT_REQUIRED',
        'E obrigatorio aceitar os Termos de Uso e a Politica de Privacidade para criar uma conta.',
      );
    }
  }

  private async sendVerificationEmail(
    email: string,
    code: string,
    linkToken: string,
  ): Promise<void> {
    const publicUrl = this.configService.get('APP_PUBLIC_URL', { infer: true });
    await this.mailerService.sendMail({
      to: email,
      subject: 'Job Keep — Confirme seu e-mail',
      text: `Seu codigo de verificacao e ${code} (valido por ${OTP_EXPIRATION_MINUTES} minutos) ou acesse ${publicUrl}/verify-email?token=${linkToken}.`,
      html: `<p>Bem-vindo ao Job Keep! Seu codigo de verificacao e <strong>${code}</strong> (valido por ${OTP_EXPIRATION_MINUTES} minutos).</p>`,
    });
  }

  private toAuthUserDto(user: User): AuthUserDto {
    return {
      id: user.id,
      email: user.email,
      role: user.role,
      status: user.status,
      emailVerified: Boolean(user.emailVerifiedAt),
    };
  }

  private minutesFromNow(minutes: number): Date {
    return new Date(Date.now() + minutes * 60 * 1000);
  }

  private shouldExposeDevCode(): boolean {
    const env = this.configService.get('NODE_ENV', { infer: true });
    const provider = this.configService.get('MAIL_PROVIDER', { infer: true });
    return (env === 'development' || env === 'test') && provider === 'console';
  }
}
