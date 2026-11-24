import { Injectable } from '@nestjs/common';
import {
  CandidateProfile,
  CandidateSkill,
  Education,
  Experience,
  MatchStatus,
  Prisma,
  Resume,
  Skill,
  ThemeSettings,
} from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';

export type FullCandidateProfile = CandidateProfile & {
  experiences: Experience[];
  educations: Education[];
  skills: Array<CandidateSkill & { skill: Skill }>;
  resumes: Resume[];
  themeSettings: ThemeSettings | null;
};

/**
 * Repositorio do perfil profissional do candidato, experiencias, formacoes e habilidades.
 */
@Injectable()
export class CandidatesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findFullProfileByUserId(userId: string): Promise<FullCandidateProfile | null> {
    return this.prisma.candidateProfile.findUnique({
      where: { userId },
      include: {
        experiences: { orderBy: { startDate: 'desc' } },
        educations: { orderBy: { startDate: 'desc' } },
        skills: { include: { skill: true }, orderBy: { createdAt: 'asc' } },
        resumes: { where: { isActive: true }, orderBy: { uploadedAt: 'desc' } },
        themeSettings: true,
      },
    });
  }

  async findFullProfileById(candidateId: string): Promise<FullCandidateProfile | null> {
    return this.prisma.candidateProfile.findUnique({
      where: { id: candidateId },
      include: {
        experiences: { orderBy: { startDate: 'desc' } },
        educations: { orderBy: { startDate: 'desc' } },
        skills: { include: { skill: true }, orderBy: { createdAt: 'asc' } },
        resumes: { where: { isActive: true }, orderBy: { uploadedAt: 'desc' } },
        themeSettings: true,
      },
    });
  }

  async updateProfile(
    candidateId: string,
    data: Prisma.CandidateProfileUpdateInput,
  ): Promise<CandidateProfile> {
    return this.prisma.candidateProfile.update({
      where: { id: candidateId },
      data,
    });
  }

  async createExperience(
    candidateId: string,
    data: Omit<Prisma.ExperienceUncheckedCreateInput, 'candidateId'>,
  ): Promise<Experience> {
    return this.prisma.experience.create({
      data: { ...data, candidateId },
    });
  }

  async findExperienceById(id: string): Promise<Experience | null> {
    return this.prisma.experience.findUnique({ where: { id } });
  }

  async updateExperience(
    id: string,
    data: Prisma.ExperienceUpdateInput,
  ): Promise<Experience> {
    return this.prisma.experience.update({ where: { id }, data });
  }

  async deleteExperience(id: string): Promise<void> {
    await this.prisma.experience.delete({ where: { id } });
  }

  async createEducation(
    candidateId: string,
    data: Omit<Prisma.EducationUncheckedCreateInput, 'candidateId'>,
  ): Promise<Education> {
    return this.prisma.education.create({
      data: { ...data, candidateId },
    });
  }

  async findEducationById(id: string): Promise<Education | null> {
    return this.prisma.education.findUnique({ where: { id } });
  }

  async updateEducation(id: string, data: Prisma.EducationUpdateInput): Promise<Education> {
    return this.prisma.education.update({ where: { id }, data });
  }

  async deleteEducation(id: string): Promise<void> {
    await this.prisma.education.delete({ where: { id } });
  }

  async searchSkills(query?: string, category?: string): Promise<Skill[]> {
    return this.prisma.skill.findMany({
      where: {
        isApproved: true,
        ...(query
          ? {
              name: { contains: query.trim(), mode: 'insensitive' },
            }
          : {}),
        ...(category ? { category: { equals: category.trim(), mode: 'insensitive' } } : {}),
      },
      orderBy: { name: 'asc' },
      take: 30,
    });
  }

  async findSkillById(skillId: string): Promise<Skill | null> {
    return this.prisma.skill.findUnique({ where: { id: skillId } });
  }

  async findSkillBySlug(slug: string): Promise<Skill | null> {
    return this.prisma.skill.findUnique({ where: { slug } });
  }

  async createSuggestedSkill(name: string, slug: string, category: string, userId: string): Promise<Skill> {
    return this.prisma.skill.create({
      data: {
        name: name.trim(),
        slug,
        category: category.trim(),
        isApproved: false,
        suggestedByUserId: userId,
      },
    });
  }

  async upsertCandidateSkill(
    candidateId: string,
    skillId: string,
    data: { level: Prisma.CandidateSkillCreateInput['level']; yearsOfExperience: number },
  ): Promise<CandidateSkill & { skill: Skill }> {
    return this.prisma.candidateSkill.upsert({
      where: { candidateId_skillId: { candidateId, skillId } },
      update: data,
      create: {
        candidateId,
        skillId,
        ...data,
      },
      include: { skill: true },
    });
  }

  async deleteCandidateSkill(candidateId: string, skillId: string): Promise<number> {
    const result = await this.prisma.candidateSkill.deleteMany({
      where: { candidateId, skillId },
    });
    return result.count;
  }

  async saveActiveResume(input: {
    candidateId: string;
    fileKey: string;
    fileUrl: string;
    originalFileName: string;
    mimeType: string;
    sizeBytes: number;
  }): Promise<Resume> {
    return this.prisma.$transaction(async (tx) => {
      await tx.resume.updateMany({
        where: { candidateId: input.candidateId, isActive: true },
        data: { isActive: false },
      });

      const resume = await tx.resume.create({
        data: {
          candidateId: input.candidateId,
          fileKey: input.fileKey,
          fileUrl: input.fileUrl,
          originalFileName: input.originalFileName,
          mimeType: input.mimeType,
          sizeBytes: input.sizeBytes,
          isActive: true,
        },
      });

      await tx.candidateProfile.update({
        where: { id: input.candidateId },
        data: { resumeUrl: input.fileUrl },
      });

      return resume;
    });
  }

  async findResumeById(id: string): Promise<Resume | null> {
    return this.prisma.resume.findUnique({ where: { id } });
  }

  async deactivateResume(resumeId: string, candidateId: string): Promise<void> {
    await this.prisma.$transaction(async (tx) => {
      await tx.resume.update({
        where: { id: resumeId },
        data: { isActive: false },
      });
      await tx.candidateProfile.update({
        where: { id: candidateId },
        data: { resumeUrl: null },
      });
    });
  }

  async hasActiveMatchWithCompanyUser(candidateId: string, companyUserId: string): Promise<boolean> {
    const memberships = await this.prisma.companyMember.findMany({
      where: { userId: companyUserId },
      select: { companyId: true },
    });

    if (memberships.length === 0) {
      return false;
    }

    const companyIds = memberships.map((m) => m.companyId);
    const matchCount = await this.prisma.match.count({
      where: {
        candidateId,
        companyId: { in: companyIds },
        status: MatchStatus.ACTIVE,
      },
    });

    return matchCount > 0;
  }
}
