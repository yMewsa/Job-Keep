import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { CompanyMemberRole, CompanySize, CompanyVerificationStatus } from '@prisma/client';
import {
  IsEmail,
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  IsUrl,
  Max,
  MaxLength,
  Min,
  MinLength,
} from 'class-validator';

export class UpdateCompanyProfileDto {
  @ApiPropertyOptional({ example: 'NuvemPay Pagamentos' })
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(200)
  tradeName?: string;

  @ApiPropertyOptional({ example: 'Fintech' })
  @IsOptional()
  @IsString()
  @MinLength(2)
  @MaxLength(120)
  sector?: string;

  @ApiPropertyOptional({ enum: CompanySize })
  @IsOptional()
  @IsEnum(CompanySize)
  size?: CompanySize;

  @ApiPropertyOptional({ example: 'Somos uma empresa focada em pagamentos digitais...' })
  @IsOptional()
  @IsString()
  @MaxLength(3000)
  description?: string;

  @ApiPropertyOptional({ example: 'https://www.nuvempay.com.br' })
  @IsOptional()
  @IsUrl({}, { message: 'Informe uma URL valida para o site da empresa.' })
  websiteUrl?: string;

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
}

export class PresignCompanyLogoDto {
  @ApiProperty({ example: 'logo_empresa.png' })
  @IsString()
  @MinLength(3)
  @MaxLength(200)
  fileName!: string;

  @ApiProperty({ example: 'image/png' })
  @IsString()
  mimeType!: string;

  @ApiProperty({ example: 102400 })
  @IsInt()
  @Min(1)
  @Max(3 * 1024 * 1024)
  sizeBytes!: number;
}

export class ConfirmCompanyLogoDto {
  @ApiProperty()
  @IsString()
  @MinLength(5)
  @MaxLength(512)
  fileKey!: string;
}

export class InviteCompanyMemberDto {
  @ApiProperty({ example: 'recrutadora@nuvempay.com.br' })
  @IsEmail({}, { message: 'Informe um e-mail valido para o convite.' })
  email!: string;

  @ApiPropertyOptional({ enum: CompanyMemberRole })
  @IsOptional()
  @IsEnum(CompanyMemberRole)
  role: CompanyMemberRole = CompanyMemberRole.RECRUITER;
}

export class AcceptCompanyInvitationDto {
  @ApiProperty({ description: 'Token de convite recebido por e-mail.' })
  @IsString()
  @IsNotEmpty()
  token!: string;
}

export class VerifyCompanyDto {
  @ApiProperty({
    enum: [CompanyVerificationStatus.VERIFIED, CompanyVerificationStatus.REJECTED],
  })
  @IsEnum(CompanyVerificationStatus)
  status!: CompanyVerificationStatus;

  @ApiPropertyOptional({
    example: 'CNPJ validado na Receita Federal e dominio corporativo conferido.',
  })
  @IsOptional()
  @IsString()
  @MaxLength(1000)
  notes?: string;
}
