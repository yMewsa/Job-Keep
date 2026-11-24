import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { CompanySize } from '@prisma/client';
import {
  IsBoolean,
  IsEmail,
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsString,
  Length,
  MaxLength,
  MinLength,
  ValidateIf,
} from 'class-validator';
import { IsCnpj } from '../../../common/validators/cnpj.validator';
import { IsStrongPassword } from '../../../common/validators/password-policy.validator';

/**
 * Dados para cadastro de candidato (RF01).
 */
export class RegisterCandidateDto {
  @ApiProperty({ example: 'ana.silva@email.com' })
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email!: string;

  @ApiProperty({ example: 'SenhaForte@2026' })
  @IsString({ message: 'A senha deve ser uma string.' })
  @IsStrongPassword()
  password!: string;

  @ApiProperty({ example: 'Ana Silva' })
  @IsString({ message: 'Informe seu nome completo.' })
  @MinLength(3, { message: 'O nome deve ter pelo menos 3 caracteres.' })
  @MaxLength(160, { message: 'O nome deve ter no maximo 160 caracteres.' })
  fullName!: string;

  @ApiProperty({ example: true, description: 'Aceite obrigatorio dos Termos de Uso.' })
  @IsBoolean({ message: 'O aceite dos Termos de Uso deve ser booleano.' })
  acceptTerms!: boolean;

  @ApiProperty({
    example: true,
    description: 'Aceite obrigatorio da Politica de Privacidade (LGPD).',
  })
  @IsBoolean({ message: 'O aceite da Politica de Privacidade deve ser booleano.' })
  acceptPrivacyPolicy!: boolean;

  @ApiPropertyOptional({ example: '1.0.0', default: '1.0.0' })
  @IsOptional()
  @IsString()
  @MaxLength(40)
  termsVersion?: string;

  @ApiPropertyOptional({ example: '1.0.0', default: '1.0.0' })
  @IsOptional()
  @IsString()
  @MaxLength(40)
  privacyPolicyVersion?: string;
}

/**
 * Dados para cadastro de empresa (RF02).
 */
export class RegisterCompanyDto {
  @ApiProperty({ example: 'rh@nuvempay.com.br' })
  @IsEmail({}, { message: 'Informe um e-mail corporativo valido.' })
  email!: string;

  @ApiProperty({ example: 'EmpresaForte@2026' })
  @IsString({ message: 'A senha deve ser uma string.' })
  @IsStrongPassword()
  password!: string;

  @ApiProperty({ example: 'Nuvem Paulista Tecnologia Ltda' })
  @IsString()
  @MinLength(3, { message: 'A razao social deve ter pelo menos 3 caracteres.' })
  @MaxLength(200)
  legalName!: string;

  @ApiProperty({ example: 'NuvemPay' })
  @IsString()
  @MinLength(2, { message: 'O nome fantasia deve ter pelo menos 2 caracteres.' })
  @MaxLength(200)
  tradeName!: string;

  @ApiProperty({ example: '11222333000181', description: 'CNPJ com 14 digitos ou formatado.' })
  @IsString()
  @IsCnpj({ message: 'Informe um CNPJ valido com digitos verificadores corretos.' })
  cnpj!: string;

  @ApiProperty({ example: 'Tecnologia / Fintech' })
  @IsString()
  @IsNotEmpty({ message: 'Informe o setor de atuacao da empresa.' })
  @MaxLength(120)
  sector!: string;

  @ApiProperty({ enum: CompanySize, example: CompanySize.MEDIUM })
  @IsEnum(CompanySize, { message: 'Informe um porte de empresa valido.' })
  size!: CompanySize;

  @ApiProperty({ example: true })
  @IsBoolean()
  acceptTerms!: boolean;

  @ApiProperty({ example: true })
  @IsBoolean()
  acceptPrivacyPolicy!: boolean;

  @ApiPropertyOptional({ example: '1.0.0', default: '1.0.0' })
  @IsOptional()
  @IsString()
  @MaxLength(40)
  termsVersion?: string;

  @ApiPropertyOptional({ example: '1.0.0', default: '1.0.0' })
  @IsOptional()
  @IsString()
  @MaxLength(40)
  privacyPolicyVersion?: string;
}

/**
 * Credenciais de login (RF03).
 */
export class LoginDto {
  @ApiProperty({ example: 'ana.silva@email.com' })
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email!: string;

  @ApiProperty({ example: 'SenhaForte@2026' })
  @IsString()
  @IsNotEmpty({ message: 'Informe sua senha.' })
  password!: string;

  @ApiPropertyOptional({ example: 'Pixel 8 Pro' })
  @IsOptional()
  @IsString()
  @MaxLength(120)
  deviceName?: string;

  @ApiPropertyOptional({ example: 'android' })
  @IsOptional()
  @IsString()
  @MaxLength(32)
  platform?: string;
}

/**
 * Renovacao de sessao por refresh token rotativo.
 */
export class RefreshTokenDto {
  @ApiProperty({ description: 'Refresh token opaco emitido no login ou ultimo refresh.' })
  @IsString()
  @IsNotEmpty({ message: 'Informe o refresh token.' })
  refreshToken!: string;
}

/**
 * Logout da sessao atual.
 */
export class LogoutDto {
  @ApiPropertyOptional({
    description: 'Refresh token da sessao a revogar. Se omitido, revoga a sessao do JWT atual.',
  })
  @IsOptional()
  @IsString()
  refreshToken?: string;
}

/**
 * Verificacao de e-mail por codigo OTP de 6 digitos ou token de link.
 */
export class VerifyEmailDto {
  @ApiPropertyOptional({ example: 'ana.silva@email.com' })
  @ValidateIf((o: VerifyEmailDto) => !o.token)
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email?: string;

  @ApiPropertyOptional({ example: '482910' })
  @ValidateIf((o: VerifyEmailDto) => !o.token)
  @IsString()
  @Length(6, 6, { message: 'O codigo de verificacao deve ter exatamente 6 digitos.' })
  code?: string;

  @ApiPropertyOptional({ description: 'Token de verificacao recebido por link.' })
  @ValidateIf((o: VerifyEmailDto) => !o.code)
  @IsString()
  @IsNotEmpty()
  token?: string;
}

/**
 * Reenvio de codigo de verificacao de e-mail.
 */
export class EmailOnlyDto {
  @ApiProperty({ example: 'ana.silva@email.com' })
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email!: string;
}

/**
 * Redefinicao de senha via codigo OTP de 6 digitos ou token de link (RF04).
 */
export class ResetPasswordDto {
  @ApiPropertyOptional({ example: 'ana.silva@email.com' })
  @ValidateIf((o: ResetPasswordDto) => !o.token)
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email?: string;

  @ApiPropertyOptional({ example: '739204' })
  @ValidateIf((o: ResetPasswordDto) => !o.token)
  @IsString()
  @Length(6, 6, { message: 'O codigo de recuperacao deve ter exatamente 6 digitos.' })
  code?: string;

  @ApiPropertyOptional({ description: 'Token de recuperacao recebido por link.' })
  @ValidateIf((o: ResetPasswordDto) => !o.code)
  @IsString()
  @IsNotEmpty()
  token?: string;

  @ApiProperty({ example: 'NovaSenhaForte@2026' })
  @IsString()
  @IsStrongPassword()
  newPassword!: string;
}
