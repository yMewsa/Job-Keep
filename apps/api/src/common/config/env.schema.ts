import { z } from 'zod';

/**
 * Schema de validacao das variaveis de ambiente da API.
 * Falha rapidamente na inicializacao se configuracoes obrigatorias estiverem ausentes.
 */
export const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'staging', 'production']).default('development'),
  PORT: z.coerce.number().int().positive().default(3000),
  APP_NAME: z.string().min(1).default('job-keep-api'),
  LOG_LEVEL: z.enum(['fatal', 'error', 'warn', 'info', 'debug', 'trace', 'silent']).default('info'),

  DATABASE_URL: z
    .string()
    .min(1)
    .default('postgresql://jobkeep:jobkeep_dev_password@localhost:5432/job_keep?schema=public'),

  REDIS_URL: z.string().default('redis://localhost:6379'),
  REDIS_ENABLED: z
    .union([z.boolean(), z.string()])
    .transform((value) => value === true || value === 'true')
    .default(false),

  JWT_ACCESS_SECRET: z
    .string()
    .min(32, 'JWT_ACCESS_SECRET deve ter pelo menos 32 caracteres')
    .default('dev_only_access_secret_must_be_replaced_in_production_32'),
  JWT_ACCESS_EXPIRES_IN: z.string().default('15m'),
  JWT_REFRESH_SECRET: z
    .string()
    .min(32, 'JWT_REFRESH_SECRET deve ter pelo menos 32 caracteres')
    .default('dev_only_refresh_secret_must_be_replaced_in_production_32'),
  JWT_REFRESH_EXPIRES_DAYS: z.coerce.number().int().positive().default(30),

  CORS_ORIGINS: z.string().default('http://localhost:3000,http://localhost:5173'),
  THROTTLE_TTL_MS: z.coerce.number().int().positive().default(60_000),
  THROTTLE_LIMIT: z.coerce.number().int().positive().default(60),
  LOGIN_MAX_ATTEMPTS: z.coerce.number().int().positive().default(5),
  LOGIN_LOCKOUT_MINUTES: z.coerce.number().int().positive().default(15),

  MAIL_PROVIDER: z.enum(['console', 'smtp']).default('console'),
  SMTP_HOST: z.string().default('localhost'),
  SMTP_PORT: z.coerce.number().int().positive().default(1025),
  SMTP_SECURE: z
    .union([z.boolean(), z.string()])
    .transform((value) => value === true || value === 'true')
    .default(false),
  SMTP_USER: z.string().optional().default(''),
  SMTP_PASSWORD: z.string().optional().default(''),
  MAIL_FROM: z.string().default('Job Keep <no-reply@jobkeep.local>'),
  APP_PUBLIC_URL: z.string().url().default('http://localhost:3000'),

  S3_ENDPOINT: z.string().default('http://localhost:9000'),
  S3_REGION: z.string().default('us-east-1'),
  S3_BUCKET: z.string().default('job-keep-uploads'),
  S3_ACCESS_KEY: z.string().default('jobkeep_minio'),
  S3_SECRET_KEY: z.string().default('jobkeep_minio_password'),

  MIN_ANDROID_VERSION: z.string().default('0.1.0'),
  RECOMMENDED_ANDROID_VERSION: z.string().default('0.1.0'),
  ANDROID_STORE_URL: z
    .string()
    .default('https://play.google.com/store/apps/details?id=br.com.jobkeep.mobile'),
  MIN_IOS_VERSION: z.string().default('0.1.0'),
  RECOMMENDED_IOS_VERSION: z.string().default('0.1.0'),
  IOS_STORE_URL: z.string().default('https://apps.apple.com/app/job-keep/id0000000000'),

  MAX_ACTIVE_JOBS_PER_COMPANY: z.coerce.number().int().positive().default(10),
});

export type AppEnv = z.infer<typeof envSchema>;

/**
 * Valida o objeto de variaveis de ambiente carregado pelo NestJS ConfigModule.
 */
export function validateEnv(config: Record<string, unknown>): AppEnv {
  const parsed = envSchema.safeParse(config);
  if (!parsed.success) {
    const formatted = parsed.error.issues
      .map((issue) => `${issue.path.join('.')}: ${issue.message}`)
      .join('; ');
    throw new Error(`Variaveis de ambiente invalidas: ${formatted}`);
  }
  return parsed.data;
}
