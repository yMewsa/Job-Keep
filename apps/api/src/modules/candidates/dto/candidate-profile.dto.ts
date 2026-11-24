import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  AvailabilityStatus,
  ContractType,
  EducationStatus,
  SkillLevel,
  WorkMode,
} from '@prisma/client';
import { Type } from 'class-transformer';
import {
  ArrayMaxSize,
  IsArray,
  IsBoolean,
  IsDateString,
  IsEnum,
  IsInt,
  IsObject,
  IsOptional,
  IsString,
  IsUrl,
  Max,
  MaxLength,
  Min,
  MinLength,
} from 'class-validator';

export class CandidateLinksDto {
  @ApiPropertyOptional({ example: 'https://linkedin.com/in/ana-silva' })
  @IsOptional()
  @IsUrl({}, { message: 'Informe uma URL valida para o LinkedIn.' })
  linkedin?: string;

  @ApiPropertyOptional({ example: 'https://github.com/anasilva' })
  @IsOptional()
  @IsUrl({}, { message: 'Informe uma URL valida para o GitHub.' })
  github?: string;

  @ApiPropertyOptional({ example: 'https://anasilva.dev' })
  @IsOptional()
  @IsUrl({}, { message: 'Informe uma URL valida para o portfolio.' })
  portfolio?: string;
}

export class UpdateCandidateProfileDto {
  @ApiPropertyOptional({ example: 'Ana Clara Silva' })
  @IsOptional()
  @IsString()
  @MinLength(3)
  @MaxLength(160)
  fullName?: string;

  @ApiPropertyOptional({ example: 'Engenheira de Software Backend | Node.js e TypeScript' })
  @IsOptional()
  @IsString()
  @MaxLength(180)
  headline?: string;

  @ApiPropertyOptional({ example: 'Mais de 5 anos construindo APIs escalaveis...' })
  @IsOptional()
  @IsString()
  @MaxLength(3000)
  bio?: string;

  @ApiPropertyOptional({ example: 'Sao Paulo' })
  @IsOptional()
  @IsString()
  @MaxLength(120)
  city?: string;

  @ApiPropertyOptional({ example: 'SP' })
  @IsOptional()
  @IsString()
  @MaxLength(60)
  state?: string;

  @ApiPropertyOptional({ example: 'Desenvolvimento Backend' })
  @IsOptional()
  @IsString()
  @MaxLength(120)
  professionalArea?: string;

  @ApiPropertyOptional({ type: CandidateLinksDto })
  @IsOptional()
  @IsObject()
  @Type(() => CandidateLinksDto)
  links?: CandidateLinksDto;
}

export class UpdateCandidateWorkPreferencesDto {
  @ApiPropertyOptional({ enum: WorkMode, isArray: true })
  @IsOptional()
  @IsArray()
  @IsEnum(WorkMode, { each: true })
  acceptedWorkModes?: WorkMode[];

  @ApiPropertyOptional({ enum: ContractType, isArray: true })
  @IsOptional()
  @IsArray()
  @IsEnum(ContractType, { each: true })
  acceptedContractTypes?: ContractType[];

  @ApiPropertyOptional({ example: ['Sao Paulo', 'Campinas'] })
  @IsOptional()
  @IsArray()
  @ArrayMaxSize(20)
  @IsString({ each: true })
  acceptedCities?: string[];

  @ApiPropertyOptional({ example: ['SP', 'RJ'] })
  @IsOptional()
  @IsArray()
  @ArrayMaxSize(27)
  @IsString({ each: true })
  acceptedStates?: string[];

  @ApiPropertyOptional({ example: ['Desenvolvimento Backend', 'Arquitetura de Software'] })
  @IsOptional()
  @IsArray()
  @ArrayMaxSize(10)
  @IsString({ each: true })
  areasOfInterest?: string[];

  @ApiPropertyOptional({ example: 600000, description: 'Pretensao salarial minima em centavos BRL.' })
  @IsOptional()
  @IsInt()
  @Min(0)
  salaryExpectationMin?: number;

  @ApiPropertyOptional({ example: 1000000, description: 'Pretensao salarial maxima em centavos BRL.' })
  @IsOptional()
  @IsInt()
  @Min(0)
  salaryExpectationMax?: number;

  @ApiPropertyOptional({ enum: AvailabilityStatus })
  @IsOptional()
  @IsEnum(AvailabilityStatus)
  availability?: AvailabilityStatus;
}

export class UpdateCandidateVisibilityDto {
  @ApiProperty({ example: true })
  @IsBoolean()
  hideFullNameBeforeMatch!: boolean;

  @ApiProperty({ example: true })
  @IsBoolean()
  hidePhotoBeforeMatch!: boolean;

  @ApiProperty({ example: true })
  @IsBoolean()
  hideResumeBeforeMatch!: boolean;

  @ApiProperty({ example: false })
  @IsBoolean()
  hideLinksBeforeMatch!: boolean;
}

export class CreateExperienceDto {
  @ApiProperty({ example: 'Tech Brasil Ltda' })
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  companyName!: string;

  @ApiProperty({ example: 'Desenvolvedor(a) Backend Pleno' })
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  title!: string;

  @ApiPropertyOptional({ example: 'Responsavel por servicos NestJS e PostgreSQL.' })
  @IsOptional()
  @IsString()
  @MaxLength(2000)
  description?: string;

  @ApiPropertyOptional({ enum: WorkMode })
  @IsOptional()
  @IsEnum(WorkMode)
  workMode?: WorkMode;

  @ApiPropertyOptional({ example: 'Sao Paulo, SP' })
  @IsOptional()
  @IsString()
  @MaxLength(160)
  location?: string;

  @ApiProperty({ example: '2023-02-01' })
  @IsDateString()
  startDate!: string;

  @ApiPropertyOptional({ example: '2025-05-01' })
  @IsOptional()
  @IsDateString()
  endDate?: string;

  @ApiProperty({ example: false })
  @IsBoolean()
  isCurrent!: boolean;
}

export class UpdateExperienceDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  companyName?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  title?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(2000)
  description?: string;

  @ApiPropertyOptional({ enum: WorkMode })
  @IsOptional()
  @IsEnum(WorkMode)
  workMode?: WorkMode;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(160)
  location?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsDateString()
  startDate?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsDateString()
  endDate?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isCurrent?: boolean;
}

export class CreateEducationDto {
  @ApiProperty({ example: 'Universidade de Sao Paulo' })
  @IsString()
  @MinLength(2)
  @MaxLength(180)
  institution!: string;

  @ApiProperty({ example: 'Bacharelado' })
  @IsString()
  @MinLength(2)
  @MaxLength(120)
  degree!: string;

  @ApiProperty({ example: 'Sistemas de Informacao' })
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  fieldOfStudy!: string;

  @ApiProperty({ enum: EducationStatus })
  @IsEnum(EducationStatus)
  status!: EducationStatus;

  @ApiProperty({ example: '2018-02-01' })
  @IsDateString()
  startDate!: string;

  @ApiPropertyOptional({ example: '2022-12-15' })
  @IsOptional()
  @IsDateString()
  endDate?: string;

  @ApiProperty({ example: false })
  @IsBoolean()
  isCurrent!: boolean;
}

export class UpdateEducationDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(180)
  institution?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(120)
  degree?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(160)
  fieldOfStudy?: string;

  @ApiPropertyOptional({ enum: EducationStatus })
  @IsOptional()
  @IsEnum(EducationStatus)
  status?: EducationStatus;

  @ApiPropertyOptional()
  @IsOptional()
  @IsDateString()
  startDate?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsDateString()
  endDate?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isCurrent?: boolean;
}

export class SuggestSkillDto {
  @ApiProperty({ example: 'Prisma ORM' })
  @IsString()
  @MinLength(2)
  @MaxLength(100)
  name!: string;

  @ApiProperty({ example: 'Backend' })
  @IsString()
  @MinLength(2)
  @MaxLength(80)
  category!: string;
}

export class AddCandidateSkillDto {
  @ApiProperty()
  @IsString()
  skillId!: string;

  @ApiProperty({ enum: SkillLevel })
  @IsEnum(SkillLevel)
  level!: SkillLevel;

  @ApiProperty({ example: 3 })
  @IsInt()
  @Min(0)
  @Max(50)
  yearsOfExperience!: number;
}

export class PresignUploadDto {
  @ApiProperty({ example: 'curriculo_ana_silva.pdf' })
  @IsString()
  @MinLength(3)
  @MaxLength(200)
  fileName!: string;

  @ApiProperty({ example: 'application/pdf' })
  @IsString()
  mimeType!: string;

  @ApiProperty({ example: 245760 })
  @IsInt()
  @Min(1)
  sizeBytes!: number;
}

export class ConfirmUploadDto {
  @ApiProperty({ example: 'resumes/candidate-id/1700000-curriculo.pdf' })
  @IsString()
  @MinLength(5)
  @MaxLength(512)
  fileKey!: string;

  @ApiProperty({ example: 'curriculo_ana_silva.pdf' })
  @IsString()
  @MinLength(3)
  @MaxLength(255)
  originalFileName!: string;
}
