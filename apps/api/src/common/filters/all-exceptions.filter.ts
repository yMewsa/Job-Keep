import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import { Request, Response } from 'express';
import { ErrorDetailDto, ErrorResponseDto } from '../dto/error-response.dto';
import { DomainException } from '../exceptions/domain.exception';

const UPGRADE_REQUIRED_STATUS = 426 as HttpStatus;

interface HttpExceptionPayload {
  message?: string | string[];
  errorCode?: string;
  details?: ErrorDetailDto[];
}

interface PrismaLikeError {
  code?: string;
  meta?: { target?: string[] };
}

/**
 * Filtro global que padroniza todas as respostas de erro HTTP da plataforma.
 */
@Catch()
export class AllExceptionsFilter implements ExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);

  catch(exception: unknown, host: ArgumentsHost): void {
    const ctx = host.switchToHttp();
    const request = ctx.getRequest<Request & { requestId?: string }>();
    const response = ctx.getResponse<Response>();

    const requestId =
      request.requestId ??
      (typeof request.headers['x-request-id'] === 'string'
        ? request.headers['x-request-id']
        : 'req_unknown');

    const normalized = this.normalizeException(exception);

    if (normalized.statusCode >= 500) {
      this.logger.error(
        `[${requestId}] ${request.method} ${request.url} -> ${normalized.statusCode}: ${normalized.message}`,
        exception instanceof Error ? exception.stack : undefined,
      );
    }

    const body: ErrorResponseDto = {
      statusCode: normalized.statusCode,
      errorCode: normalized.errorCode,
      message: normalized.message,
      ...(normalized.details ? { details: normalized.details } : {}),
      timestamp: new Date().toISOString(),
      path: request.url,
      requestId,
    };

    response.status(normalized.statusCode).json(body);
  }

  private normalizeException(exception: unknown): {
    statusCode: number;
    errorCode: string;
    message: string;
    details?: ErrorDetailDto[];
  } {
    if (exception instanceof DomainException) {
      return {
        statusCode: exception.getStatus(),
        errorCode: exception.errorCode,
        message: exception.message,
        details: exception.details,
      };
    }

    if (exception instanceof HttpException) {
      const statusCode = exception.getStatus();
      const rawResponse = exception.getResponse();

      if (typeof rawResponse === 'object' && rawResponse !== null) {
        const payload = rawResponse as HttpExceptionPayload;
        if (Array.isArray(payload.message)) {
          return {
            statusCode,
            errorCode: payload.errorCode ?? 'VALIDATION_FAILED',
            message: 'Os dados informados sao invalidos.',
            details: payload.message.map((msg) => ({
              field: 'body',
              code: 'VALIDATION_ERROR',
              message: msg,
            })),
          };
        }

        return {
          statusCode,
          errorCode: payload.errorCode ?? this.defaultCodeForStatus(statusCode),
          message: typeof payload.message === 'string' ? payload.message : exception.message,
          details: payload.details,
        };
      }

      return {
        statusCode,
        errorCode: this.defaultCodeForStatus(statusCode),
        message: typeof rawResponse === 'string' ? rawResponse : exception.message,
      };
    }

    const prismaError = exception as PrismaLikeError;
    if (prismaError?.code === 'P2002') {
      return {
        statusCode: HttpStatus.CONFLICT,
        errorCode: 'UNIQUE_CONSTRAINT_VIOLATION',
        message: 'Ja existe um registro cadastrado com os dados informados.',
      };
    }
    if (prismaError?.code === 'P2025') {
      return {
        statusCode: HttpStatus.NOT_FOUND,
        errorCode: 'RESOURCE_NOT_FOUND',
        message: 'O recurso solicitado nao foi encontrado.',
      };
    }

    return {
      statusCode: HttpStatus.INTERNAL_SERVER_ERROR,
      errorCode: 'INTERNAL_SERVER_ERROR',
      message: 'Ocorreu um erro interno inesperado. Tente novamente em instantes.',
    };
  }

  private defaultCodeForStatus(status: number): string {
    switch (status as HttpStatus) {
      case HttpStatus.BAD_REQUEST:
        return 'BAD_REQUEST';
      case HttpStatus.UNAUTHORIZED:
        return 'UNAUTHORIZED';
      case HttpStatus.FORBIDDEN:
        return 'FORBIDDEN';
      case HttpStatus.NOT_FOUND:
        return 'NOT_FOUND';
      case HttpStatus.CONFLICT:
        return 'CONFLICT';
      case HttpStatus.UNPROCESSABLE_ENTITY:
        return 'UNPROCESSABLE_ENTITY';
      case UPGRADE_REQUIRED_STATUS:
        return 'APP_UPDATE_REQUIRED';
      case HttpStatus.TOO_MANY_REQUESTS:
        return 'TOO_MANY_REQUESTS';
      default:
        return 'HTTP_ERROR';
    }
  }
}
