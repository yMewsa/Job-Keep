import {
  CanActivate,
  ExecutionContext,
  HttpStatus,
  Injectable,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { UserRole } from '@prisma/client';
import { Request } from 'express';
import { AuthenticatedUser } from '../decorators/current-user.decorator';
import { ROLES_KEY } from '../decorators/roles.decorator';
import { DomainException } from '../exceptions/domain.exception';

/**
 * Garante controle de acesso baseado em papeis (RBAC) declarados com @Roles().
 */
@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private readonly reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const requiredRoles = this.reflector.getAllAndOverride<UserRole[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);

    if (!requiredRoles || requiredRoles.length === 0) {
      return true;
    }

    const request = context
      .switchToHttp()
      .getRequest<Request & { user?: AuthenticatedUser }>();

    if (!request.user) {
      throw new DomainException(
        HttpStatus.UNAUTHORIZED,
        'AUTH_REQUIRED',
        'Autenticacao necessaria para acessar este recurso.',
      );
    }

    if (!requiredRoles.includes(request.user.role)) {
      throw new DomainException(
        HttpStatus.FORBIDDEN,
        'INSUFFICIENT_ROLE',
        'Voce nao tem permissao para executar esta operacao.',
      );
    }

    return true;
  }
}
