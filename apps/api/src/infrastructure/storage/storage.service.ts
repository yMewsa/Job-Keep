import {
  DeleteObjectCommand,
  GetObjectCommand,
  PutObjectCommand,
  S3Client,
} from '@aws-sdk/client-s3';
import { getSignedUrl } from '@aws-sdk/s3-request-presigner';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { AppEnv } from '../../common/config/env.schema';

export interface PresignedUploadResult {
  uploadUrl: string;
  fileKey: string;
  publicUrl: string;
  expiresInSeconds: number;
}

/**
 * Cliente S3/MinIO para geracao de URLs pre-assinadas e manipulacao de objetos.
 */
@Injectable()
export class StorageService {
  private readonly s3Client: S3Client;
  private readonly bucket: string;
  private readonly endpoint: string;

  constructor(private readonly configService: ConfigService<AppEnv, true>) {
    this.endpoint = this.configService.get('S3_ENDPOINT', { infer: true });
    this.bucket = this.configService.get('S3_BUCKET', { infer: true });

    this.s3Client = new S3Client({
      endpoint: this.endpoint,
      region: this.configService.get('S3_REGION', { infer: true }),
      forcePathStyle: true,
      credentials: {
        accessKeyId: this.configService.get('S3_ACCESS_KEY', { infer: true }),
        secretAccessKey: this.configService.get('S3_SECRET_KEY', { infer: true }),
      },
    });
  }

  async createPresignedPutUrl(
    fileKey: string,
    contentType: string,
    expiresInSeconds = 300,
  ): Promise<PresignedUploadResult> {
    const command = new PutObjectCommand({
      Bucket: this.bucket,
      Key: fileKey,
      ContentType: contentType,
    });

    const uploadUrl = await getSignedUrl(this.s3Client, command, {
      expiresIn: expiresInSeconds,
    });

    return {
      uploadUrl,
      fileKey,
      publicUrl: this.buildObjectUrl(fileKey),
      expiresInSeconds,
    };
  }

  async getObjectBuffer(fileKey: string): Promise<Buffer> {
    const response = await this.s3Client.send(
      new GetObjectCommand({
        Bucket: this.bucket,
        Key: fileKey,
      }),
    );

    if (!response.Body) {
      return Buffer.alloc(0);
    }

    const bytes = await response.Body.transformToByteArray();
    return Buffer.from(bytes);
  }

  async putBuffer(fileKey: string, buffer: Buffer, contentType: string): Promise<string> {
    await this.s3Client.send(
      new PutObjectCommand({
        Bucket: this.bucket,
        Key: fileKey,
        Body: buffer,
        ContentType: contentType,
      }),
    );

    return this.buildObjectUrl(fileKey);
  }

  async deleteObject(fileKey: string): Promise<void> {
    await this.s3Client.send(
      new DeleteObjectCommand({
        Bucket: this.bucket,
        Key: fileKey,
      }),
    );
  }

  buildObjectUrl(fileKey: string): string {
    const cleanEndpoint = this.endpoint.replace(/\/+$/, '');
    return `${cleanEndpoint}/${this.bucket}/${fileKey}`;
  }
}
