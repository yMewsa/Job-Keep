import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

/**
 * Detalhe individual de erro de validacao de campo.
 */
export class ErrorDetailDto {
  @ApiProperty({ example: 'email' })
  field!: string;

  @ApiProperty({ example: 'VALIDATION_ERROR' })
  code!: string;

  @ApiProperty({ example: 'Informe um e-mail valido.' })
  message!: string;
}

/**
 * Envelope padrao de erro HTTP da API.
 */
export class ErrorResponseDto {
  @ApiProperty({ example: 400 })
  statusCode!: number;

  @ApiProperty({ example: 'VALIDATION_FAILED' })
  errorCode!: string;

  @ApiProperty({ example: 'Os dados informados sao invalidos.' })
  message!: string;

  @ApiPropertyOptional({ type: [ErrorDetailDto] })
  details?: ErrorDetailDto[];

  @ApiProperty({ example: '2026-11-24T18:00:00.000Z' })
  timestamp!: string;

  @ApiProperty({ example: '/api/v1/auth/login' })
  path!: string;

  @ApiProperty({ example: 'req_9f42e8a0-1b2c-4d3e-8f4a-1234567890ab' })
  requestId!: string;
}
