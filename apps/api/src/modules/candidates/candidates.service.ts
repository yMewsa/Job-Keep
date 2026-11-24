import { HttpStatus, Injectable } from '@nestjs/common';
import { Prisma, UserRole } from '@prisma/client';
import { randomUUID } from 'node:crypto';
import sharp from 'sharp';
import { DomainException } from '../../common/exceptions/domain.exception';
import { StorageService } from '../../infrastructure/storage/storage.service';
import { CandidatesRepository, FullCandidateProfile } from './candidates.repository';
import {
  AddCandidateSkillDto,
  ConfirmUploadDto,
  CreateEducationDto,
  CreateExperienceDto,
  PresignUploadDto,
  SuggestSkillDto,
  UpdateCandidateProfileDto,
  UpdateCandidateVisibilityDto,
  UpdateCandidateWorkPreferencesDto,
  UpdateEducationDto,
  UpdateExperienceDto,
} from './dto/candidate-profile.dto';
import {
  ALLOWED_IMAGE_MIMES,
  ALLOWED_RESUME_MIMES,
  detectImageMagicType,
  detectResumeMagicType,
  MAX_PHOTO_BYTES,
  MAX_RESUME_BYTES,
  sanitizeFileName,
} from './utils/file-validation.util';
import { calculateCandidateCompleteness } from './utils/profile-completeness.util';

export interface CandidateVisibilitySettings {
  hideFullNameBeforeMatch: boolean;
  hidePhotoBeforeMatch: boolean;
  hideResumeBeforeMatch: boolean;
  hideLinksBeforeMatch: boolean;
}

const DEFAULT_VISIBILITY: CandidateVisibilitySettings = {
  hideFullNameBeforeMatch: false,
  hidePhotoBeforeMatch: false,
  hideResumeBeforeMatch: true,
  hideLinksBeforeMatch: false,
};

/**
 * Regras de negocio do perfil profissional do candidato, curriculo, foto e visibilidade.
 */
@Injectable()
export class CandidatesService {
  constructor(
    private readonly candidatesRepository: CandidatesRepository,
    private readonly storageService: StorageService,
  ) {}

  async getMyProfile(userId: string) {
    const profile = await this.requireMyProfile(userId);
    return this.formatOwnProfile(profile);
  }

  async updateMyProfile(userId: string, dto: UpdateCandidateProfileDto) {
    const profile = await this.requireMyProfile(userId);
    await this.candidatesRepository.updateProfile(profile.id, {
      ...(dto.fullName !== undefined ? { fullName: dto.fullName.trim() } : {}),
      ...(dto.headline !== undefined ? { headline: dto.headline.trim() } : {}),
      ...(dto.bio !== undefined ? { bio: dto.bio.trim() } : {}),
      ...(dto.city !== undefined ? { city: dto.city.trim() } : {}),
      ...(dto.state !== undefined ? { state: dto.state.trim() } : {}),
      ...(dto.professionalArea !== undefined
        ? { professionalArea: dto.professionalArea.trim() }
        : {}),
      ...(dto.links !== undefined ? { links: dto.links as Prisma.InputJsonValue } : {}),
    });

    return this.getMyProfile(userId);
  }

  async updateWorkPreferences(userId: string, dto: UpdateCandidateWorkPreferencesDto) {
    const profile = await this.requireMyProfile(userId);
    const min = dto.salaryExpectationMin ?? profile.salaryExpectationMin;
    const max = dto.salaryExpectationMax ?? profile.salaryExpectationMax;

    if (min !== null && max !== null && max < min) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'SALARY_RANGE_INVALID',
        'A pretensao salarial maxima deve ser maior ou igual a minima.',
      );
    }

    await this.candidatesRepository.updateProfile(profile.id, {
      ...(dto.acceptedWorkModes !== undefined ? { acceptedWorkModes: dto.acceptedWorkModes } : {}),
      ...(dto.acceptedContractTypes !== undefined
        ? { acceptedContractTypes: dto.acceptedContractTypes }
        : {}),
      ...(dto.acceptedCities !== undefined ? { acceptedCities: dto.acceptedCities } : {}),
      ...(dto.acceptedStates !== undefined ? { acceptedStates: dto.acceptedStates } : {}),
      ...(dto.areasOfInterest !== undefined ? { areasOfInterest: dto.areasOfInterest } : {}),
      ...(dto.salaryExpectationMin !== undefined
        ? { salaryExpectationMin: dto.salaryExpectationMin }
        : {}),
      ...(dto.salaryExpectationMax !== undefined
        ? { salaryExpectationMax: dto.salaryExpectationMax }
        : {}),
      ...(dto.availability !== undefined ? { availability: dto.availability } : {}),
    });

    return this.getMyProfile(userId);
  }

  async updateVisibility(userId: string, dto: UpdateCandidateVisibilityDto) {
    const profile = await this.requireMyProfile(userId);
    await this.candidatesRepository.updateProfile(profile.id, {
      visibilitySettings: { ...dto } as unknown as Prisma.InputJsonValue,
    });
    return this.getMyProfile(userId);
  }

  async addExperience(userId: string, dto: CreateExperienceDto) {
    const profile = await this.requireMyProfile(userId);
    if (!dto.isCurrent && dto.endDate && new Date(dto.endDate) < new Date(dto.startDate)) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'EXPERIENCE_DATE_INVALID',
        'A data de termino da experiencia deve ser posterior a data de inicio.',
      );
    }

    return this.candidatesRepository.createExperience(profile.id, {
      companyName: dto.companyName.trim(),
      title: dto.title.trim(),
      description: dto.description?.trim(),
      workMode: dto.workMode,
      location: dto.location?.trim(),
      startDate: new Date(dto.startDate),
      endDate: dto.isCurrent || !dto.endDate ? null : new Date(dto.endDate),
      isCurrent: dto.isCurrent,
    });
  }

  async updateExperience(userId: string, experienceId: string, dto: UpdateExperienceDto) {
    const profile = await this.requireMyProfile(userId);
    const existing = await this.candidatesRepository.findExperienceById(experienceId);
    if (!existing || existing.candidateId !== profile.id) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'EXPERIENCE_NOT_FOUND',
        'Experiencia profissional nao encontrada.',
      );
    }

    return this.candidatesRepository.updateExperience(experienceId, {
      ...(dto.companyName !== undefined ? { companyName: dto.companyName.trim() } : {}),
      ...(dto.title !== undefined ? { title: dto.title.trim() } : {}),
      ...(dto.description !== undefined ? { description: dto.description.trim() } : {}),
      ...(dto.workMode !== undefined ? { workMode: dto.workMode } : {}),
      ...(dto.location !== undefined ? { location: dto.location.trim() } : {}),
      ...(dto.startDate !== undefined ? { startDate: new Date(dto.startDate) } : {}),
      ...(dto.isCurrent !== undefined ? { isCurrent: dto.isCurrent } : {}),
      ...(dto.endDate !== undefined
        ? { endDate: dto.isCurrent ? null : new Date(dto.endDate) }
        : {}),
    });
  }

  async deleteExperience(userId: string, experienceId: string) {
    const profile = await this.requireMyProfile(userId);
    const existing = await this.candidatesRepository.findExperienceById(experienceId);
    if (!existing || existing.candidateId !== profile.id) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'EXPERIENCE_NOT_FOUND',
        'Experiencia profissional nao encontrada.',
      );
    }
    await this.candidatesRepository.deleteExperience(experienceId);
    return { message: 'Experiencia removida com sucesso.' };
  }

  async addEducation(userId: string, dto: CreateEducationDto) {
    const profile = await this.requireMyProfile(userId);
    if (!dto.isCurrent && dto.endDate && new Date(dto.endDate) < new Date(dto.startDate)) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'EDUCATION_DATE_INVALID',
        'A data de conclusao deve ser posterior a data de inicio.',
      );
    }

    return this.candidatesRepository.createEducation(profile.id, {
      institution: dto.institution.trim(),
      degree: dto.degree.trim(),
      fieldOfStudy: dto.fieldOfStudy.trim(),
      status: dto.status,
      startDate: new Date(dto.startDate),
      endDate: dto.isCurrent || !dto.endDate ? null : new Date(dto.endDate),
      isCurrent: dto.isCurrent,
    });
  }

  async updateEducation(userId: string, educationId: string, dto: UpdateEducationDto) {
    const profile = await this.requireMyProfile(userId);
    const existing = await this.candidatesRepository.findEducationById(educationId);
    if (!existing || existing.candidateId !== profile.id) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'EDUCATION_NOT_FOUND',
        'Formacao academica nao encontrada.',
      );
    }

    return this.candidatesRepository.updateEducation(educationId, {
      ...(dto.institution !== undefined ? { institution: dto.institution.trim() } : {}),
      ...(dto.degree !== undefined ? { degree: dto.degree.trim() } : {}),
      ...(dto.fieldOfStudy !== undefined ? { fieldOfStudy: dto.fieldOfStudy.trim() } : {}),
      ...(dto.status !== undefined ? { status: dto.status } : {}),
      ...(dto.startDate !== undefined ? { startDate: new Date(dto.startDate) } : {}),
      ...(dto.isCurrent !== undefined ? { isCurrent: dto.isCurrent } : {}),
      ...(dto.endDate !== undefined
        ? { endDate: dto.isCurrent ? null : new Date(dto.endDate) }
        : {}),
    });
  }

  async deleteEducation(userId: string, educationId: string) {
    const profile = await this.requireMyProfile(userId);
    const existing = await this.candidatesRepository.findEducationById(educationId);
    if (!existing || existing.candidateId !== profile.id) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'EDUCATION_NOT_FOUND',
        'Formacao academica nao encontrada.',
      );
    }
    await this.candidatesRepository.deleteEducation(educationId);
    return { message: 'Formacao removida com sucesso.' };
  }

  async searchSkills(query?: string, category?: string) {
    return this.candidatesRepository.searchSkills(query, category);
  }

  async suggestSkill(userId: string, dto: SuggestSkillDto) {
    const slug = dto.name
      .trim()
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '');

    if (!slug) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'SKILL_NAME_INVALID',
        'Informe um nome valido para a habilidade.',
      );
    }

    const existing = await this.candidatesRepository.findSkillBySlug(slug);
    if (existing) {
      return existing;
    }

    return this.candidatesRepository.createSuggestedSkill(dto.name, slug, dto.category, userId);
  }

  async upsertCandidateSkill(userId: string, dto: AddCandidateSkillDto) {
    const profile = await this.requireMyProfile(userId);
    const skill = await this.candidatesRepository.findSkillById(dto.skillId);
    if (!skill) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'SKILL_NOT_FOUND',
        'Habilidade nao encontrada no catalogo.',
      );
    }

    return this.candidatesRepository.upsertCandidateSkill(profile.id, skill.id, {
      level: dto.level,
      yearsOfExperience: dto.yearsOfExperience,
    });
  }

  async removeCandidateSkill(userId: string, skillId: string) {
    const profile = await this.requireMyProfile(userId);
    const count = await this.candidatesRepository.deleteCandidateSkill(profile.id, skillId);
    if (count === 0) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'CANDIDATE_SKILL_NOT_FOUND',
        'Habilidade nao vinculada ao seu perfil.',
      );
    }
    return { message: 'Habilidade removida do perfil.' };
  }

  async createResumePresignedUpload(userId: string, dto: PresignUploadDto) {
    const profile = await this.requireMyProfile(userId);
    if (!ALLOWED_RESUME_MIMES.includes(dto.mimeType as (typeof ALLOWED_RESUME_MIMES)[number])) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'RESUME_INVALID_MIME',
        'Apenas arquivos PDF ou DOCX sao aceitos para o curriculo.',
      );
    }

    if (dto.sizeBytes > MAX_RESUME_BYTES) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'RESUME_TOO_LARGE',
        'O curriculo deve ter no maximo 5 MB.',
      );
    }

    const safeName = sanitizeFileName(dto.fileName);
    const fileKey = `resumes/${profile.id}/${Date.now()}-${randomUUID()}-${safeName}`;
    return this.storageService.createPresignedPutUrl(fileKey, dto.mimeType);
  }

  async confirmResumeUpload(userId: string, dto: ConfirmUploadDto) {
    const profile = await this.requireMyProfile(userId);
    const expectedPrefix = `resumes/${profile.id}/`;
    if (!dto.fileKey.startsWith(expectedPrefix)) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'FILE_KEY_FORBIDDEN',
        'Chave de arquivo nao pertence ao candidato autenticado.',
      );
    }

    const buffer = await this.storageService.getObjectBuffer(dto.fileKey);
    if (buffer.length === 0) {
      throw new DomainException(
        HttpStatus.BAD_REQUEST,
        'UPLOAD_FILE_NOT_FOUND',
        'Arquivo enviado nao encontrado no storage.',
      );
    }

    if (buffer.length > MAX_RESUME_BYTES) {
      await this.storageService.deleteObject(dto.fileKey).catch(() => undefined);
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'RESUME_TOO_LARGE',
        'O curriculo ultrapassa o limite maximo de 5 MB.',
      );
    }

    const detected = detectResumeMagicType(buffer);
    if (!detected) {
      await this.storageService.deleteObject(dto.fileKey).catch(() => undefined);
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'RESUME_INVALID_MAGIC_BYTES',
        'O conteudo real do arquivo nao corresponde a um PDF ou DOCX valido.',
      );
    }

    const mimeType =
      detected === 'pdf'
        ? 'application/pdf'
        : 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';

    return this.candidatesRepository.saveActiveResume({
      candidateId: profile.id,
      fileKey: dto.fileKey,
      fileUrl: this.storageService.buildObjectUrl(dto.fileKey),
      originalFileName: sanitizeFileName(dto.originalFileName),
      mimeType,
      sizeBytes: buffer.length,
    });
  }

  async deleteResume(userId: string, resumeId: string) {
    const profile = await this.requireMyProfile(userId);
    const resume = await this.candidatesRepository.findResumeById(resumeId);
    if (!resume || resume.candidateId !== profile.id) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'RESUME_NOT_FOUND',
        'Curriculo nao encontrado.',
      );
    }

    await this.candidatesRepository.deactivateResume(resumeId, profile.id);
    await this.storageService.deleteObject(resume.fileKey).catch(() => undefined);
    return { message: 'Curriculo removido com sucesso.' };
  }

  async createPhotoPresignedUpload(userId: string, dto: PresignUploadDto) {
    const profile = await this.requireMyProfile(userId);
    if (!ALLOWED_IMAGE_MIMES.includes(dto.mimeType as (typeof ALLOWED_IMAGE_MIMES)[number])) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'PHOTO_INVALID_MIME',
        'A foto deve estar nos formatos JPEG, PNG ou WEBP.',
      );
    }

    if (dto.sizeBytes > MAX_PHOTO_BYTES) {
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'PHOTO_TOO_LARGE',
        'A foto de perfil deve ter no maximo 3 MB.',
      );
    }

    const safeName = sanitizeFileName(dto.fileName);
    const fileKey = `photos/${profile.id}/${Date.now()}-${randomUUID()}-${safeName}`;
    return this.storageService.createPresignedPutUrl(fileKey, dto.mimeType);
  }

  async confirmPhotoUpload(userId: string, dto: ConfirmUploadDto) {
    const profile = await this.requireMyProfile(userId);
    const expectedPrefix = `photos/${profile.id}/`;
    if (!dto.fileKey.startsWith(expectedPrefix)) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'FILE_KEY_FORBIDDEN',
        'Chave de imagem nao pertence ao candidato autenticado.',
      );
    }

    const buffer = await this.storageService.getObjectBuffer(dto.fileKey);
    if (buffer.length === 0 || buffer.length > MAX_PHOTO_BYTES) {
      await this.storageService.deleteObject(dto.fileKey).catch(() => undefined);
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'PHOTO_INVALID_SIZE',
        'Imagem ausente ou acima do limite permitido de 3 MB.',
      );
    }

    const detected = detectImageMagicType(buffer);
    if (!detected) {
      await this.storageService.deleteObject(dto.fileKey).catch(() => undefined);
      throw new DomainException(
        HttpStatus.UNPROCESSABLE_ENTITY,
        'PHOTO_INVALID_MAGIC_BYTES',
        'O arquivo nao e uma imagem valida (JPEG, PNG ou WEBP).',
      );
    }

    const thumbnailBuffer = await sharp(buffer)
      .resize(256, 256, { fit: 'cover' })
      .webp({ quality: 82 })
      .toBuffer();

    const thumbKey = `photos/${profile.id}/thumb-${Date.now()}-${randomUUID()}.webp`;
    const photoUrl = this.storageService.buildObjectUrl(dto.fileKey);
    const photoThumbnailUrl = await this.storageService.putBuffer(
      thumbKey,
      thumbnailBuffer,
      'image/webp',
    );

    await this.candidatesRepository.updateProfile(profile.id, {
      photoUrl,
      photoThumbnailUrl,
    });

    return { photoUrl, photoThumbnailUrl };
  }

  async getCandidateProfileForViewer(
    candidateId: string,
    viewerUserId: string,
    viewerRole: UserRole,
  ) {
    const profile = await this.candidatesRepository.findFullProfileById(candidateId);
    if (!profile) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'CANDIDATE_NOT_FOUND',
        'Perfil de candidato nao encontrado.',
      );
    }

    if (viewerRole === UserRole.ADMIN || profile.userId === viewerUserId) {
      return this.formatOwnProfile(profile);
    }

    const hasMatch = await this.candidatesRepository.hasActiveMatchWithCompanyUser(
      candidateId,
      viewerUserId,
    );
    const visibility = this.parseVisibility(profile.visibilitySettings);

    if (hasMatch) {
      return {
        ...this.formatOwnProfile(profile),
        isMatchedWithViewer: true,
      };
    }

    return {
      id: profile.id,
      displayName: visibility.hideFullNameBeforeMatch
        ? this.maskFullName(profile.fullName)
        : profile.fullName,
      headline: profile.headline,
      bio: profile.bio,
      city: profile.city,
      state: profile.state,
      professionalArea: profile.professionalArea,
      salaryExpectationMin: profile.salaryExpectationMin,
      salaryExpectationMax: profile.salaryExpectationMax,
      acceptedWorkModes: profile.acceptedWorkModes,
      acceptedContractTypes: profile.acceptedContractTypes,
      acceptedCities: profile.acceptedCities,
      acceptedStates: profile.acceptedStates,
      areasOfInterest: profile.areasOfInterest,
      availability: profile.availability,
      links: visibility.hideLinksBeforeMatch ? null : profile.links,
      resumeUrl: visibility.hideResumeBeforeMatch ? null : profile.resumeUrl,
      photoUrl: visibility.hidePhotoBeforeMatch ? null : profile.photoUrl,
      photoThumbnailUrl: visibility.hidePhotoBeforeMatch ? null : profile.photoThumbnailUrl,
      experiences: profile.experiences,
      educations: profile.educations,
      skills: profile.skills,
      themeSettings: profile.themeSettings,
      isMatchedWithViewer: false,
    };
  }

  private async requireMyProfile(userId: string): Promise<FullCandidateProfile> {
    const profile = await this.candidatesRepository.findFullProfileByUserId(userId);
    if (!profile) {
      throw new DomainException(
        HttpStatus.NOT_FOUND,
        'CANDIDATE_PROFILE_NOT_FOUND',
        'Perfil de candidato nao encontrado para este usuario.',
      );
    }
    return profile;
  }

  private formatOwnProfile(profile: FullCandidateProfile) {
    const completeness = calculateCandidateCompleteness({
      fullName: profile.fullName,
      headline: profile.headline,
      bio: profile.bio,
      city: profile.city,
      state: profile.state,
      professionalArea: profile.professionalArea,
      salaryExpectationMin: profile.salaryExpectationMin,
      acceptedWorkModes: profile.acceptedWorkModes,
      acceptedContractTypes: profile.acceptedContractTypes,
      experiencesCount: profile.experiences.length,
      educationsCount: profile.educations.length,
      skillsCount: profile.skills.length,
      hasResume: Boolean(profile.resumeUrl) || profile.resumes.length > 0,
      hasPhoto: Boolean(profile.photoUrl),
    });

    return {
      ...profile,
      visibilitySettings: this.parseVisibility(profile.visibilitySettings),
      completionPercentage: completeness.completionPercentage,
      missingFields: completeness.missingFields,
    };
  }

  private parseVisibility(raw: Prisma.JsonValue | null): CandidateVisibilitySettings {
    if (!raw || typeof raw !== 'object' || Array.isArray(raw)) {
      return { ...DEFAULT_VISIBILITY };
    }
    const obj = raw as Record<string, unknown>;
    return {
      hideFullNameBeforeMatch: Boolean(obj.hideFullNameBeforeMatch),
      hidePhotoBeforeMatch: Boolean(obj.hidePhotoBeforeMatch),
      hideResumeBeforeMatch:
        obj.hideResumeBeforeMatch === undefined ? true : Boolean(obj.hideResumeBeforeMatch),
      hideLinksBeforeMatch: Boolean(obj.hideLinksBeforeMatch),
    };
  }

  private maskFullName(fullName: string): string {
    const firstPart = fullName.trim().split(/\s+/)[0] ?? 'Candidato';
    return `${firstPart[0]?.toUpperCase() ?? 'C'}. (Nome oculto antes do match)`;
  }
}
