import { HttpStatus, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { CompanyMemberRole, CompanyVerificationStatus, UserRole } from '@prisma/client';
import { randomUUID } from 'node:crypto';
import { AppEnv } from '../../common/config/env.schema';
import { DomainException } from '../../common/exceptions/domain.exception';
import { MailerService } from '../../infrastructure/mail/mailer.service';
import { StorageService } from '../../infrastructure/storage/storage.service';
import { generateOpaqueToken, sha256Hex } from '../auth/utils/crypto.util';
import {
  ALLOWED_IMAGE_MIMES,
  detectImageMagicType,
  MAX_PHOTO_BYTES,
  sanitizeFileName,
} from '../candidates/utils/file-validation.util';
import { CompaniesRepository } from './companies.repository';
import {
  AcceptCompanyInvitationDto,
  ConfirmCompanyLogoDto,
  InviteCompanyMemberDto,
  PresignCompanyLogoDto,
  UpdateCompanyProfileDto,
  VerifyCompanyDto,
} from './dto/company.dto';

/**
 * Regras de negocio para perfil empresarial, verificacao de CNPJ e membros recrutadores.
 */
@Injectable()
export class CompaniesService {
  constructor(
    private readonly companiesRepository: CompaniesRepository,
    private readonly storageService: StorageService,
    private readonly mailerService: MailerService,
    private readonly configService: ConfigService<AppEnv, true>,
  ) {}

  async getMyCompany(userId: string) {
    const membership = await this.requireMembership(userId);
    return {
      ...membership.company,
      myRole: membership.role,
    };
  }

  async updateMyCompany(userId: string, dto: UpdateCompanyProfileDto) {
    const membership = await this.requireMembership(userId);
    const updated = await this.companiesRepository.updateCompany(membership.companyId, {
      ...(dto.tradeName !== undefined ? { tradeName: dto.tradeName.trim() } : {}),
      ...(dto.sector !== undefined ? { sector: dto.sector.trim() } : {}),
      ...(dto.size !== undefined ? { size: dto.size } : {}),
      ...(dto.description !== undefined ? { description: dto.description.trim() } : {}),
      ...(dto.websiteUrl !== undefined ? { websiteUrl: dto.websiteUrl.trim() } : {}),
      ...(dto.city !== undefined ? { city: dto.city.trim() } : {}),
      ...(dto.state !== undefined ? { state: dto.state.trim() } : {}),
    });
    return updated;
  }

  async deleteMyCompany(userId: string) {
    const membership = await this.requireMembership(userId);
    if (membership.role !== CompanyMemberRole.OWNER) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'COMPANY_OWNER_REQUIRED',
        'Apenas proprietários podem desativar o perfil da empresa.',
      );
    }

    const result = await this.companiesRepository.softDeleteCompany(membership.companyId);
    return {
      message: 'Perfil da empresa desativado com sucesso.',
      closedJobsCount: result.closedJobsCount,
    };
  }

  async createLogoPresignedUpload(userId: string, dto: PresignCompanyLogoDto) {
    const membership = await this.requireMembership(userId);
    if (!ALLOWED_IMAGE_MIMES.includes(dto.mimeType as (typeof ALLOWED_IMAGE_MIMES)[number])) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'COMPANY_LOGO_INVALID_MIME',
        'O logo da empresa deve estar em JPEG, PNG ou WEBP.',
      );
    }

    const safeName = sanitizeFileName(dto.fileName);
    const fileKey = `company-logos/${membership.companyId}/${Date.now()}-${randomUUID()}-${safeName}`;
    return this.storageService.createPresignedPutUrl(fileKey, dto.mimeType);
  }

  async confirmLogoUpload(userId: string, dto: ConfirmCompanyLogoDto) {
    const membership = await this.requireMembership(userId);
    const expectedPrefix = `company-logos/${membership.companyId}/`;
    if (!dto.fileKey.startsWith(expectedPrefix)) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'FILE_KEY_FORBIDDEN',
        'Chave de arquivo nao pertence a sua empresa.',
      );
    }

    const buffer = await this.storageService.getObjectBuffer(dto.fileKey);
    if (buffer.length === 0 || buffer.length > MAX_PHOTO_BYTES || !detectImageMagicType(buffer)) {
      await this.storageService.deleteObject(dto.fileKey).catch(() => undefined);
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'COMPANY_LOGO_INVALID',
        'Imagem de logo invalida ou acima de 3 MB.',
      );
    }

    const logoUrl = this.storageService.buildObjectUrl(dto.fileKey);
    await this.companiesRepository.updateCompany(membership.companyId, { logoUrl });
    return { logoUrl };
  }

  async inviteMember(userId: string, dto: InviteCompanyMemberDto) {
    const membership = await this.requireMembership(userId);
    if (membership.role !== CompanyMemberRole.OWNER) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'COMPANY_OWNER_REQUIRED',
        'Apenas proprietarios (OWNER) da empresa podem convidar novos recrutadores.',
      );
    }

    const token = generateOpaqueToken(24);
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000);
    const invitation = await this.companiesRepository.createInvitation({
      companyId: membership.companyId,
      email: dto.email.toLowerCase().trim(),
      role: dto.role,
      tokenHash: sha256Hex(token),
      invitedByUserId: userId,
      expiresAt,
    });

    const publicUrl = this.configService.get('APP_PUBLIC_URL', { infer: true });
    await this.mailerService.sendMail({
      to: invitation.email,
      subject: `Convite para recrutar na ${membership.company.tradeName}`,
      text: `Voce foi convidado como ${dto.role} para a empresa ${membership.company.tradeName}. Token: ${token} (${publicUrl}/company-invite?token=${token})`,
      html: `<p>Voce foi convidado para integrar a equipe da <strong>${membership.company.tradeName}</strong>.</p>`,
    });

    const env = this.configService.get('NODE_ENV', { infer: true });
    const provider = this.configService.get('MAIL_PROVIDER', { infer: true });
    return {
      id: invitation.id,
      email: invitation.email,
      role: invitation.role,
      expiresAt: invitation.expiresAt,
      ...((env === 'development' || env === 'test') && provider === 'console'
        ? { devInviteToken: token }
        : {}),
    };
  }

  async acceptInvitation(
    userId: string,
    userEmail: string,
    userRole: UserRole,
    dto: AcceptCompanyInvitationDto,
  ) {
    if (userRole !== UserRole.COMPANY) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'COMPANY_ROLE_REQUIRED',
        'Apenas contas de empresa podem aceitar convites de recrutador.',
      );
    }

    const invitation = await this.companiesRepository.findInvitationByTokenHash(
      sha256Hex(dto.token),
    );
    if (
      !invitation ||
      invitation.acceptedAt !== null ||
      invitation.expiresAt.getTime() < Date.now()
    ) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'INVITATION_INVALID',
        'Convite invalido ou expirado.',
      );
    }

    if (invitation.email.toLowerCase() !== userEmail.toLowerCase()) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'INVITATION_EMAIL_MISMATCH',
        'Este convite foi emitido para outro endereco de e-mail.',
      );
    }

    return this.companiesRepository.acceptInvitation(invitation, userId);
  }

  async removeMember(userId: string, memberId: string) {
    const membership = await this.requireMembership(userId);
    if (membership.role !== CompanyMemberRole.OWNER) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'COMPANY_OWNER_REQUIRED',
        'Apenas proprietarios podem remover membros da empresa.',
      );
    }

    const targetMember = membership.company.members.find((m) => m.id === memberId);
    if (!targetMember) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'COMPANY_MEMBER_NOT_FOUND',
        'Membro nao encontrado na empresa.',
      );
    }

    if (targetMember.userId === userId) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'CANNOT_REMOVE_SELF',
        'Nao e possivel remover a si mesmo da empresa.',
      );
    }

    await this.companiesRepository.removeMember(membership.companyId, memberId);
    return { message: 'Membro removido da empresa com sucesso.' };
  }

  async getPublicCompany(companyId: string) {
    const company = await this.companiesRepository.findPublicCompanyById(companyId);
    if (!company) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'COMPANY_NOT_FOUND',
        'Empresa nao encontrada.',
      );
    }
    return company;
  }

  async verifyCompanyByAdmin(companyId: string, adminUserId: string, dto: VerifyCompanyDto) {
    if (
      dto.status !== CompanyVerificationStatus.VERIFIED &&
      dto.status !== CompanyVerificationStatus.REJECTED
    ) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'INVALID_VERIFICATION_STATUS',
        'A decisao administrativa deve ser VERIFIED ou REJECTED.',
      );
    }

    const company = await this.companiesRepository.findCompanyById(companyId);
    if (!company) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'COMPANY_NOT_FOUND',
        'Empresa nao encontrada.',
      );
    }

    return this.companiesRepository.updateVerificationStatus(
      companyId,
      dto.status,
      adminUserId,
      dto.notes,
    );
  }

  async requireMembership(userId: string) {
    const membership = await this.companiesRepository.findCompanyMembershipForUser(userId);
    if (!membership) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'COMPANY_MEMBERSHIP_NOT_FOUND',
        'Usuario nao vinculado a nenhuma empresa ativa.',
      );
    }
    return membership;
  }
}
