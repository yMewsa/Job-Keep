import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { UserRole, UserStatus } from '@prisma/client';

export class AuthUserDto {
  @ApiProperty()
  id!: string;

  @ApiProperty()
  email!: string;

  @ApiProperty({ enum: UserRole })
  role!: UserRole;

  @ApiProperty({ enum: UserStatus })
  status!: UserStatus;

  @ApiProperty()
  emailVerified!: boolean;
}

export class AuthTokensResponseDto {
  @ApiProperty()
  accessToken!: string;

  @ApiProperty()
  refreshToken!: string;

  @ApiProperty({ example: 900 })
  expiresInSeconds!: number;

  @ApiProperty({ type: AuthUserDto })
  user!: AuthUserDto;
}

export class RegisterResponseDto {
  @ApiProperty({ example: 'Cadastro realizado. Verifique seu e-mail com o codigo enviado.' })
  message!: string;

  @ApiProperty({ type: AuthUserDto })
  user!: AuthUserDto;

  @ApiPropertyOptional({
    description: 'Retornado apenas em ambiente de desenvolvimento/testes quando MAIL_PROVIDER=console.',
  })
  devVerificationCode?: string;
}

export class MessageResponseDto {
  @ApiProperty()
  message!: string;

  @ApiPropertyOptional({
    description: 'Retornado apenas em ambiente de desenvolvimento/testes quando MAIL_PROVIDER=console.',
  })
  devCode?: string;
}

export class SessionDto {
  @ApiProperty()
  id!: string;

  @ApiPropertyOptional({ nullable: true })
  deviceName!: string | null;

  @ApiPropertyOptional({ nullable: true })
  platform!: string | null;

  @ApiPropertyOptional({ nullable: true })
  ipAddress!: string | null;

  @ApiPropertyOptional({ nullable: true })
  lastUsedAt!: Date | null;

  @ApiProperty()
  createdAt!: Date;

  @ApiProperty()
  expiresAt!: Date;

  @ApiProperty()
  isCurrent!: boolean;
}
