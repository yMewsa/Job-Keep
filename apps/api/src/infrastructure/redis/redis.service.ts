import { Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import Redis from 'ioredis';
import { AppEnv } from '../../common/config/env.schema';

/**
 * Cliente Redis opcional para cache, rate limiting distribuido e health check.
 */
@Injectable()
export class RedisService implements OnModuleDestroy {
  private client: Redis | null = null;
  private readonly enabled: boolean;

  constructor(private readonly configService: ConfigService<AppEnv, true>) {
    this.enabled =
      this.configService.get('REDIS_ENABLED', { infer: true }) &&
      process.env.SKIP_DB_CONNECT !== 'true';

    if (this.enabled) {
      const url = this.configService.get('REDIS_URL', { infer: true });
      this.client = new Redis(url, {
        lazyConnect: true,
        maxRetriesPerRequest: 2,
      });
    }
  }

  isEnabled(): boolean {
    return this.enabled;
  }

  async ping(): Promise<'ok' | 'disabled' | 'error'> {
    if (!this.client) {
      return 'disabled';
    }
    try {
      const res = await this.client.ping();
      return res === 'PONG' ? 'ok' : 'error';
    } catch {
      return 'error';
    }
  }

  async onModuleDestroy(): Promise<void> {
    if (this.client) {
      await this.client.quit().catch(() => undefined);
    }
  }
}
