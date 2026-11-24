import { HttpStatus, Injectable } from '@nestjs/common';
import { UserStatus } from '@prisma/client';
import { DomainException } from '../../common/exceptions/domain.exception';
import { generateOpaqueToken, hashPassword, verifyPassword } from '../auth/utils/crypto.util';
import {
  DeactivateAccountDto,
  DeleteAccountDto,
  ReactivateAccountDto,
} from './dto/account.dto';
import { UsersRepository } from './users.repository';

const REACTIVATION_WINDOW_DAYS = 30;

/**
 * Regras de negocio para consulta, desativacao reversivel (30 dias) e exclusao LGPD da conta.
 */
@Injectable()
export class UsersService {
  constructor(private readonly usersRepository: UsersRepository) {}

  async getMyAccount(userId: string) {
    const user = await this.usersRepository.findById(userId);
    if (!user || user.status === UserStatus.DELETED) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'USER_NOT_FOUND', 'Conta nao encontrada.');
    }

    const consents = await this.usersRepository.listConsentsByUserId(userId);
    return {
      id: user.id,
      email: user.email,
      role: user.role,
      status: user.status,
      emailVerified: Boolean(user.emailVerifiedAt),
      emailVerifiedAt: user.emailVerifiedAt,
      deactivatedAt: user.deactivatedAt,
      scheduledDeletionAt: user.scheduledDeletionAt,
      createdAt: user.createdAt,
      consents: consents.map((c) => ({
        consentType: c.consentType,
        documentVersion: c.documentVersion,
        accepted: c.accepted,
        consentedAt: c.consentedAt,
      })),
    };
  }

  async deactivateMyAccount(userId: string, dto: DeactivateAccountDto) {
    const user = await this.usersRepository.findById(userId);
    if (!user || user.status !== UserStatus.ACTIVE) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'ACCOUNT_NOT_ACTIVE',
        'Apenas contas ativas podem ser desativadas.',
      );
    }

    const isPasswordValid = await verifyPassword(user.passwordHash, dto.password);
    if (!isPasswordValid) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'INVALID_CREDENTIALS',
        'Senha incorreta.',
      );
    }

    const scheduledDeletionAt = new Date(
      Date.now() + REACTIVATION_WINDOW_DAYS * 24 * 60 * 60 * 1000,
    );

    await this.usersRepository.deactivateAccount(userId, scheduledDeletionAt, dto.reason);

    return {
      message:
        'Conta desativada com sucesso. Voce pode reativa-la em ate 30 dias antes da exclusao definitiva.',
      scheduledDeletionAt,
    };
  }

  async reactivateAccount(dto: ReactivateAccountDto) {
    const user = await this.usersRepository.findByEmail(dto.email);
    if (!user) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'INVALID_CREDENTIALS',
        'E-mail ou senha invalidos.',
      );
    }

    const isPasswordValid = await verifyPassword(user.passwordHash, dto.password);
    if (!isPasswordValid) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'INVALID_CREDENTIALS',
        'E-mail ou senha invalidos.',
      );
    }

    if (user.status !== UserStatus.DEACTIVATED) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'ACCOUNT_NOT_DEACTIVATED',
        'Esta conta nao esta em estado de desativacao temporaria.',
      );
    }

    if (user.scheduledDeletionAt && user.scheduledDeletionAt.getTime() < Date.now()) {
      throw new DomainException(
        HttpStatus.GONE,
        'REACTIVATION_WINDOW_EXPIRED',
        'O prazo de 30 dias para reativacao desta conta expirou.',
      );
    }

    await this.usersRepository.reactivateAccount(user.id);

    return {
      message: 'Conta reativada com sucesso. Voce ja pode fazer login novamente.',
    };
  }

  async deleteMyAccountPermanently(userId: string, dto: DeleteAccountDto) {
    if (!dto.confirmPermanentDeletion) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'DELETION_CONFIRMATION_REQUIRED',
        'E necessario confirmar explicitamente a exclusao definitiva da conta.',
      );
    }

    const user = await this.usersRepository.findById(userId);
    if (!user || user.status === UserStatus.DELETED) {
      throw new DomainException(HttpStatus.NOT_FOUND, 'USER_NOT_FOUND', 'Conta nao encontrada.');
    }

    const isPasswordValid = await verifyPassword(user.passwordHash, dto.password);
    if (!isPasswordValid) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'INVALID_CREDENTIALS',
        'Senha incorreta.',
      );
    }

    const unusableHash = await hashPassword(generateOpaqueToken(48));
    await this.usersRepository.anonymizeAndDeleteAccount(user.id, user.role, unusableHash);

    return {
      message: 'Sua conta foi excluida definitivamente e seus dados pessoais foram anonimizados.',
    };
  }
}
