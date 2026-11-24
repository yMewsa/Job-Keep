import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  CompanyVerificationStatus,
  ContractType,
  JobSeniority,
  JobStatus,
  ReportReason,
  ReportStatus,
  SkillLevel,
  SkillRequirementType,
  WorkMode,
} from '@prisma/client';

export class JobSkillCatalogResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty()
  name!: string;

  @ApiProperty()
  slug!: string;

  @ApiProperty()
  category!: string;
}

export class JobSkillResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'uuid' })
  skillId!: string;

  @ApiProperty({ enum: SkillRequirementType })
  requirementType!: SkillRequirementType;

  @ApiProperty({ type: 'integer', minimum: 1, maximum: 10 })
  weight!: number;

  @ApiPropertyOptional({ enum: SkillLevel, nullable: true })
  minimumLevel!: SkillLevel | null;

  @ApiProperty({ type: JobSkillCatalogResponseDto })
  skill!: JobSkillCatalogResponseDto;
}

export class CompanyJobSummaryResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty()
  tradeName!: string;

  @ApiProperty()
  sector!: string;

  @ApiPropertyOptional({ nullable: true })
  logoUrl!: string | null;

  @ApiProperty({ enum: ['PENDING', 'VERIFIED', 'REJECTED'] })
  verificationStatus!: CompanyVerificationStatus;
}

export class JobResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'uuid' })
  companyId!: string;

  @ApiProperty()
  title!: string;

  @ApiProperty()
  description!: string;

  @ApiProperty()
  requirements!: string;

  @ApiProperty()
  area!: string;

  @ApiPropertyOptional({ nullable: true })
  city!: string | null;

  @ApiPropertyOptional({ nullable: true })
  state!: string | null;

  @ApiProperty({ enum: WorkMode })
  workMode!: WorkMode;

  @ApiProperty({ type: 'integer', description: 'Valor em centavos de real' })
  salaryMin!: number;

  @ApiProperty({ type: 'integer', description: 'Valor em centavos de real' })
  salaryMax!: number;

  @ApiProperty({ type: [String] })
  benefits!: string[];

  @ApiProperty({ enum: JobSeniority })
  seniority!: JobSeniority;

  @ApiProperty({ enum: ContractType })
  contractType!: ContractType;

  @ApiProperty({ enum: JobStatus })
  status!: JobStatus;

  @ApiProperty({ type: 'integer' })
  responseDeadlineDays!: number;

  @ApiPropertyOptional({ type: String, format: 'date-time', nullable: true })
  publishedAt!: Date | null;

  @ApiPropertyOptional({ type: String, format: 'date-time', nullable: true })
  closedAt!: Date | null;

  @ApiProperty({ type: String, format: 'date-time' })
  createdAt!: Date;

  @ApiProperty({ type: String, format: 'date-time' })
  updatedAt!: Date;

  @ApiProperty({ type: [JobSkillResponseDto] })
  jobSkills!: JobSkillResponseDto[];

  @ApiPropertyOptional({ type: CompanyJobSummaryResponseDto })
  company?: CompanyJobSummaryResponseDto;
}

export class JobPageResponseDto {
  @ApiProperty({ type: [JobResponseDto] })
  items!: JobResponseDto[];

  @ApiProperty({ type: 'integer' })
  total!: number;

  @ApiProperty({ type: 'integer' })
  page!: number;

  @ApiProperty({ type: 'integer' })
  limit!: number;
}

export class JobDeletionResponseDto {
  @ApiProperty()
  message!: string;

  @ApiProperty({ enum: JobStatus })
  status!: JobStatus;

  @ApiPropertyOptional({ type: String, format: 'date-time', nullable: true })
  deletedAt!: Date | null;
}

export class JobReportResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ enum: ReportReason })
  reason!: ReportReason;

  @ApiPropertyOptional({ nullable: true })
  description!: string | null;

  @ApiProperty({ enum: ReportStatus })
  status!: ReportStatus;

  @ApiProperty({ type: String, format: 'date-time' })
  createdAt!: Date;
}

export class JobModerationQueueItemResponseDto extends JobResponseDto {
  @ApiProperty()
  isSuspicious!: boolean;

  @ApiProperty({ type: [String] })
  suspiciousReasons!: string[];

  @ApiProperty({ type: [JobReportResponseDto] })
  reports!: JobReportResponseDto[];
}
