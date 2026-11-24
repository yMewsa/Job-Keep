import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  CompanyMemberRole,
  CompanySize,
  CompanyVerificationStatus,
  UserRole,
  UserStatus,
} from '@prisma/client';

export class CompanyMemberUserResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'email' })
  email!: string;

  @ApiProperty({ enum: UserRole })
  role!: UserRole;

  @ApiProperty({ enum: UserStatus })
  status!: UserStatus;
}

export class CompanyMemberResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'uuid' })
  userId!: string;

  @ApiProperty({ format: 'uuid' })
  companyId!: string;

  @ApiProperty({ enum: CompanyMemberRole })
  role!: CompanyMemberRole;

  @ApiProperty({ type: String, format: 'date-time' })
  createdAt!: Date;

  @ApiPropertyOptional({ type: CompanyMemberUserResponseDto })
  user?: CompanyMemberUserResponseDto;
}

export class CompanyProfileResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty()
  legalName!: string;

  @ApiProperty()
  tradeName!: string;

  @ApiProperty({ example: '12345678000195' })
  cnpj!: string;

  @ApiProperty()
  sector!: string;

  @ApiProperty({ enum: CompanySize })
  size!: CompanySize;

  @ApiPropertyOptional({ nullable: true })
  description!: string | null;

  @ApiPropertyOptional({ nullable: true })
  logoUrl!: string | null;

  @ApiPropertyOptional({ nullable: true })
  websiteUrl!: string | null;

  @ApiPropertyOptional({ nullable: true })
  city!: string | null;

  @ApiPropertyOptional({ nullable: true })
  state!: string | null;

  @ApiProperty({ enum: CompanyVerificationStatus })
  verificationStatus!: CompanyVerificationStatus;

  @ApiPropertyOptional({ type: String, format: 'date-time', nullable: true })
  verifiedAt!: Date | null;

  @ApiPropertyOptional({ nullable: true })
  verificationNotes!: string | null;

  @ApiPropertyOptional({ type: 'integer', nullable: true })
  maxActiveJobs!: number | null;

  @ApiPropertyOptional({ type: [CompanyMemberResponseDto] })
  members?: CompanyMemberResponseDto[];

  @ApiPropertyOptional({ enum: CompanyMemberRole })
  myRole?: CompanyMemberRole;

  @ApiPropertyOptional({ type: 'object', nullable: true, additionalProperties: true })
  themeSettings?: Record<string, unknown> | null;
}

export class PublicCompanyProfileResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty()
  tradeName!: string;

  @ApiProperty()
  sector!: string;

  @ApiProperty({ enum: CompanySize })
  size!: CompanySize;

  @ApiPropertyOptional({ nullable: true })
  description!: string | null;

  @ApiPropertyOptional({ nullable: true })
  logoUrl!: string | null;

  @ApiPropertyOptional({ nullable: true })
  websiteUrl!: string | null;

  @ApiPropertyOptional({ nullable: true })
  city!: string | null;

  @ApiPropertyOptional({ nullable: true })
  state!: string | null;

  @ApiProperty({ enum: CompanyVerificationStatus })
  verificationStatus!: CompanyVerificationStatus;

  @ApiPropertyOptional({ type: 'object', nullable: true, additionalProperties: true })
  themeSettings?: Record<string, unknown> | null;
}

export class CompanyLogoUploadResponseDto {
  @ApiProperty({ format: 'uri' })
  uploadUrl!: string;

  @ApiProperty()
  fileKey!: string;

  @ApiProperty({ format: 'uri' })
  publicUrl!: string;

  @ApiProperty({ type: 'integer' })
  expiresInSeconds!: number;
}

export class CompanyLogoResponseDto {
  @ApiProperty({ format: 'uri' })
  logoUrl!: string;
}

export class CompanyInvitationResponseDto {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'email' })
  email!: string;

  @ApiProperty({ enum: CompanyMemberRole })
  role!: CompanyMemberRole;

  @ApiProperty({ type: String, format: 'date-time' })
  expiresAt!: Date;
}

export class CompanyActionResponseDto {
  @ApiProperty()
  message!: string;

  @ApiPropertyOptional({ type: 'integer' })
  closedJobsCount?: number;
}
