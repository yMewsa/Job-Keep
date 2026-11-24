import { writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function exportOpenApi() {
  process.env.SKIP_DB_CONNECT = 'true';
  const app = await NestFactory.create(AppModule, { logger: false });
  try {
    const config = new DocumentBuilder()
      .setTitle('Job Keep API')
      .setDescription('API agnóstica ao cliente da plataforma Job Keep.')
      .setVersion('0.1.0')
      .addBearerAuth()
      .build();
    const document = SwaggerModule.createDocument(app, config);
    const outputPath = resolve(process.cwd(), '../../docs/openapi.json');
    await writeFile(outputPath, `${JSON.stringify(document, null, 2)}\n`, 'utf8');
    console.info(`OpenAPI exportado para ${outputPath}`);
  } finally {
    await app.close();
  }
}

exportOpenApi().catch((error: unknown) => {
  console.error('Falha ao exportar o documento OpenAPI.', error);
  process.exitCode = 1;
});
