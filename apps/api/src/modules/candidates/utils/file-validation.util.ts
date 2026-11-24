import { extname } from 'node:path';

export const MAX_RESUME_BYTES = 5 * 1024 * 1024; // 5 MB
export const MAX_PHOTO_BYTES = 3 * 1024 * 1024; // 3 MB

export const ALLOWED_RESUME_MIMES = [
  'application/pdf',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
] as const;

export const ALLOWED_IMAGE_MIMES = [
  'image/jpeg',
  'image/png',
  'image/webp',
] as const;

/**
 * Sanitiza o nome de arquivo removendo caminhos, acentos e caracteres inseguros.
 */
export function sanitizeFileName(rawName: string): string {
  const baseName = rawName.split(/[/\\]/).pop() ?? 'arquivo';
  const ext = extname(baseName).toLowerCase().replace(/[^.a-z0-9]/g, '');
  const stem = baseName
    .slice(0, baseName.length - ext.length)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-zA-Z0-9_-]/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
    .slice(0, 80);

  return `${stem || 'file'}${ext}`;
}

/**
 * Verifica os magic bytes reais de um curriculo (PDF ou DOCX).
 */
export function detectResumeMagicType(buffer: Buffer): 'pdf' | 'docx' | null {
  if (buffer.length < 4) {
    return null;
  }

  // PDF comeca com %PDF-
  if (buffer.subarray(0, 5).toString('ascii') === '%PDF-') {
    return 'pdf';
  }

  // DOCX e um arquivo ZIP (PK\x03\x04) contendo word/document.xml
  const isZip =
    buffer[0] === 0x50 && buffer[1] === 0x4b && buffer[2] === 0x03 && buffer[3] === 0x04;
  if (isZip && buffer.includes(Buffer.from('word/'))) {
    return 'docx';
  }

  return null;
}

/**
 * Verifica os magic bytes reais de uma imagem (JPEG, PNG ou WEBP).
 */
export function detectImageMagicType(buffer: Buffer): 'jpeg' | 'png' | 'webp' | null {
  if (buffer.length < 12) {
    return null;
  }

  // JPEG: FF D8 FF
  if (buffer[0] === 0xff && buffer[1] === 0xd8 && buffer[2] === 0xff) {
    return 'jpeg';
  }

  // PNG: 89 50 4E 47 0D 0A 1A 0A
  if (
    buffer[0] === 0x89 &&
    buffer[1] === 0x50 &&
    buffer[2] === 0x4e &&
    buffer[3] === 0x47
  ) {
    return 'png';
  }

  // WEBP: RIFF....WEBP
  if (
    buffer.subarray(0, 4).toString('ascii') === 'RIFF' &&
    buffer.subarray(8, 12).toString('ascii') === 'WEBP'
  ) {
    return 'webp';
  }

  return null;
}
