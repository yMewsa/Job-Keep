import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as nodemailer from 'nodemailer';
import { AppEnv } from '../../common/config/env.schema';

export interface SendMailInput {
  to: string;
  subject: string;
  text: string;
  html: string;
}

/**
 * Servico de envio de e-mail transacional (SMTP/Mailpit ou log em dev/testes).
 */
@Injectable()
export class MailerService {
  private readonly logger = new Logger(MailerService.name);
  private readonly transporter: nodemailer.Transporter | null;
  private readonly fromAddress: string;
  private readonly provider: 'console' | 'smtp';

  constructor(private readonly configService: ConfigService<AppEnv, true>) {
    this.provider = this.configService.get('MAIL_PROVIDER', { infer: true });
    this.fromAddress = this.configService.get('MAIL_FROM', { infer: true });

    if (this.provider === 'smtp') {
      const user = this.configService.get('SMTP_USER', { infer: true });
      const pass = this.configService.get('SMTP_PASSWORD', { infer: true });
      this.transporter = nodemailer.createTransport({
        host: this.configService.get('SMTP_HOST', { infer: true }),
        port: this.configService.get('SMTP_PORT', { infer: true }),
        secure: this.configService.get('SMTP_SECURE', { infer: true }),
        ...(user ? { auth: { user, pass } } : {}),
      });
    } else {
      this.transporter = null;
    }
  }

  async sendMail(input: SendMailInput): Promise<void> {
    if (this.transporter) {
      await this.transporter.sendMail({
        from: this.fromAddress,
        to: input.to,
        subject: input.subject,
        text: input.text,
        html: input.html,
      });
      return;
    }

    this.logger.log(`[Mail:console] Para=${input.to} | Assunto="${input.subject}"`);
  }
}
