import { Controller, Get } from '@nestjs/common';
import { ApiOkResponse, ApiOperation, ApiProperty, ApiTags } from '@nestjs/swagger';
import { Public } from '../../common/decorators/public.decorator';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';

export class HealthCheckResponseDto {
  @ApiProperty({ example: 'ok' })
  status!: 'ok' | 'degraded';

  @ApiProperty({ example: 'job-keep-api' })
  service!: string;

  @ApiProperty({ example: '2026-11-24T18:00:00.000Z' })
  timestamp!: string;

  @ApiProperty({
    example: { database: 'ok', redis: 'disabled' },
  })
  checks!: {
    database: 'ok' | 'error' | 'skipped';
    redis: 'ok' | 'disabled' | 'error';
  };
}

@ApiTags('Health')
@Controller('health')
export class HealthController {
  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
  ) {}

  @Public()
  @Get()
  @ApiOperation({ summary: 'Verifica a saude da API e dependencias basicas' })
  @ApiOkResponse({ type: HealthCheckResponseDto })
  async check(): Promise<HealthCheckResponseDto> {
    let database: 'ok' | 'error' | 'skipped' = 'skipped';
    if (process.env.SKIP_DB_CONNECT !== 'true') {
      try {
        await this.prisma.$queryRaw`SELECT 1`;
        database = 'ok';
      } catch {
        database = 'error';
      }
    }

    const redisStatus = await this.redis.ping();
    const isHealthy = database !== 'error' && redisStatus !== 'error';

    return {
      status: isHealthy ? 'ok' : 'degraded',
      service: 'job-keep-api',
      timestamp: new Date().toISOString(),
      checks: {
        database,
        redis: redisStatus,
      },
    };
  }
}
