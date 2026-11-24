import { ApiProperty, ApiPropertyOptional, PartialType } from '@nestjs/swagger';
import {
  ContractType,
  JobSeniority,
  JobStatus,
  ReportReason,
  SkillLevel,
  SkillRequirementType,
  WorkMode,
} from '@prisma/client';
import { Type } from 'class-transformer';
import {
  ArrayMaxSize,
  IsArray,
  IsEnum,
  IsInt,
  IsOptional,
  IsString,
  IsUUID,
  Max,
  MaxLength,
  Min,
  MinLength,
  ValidateNested,
} from 'class-validator';

export class JobSkillInputDto {
  @ApiProperty({ format: 'uuid' })
  @IsUUID()
  skillId!: string;

  @ApiProperty({ enum: SkillRequirementType })
  @IsEnum(SkillRequirementType)
  requirementType!: SkillRequirementType;

  @ApiProperty({ type: 'integer', minimum: 1, maximum: 10, default: 5 })
  @IsInt()
  @Min(1)
  @Max(10)
  weight = 5;

  @ApiPropertyOptional({ enum: SkillLevel })
  @IsOptional()
  @IsEnum(SkillLevel)
  minimumLevel?: SkillLevel;
}

export class CreateJobDto {
  @ApiProperty({ example: 'Desenvolvedor(a) Backend' })
  @IsString()
  @MinLength(2)
  @MaxLength(180)
  title!: string;

  @ApiProperty({ example: 'Desenvolvimento de serviços para a plataforma.' })
  @IsString()
  @MinLength(10)
  @MaxLength(20_000)
  description!: string;

  @ApiProperty({ example: 'Experiência com APIs e bancos de dados relacionais.' })
  @IsString()
  @MinLength(2)
  @MaxLength(10_000)
  requirements!: string;

  @ApiProperty({ example: 'Tecnologia' })
  @IsString()
  @MinLength(2)
  @MaxLength(120)
  area!: string;

  @ApiPropertyOptional({ example: 'São Paulo' })
  @IsOptional()
  @IsString()
  @MaxLength(120)
  city?: string;

  @ApiPropertyOptional({ example: 'SP' })
  @IsOptional()
  @IsString()
  @MaxLength(60)
  state?: string;

  @ApiProperty({ enum: WorkMode })
  @IsEnum(WorkMode)
  workMode!: WorkMode;

  @ApiProperty({ type: 'integer', description: 'Valor em centavos de real', example: 700000 })
  @IsInt()
  @Min(1)
  salaryMin!: number;

  @ApiProperty({ type: 'integer', description: 'Valor em centavos de real', example: 1200000 })
  @IsInt()
  @Min(1)
  salaryMax!: number;

  @ApiProperty({ type: [String], example: ['Vale-refeição', 'Plano de saúde'] })
  @IsArray()
  @IsString({ each: true })
  @ArrayMaxSize(30)
  benefits!: string[];

  @ApiProperty({ enum: JobSeniority })
  @IsEnum(JobSeniority)
  seniority!: JobSeniority;

  @ApiProperty({ enum: ContractType })
  @IsEnum(ContractType)
  contractType!: ContractType;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 90, default: 14 })
  @IsOptional()
  @IsInt()
  @Min(1)
  @Max(90)
  responseDeadlineDays?: number;

  @ApiPropertyOptional({ type: [JobSkillInputDto] })
  @IsOptional()
  @IsArray()
  @ArrayMaxSize(100)
  @ValidateNested({ each: true })
  @Type(() => JobSkillInputDto)
  skills?: JobSkillInputDto[];
}

export class UpdateJobDto extends PartialType(CreateJobDto) {}

export class ChangeJobStatusDto {
  @ApiProperty({ enum: JobStatus })
  @IsEnum(JobStatus)
  status!: JobStatus;
}

export class CreateJobReportDto {
  @ApiProperty({ enum: ReportReason })
  @IsEnum(ReportReason)
  reason!: ReportReason;

  @ApiPropertyOptional({ maxLength: 2000 })
  @IsOptional()
  @IsString()
  @MaxLength(2000)
  description?: string;
}

export class JobQueryDto {
  @ApiPropertyOptional({ type: 'integer', minimum: 1, default: 1 })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page = 1;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 100, default: 20 })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit = 20;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(120)
  area?: string;

  @ApiPropertyOptional({ enum: WorkMode })
  @IsOptional()
  @IsEnum(WorkMode)
  workMode?: WorkMode;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(120)
  city?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(60)
  state?: string;

  @ApiPropertyOptional({ type: 'integer', description: 'Valor em centavos de real' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  salaryMin?: number;

  @ApiPropertyOptional({ type: 'integer', description: 'Valor em centavos de real' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  salaryMax?: number;
}
