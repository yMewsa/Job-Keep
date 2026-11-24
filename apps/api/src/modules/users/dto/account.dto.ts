import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsBoolean, IsEmail, IsNotEmpty, IsOptional, IsString, MaxLength } from 'class-validator';

/**
 * Confirmacao de senha para acoes sensiveis na conta (desativacao/exclusao).
 */
export class DeactivateAccountDto {
  @ApiProperty({ example: 'SenhaForte@2026' })
  @IsString()
  @IsNotEmpty({ message: 'Informe sua senha atual para confirmar.' })
  password!: string;

  @ApiPropertyOptional({ example: 'Ja encontrei uma oportunidade no momento.' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  reason?: string;
}

/**
 * Reativacao de conta desativada dentro da janela de 30 dias.
 */
export class ReactivateAccountDto {
  @ApiProperty({ example: 'ana.silva@email.com' })
  @IsEmail({}, { message: 'Informe um e-mail valido.' })
  email!: string;

  @ApiProperty({ example: 'SenhaForte@2026' })
  @IsString()
  @IsNotEmpty({ message: 'Informe sua senha.' })
  password!: string;
}

/**
 * Confirmacao explicita de exclusao definitiva com anonimizacao LGPD (RF18).
 */
export class DeleteAccountDto {
  @ApiProperty({ example: 'SenhaForte@2026' })
  @IsString()
  @IsNotEmpty({ message: 'Informe sua senha atual para confirmar.' })
  password!: string;

  @ApiProperty({ example: true })
  @IsBoolean({ message: 'Confirme explicitamente a exclusao definitiva da conta.' })
  confirmPermanentDeletion!: boolean;
}
