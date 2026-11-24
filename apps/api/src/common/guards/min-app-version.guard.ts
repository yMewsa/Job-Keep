import { CanActivate, ExecutionContext, HttpStatus, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Request, Response } from 'express';
import { AppEnv } from '../config/env.schema';
import { DomainException } from '../exceptions/domain.exception';

const UPGRADE_REQUIRED_STATUS = 426 as HttpStatus;

/**
 * Compara duas versoes SemVer simples (major.minor.patch).
 * Retorna -1 se a < b, 0 se a == b e 1 se a > b.
 */
export function compareSemver(a: string, b: string): number {
  const partsA = a.split('.').map((n) => Number.parseInt(n, 10) || 0);
  const partsB = b.split('.').map((n) => Number.parseInt(n, 10) || 0);
  const len = Math.max(partsA.length, partsB.length, 3);

  for (let i = 0; i < len; i += 1) {
    const valA = partsA[i] ?? 0;
    const valB = partsB[i] ?? 0;
    if (valA < valB) return -1;
    if (valA > valB) return 1;
  }
  return 0;
}

/**
 * Verifica os cabecalhos X-Platform e X-App-Version para exigir atualizacao minima do app (426).
 */
@Injectable()
export class MinAppVersionGuard implements CanActivate {
  constructor(private readonly configService: ConfigService<AppEnv, true>) {}

  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest<Request>();
    const response = context.switchToHttp().getResponse<Response>();

    const platformHeader = request.headers['x-platform'];
    const versionHeader = request.headers['x-app-version'];

    if (typeof platformHeader !== 'string' || typeof versionHeader !== 'string') {
      return true;
    }

    const platform = platformHeader.toLowerCase();
    const version = versionHeader.trim();

    if (platform !== 'android' && platform !== 'ios') {
      return true;
    }

    const minVersion =
      platform === 'android'
        ? this.configService.get('MIN_ANDROID_VERSION', { infer: true })
        : this.configService.get('MIN_IOS_VERSION', { infer: true });

    const recommendedVersion =
      platform === 'android'
        ? this.configService.get('RECOMMENDED_ANDROID_VERSION', { infer: true })
        : this.configService.get('RECOMMENDED_IOS_VERSION', { infer: true });

    const storeUrl =
      platform === 'android'
        ? this.configService.get('ANDROID_STORE_URL', { infer: true })
        : this.configService.get('IOS_STORE_URL', { infer: true });

    if (compareSemver(version, minVersion) < 0) {
      throw new DomainException(
        UPGRADE_REQUIRED_STATUS,
        'APP_UPDATE_REQUIRED',
        `Esta versao do aplicativo (${version}) nao e mais suportada. Atualize para a versao ${minVersion} ou superior em ${storeUrl}.`,
      );
    }

    if (compareSemver(version, recommendedVersion) < 0) {
      response.setHeader('X-App-Update-Recommended', 'true');
    }

    return true;
  }
}
