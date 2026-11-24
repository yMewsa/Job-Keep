import { HttpException, HttpStatus } from '@nestjs/common';
import { ErrorDetailDto } from '../dto/error-response.dto';

/**
 * Excecao de dominio com codigo semantico estavel e mensagem amigavel em pt-BR.
 */
export class DomainException extends HttpException {
  readonly errorCode: string;
  readonly details?: ErrorDetailDto[];

  constructor(
    statusCode: HttpStatus,
    errorCode: string,
    message: string,
    details?: ErrorDetailDto[],
  ) {
    super(
      {
        statusCode,
        errorCode,
        message,
        details,
      },
      statusCode,
    );
    this.errorCode = errorCode;
    this.details = details;
  }
}
