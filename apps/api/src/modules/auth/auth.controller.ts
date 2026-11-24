import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseUUIDPipe,
  Post,
  Req,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { Throttle } from '@nestjs/throttler';
import { Request } from 'express';
import { AuthenticatedUser, CurrentUser } from '../../common/decorators/current-user.decorator';
import { Public } from '../../common/decorators/public.decorator';
import { ErrorResponseDto } from '../../common/dto/error-response.dto';
import { AuthService, RequestClientContext } from './auth.service';
import {
  EmailOnlyDto,
  LoginDto,
  LogoutDto,
  RefreshTokenDto,
  RegisterCandidateDto,
  RegisterCompanyDto,
  ResetPasswordDto,
  VerifyEmailDto,
} from './dto/auth.dto';
import {
  AuthTokensResponseDto,
  MessageResponseDto,
  RegisterResponseDto,
  SessionDto,
} from './dto/auth-response.dto';

@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @Post('register/candidate')
  @Throttle({ default: { limit: 10, ttl: 60_000 } })
  @ApiOperation({ summary: 'Cadastra uma nova conta de candidato (RF01)' })
  @ApiCreatedResponse({ type: RegisterResponseDto })
  @ApiResponse({ status: 409, type: ErrorResponseDto })
  @ApiResponse({ status: 422, type: ErrorResponseDto })
  registerCandidate(@Body() dto: RegisterCandidateDto, @Req() req: Request) {
    return this.authService.registerCandidate(dto, this.extractContext(req));
  }

  @Public()
  @Post('register/company')
  @Throttle({ default: { limit: 10, ttl: 60_000 } })
  @ApiOperation({ summary: 'Cadastra uma nova conta de empresa com validacao de CNPJ (RF02)' })
  @ApiCreatedResponse({ type: RegisterResponseDto })
  @ApiResponse({ status: 409, type: ErrorResponseDto })
  @ApiResponse({ status: 422, type: ErrorResponseDto })
  registerCompany(@Body() dto: RegisterCompanyDto, @Req() req: Request) {
    return this.authService.registerCompany(dto, this.extractContext(req));
  }

  @Public()
  @Post('verify-email')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 10, ttl: 60_000 } })
  @ApiOperation({ summary: 'Verifica e-mail com codigo OTP de 6 digitos ou token de link' })
  @ApiOkResponse({ type: MessageResponseDto })
  @ApiResponse({ status: 400, type: ErrorResponseDto })
  verifyEmail(@Body() dto: VerifyEmailDto) {
    return this.authService.verifyEmail(dto);
  }

  @Public()
  @Post('resend-verification')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @ApiOperation({ summary: 'Reenvia codigo de verificacao de e-mail (protegido contra enumeracao)' })
  @ApiOkResponse({ type: MessageResponseDto })
  resendVerification(@Body() dto: EmailOnlyDto) {
    return this.authService.resendVerification(dto);
  }

  @Public()
  @Post('login')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 10, ttl: 60_000 } })
  @ApiOperation({ summary: 'Autentica usuario e emite JWT + Refresh Token rotativo (RF03)' })
  @ApiOkResponse({ type: AuthTokensResponseDto })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  @ApiResponse({ status: 429, type: ErrorResponseDto })
  login(@Body() dto: LoginDto, @Req() req: Request) {
    return this.authService.login(dto, this.extractContext(req));
  }

  @Public()
  @Post('refresh')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 20, ttl: 60_000 } })
  @ApiOperation({ summary: 'Renova access token rotacionando o refresh token' })
  @ApiOkResponse({ type: AuthTokensResponseDto })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  refresh(@Body() dto: RefreshTokenDto, @Req() req: Request) {
    return this.authService.refresh(dto, this.extractContext(req));
  }

  @Post('logout')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Encerra a sessao atual e revoga o refresh token (RF03)' })
  @ApiOkResponse({ type: MessageResponseDto })
  logout(@CurrentUser() user: AuthenticatedUser, @Body() dto: LogoutDto) {
    return this.authService.logout(user.userId, user.sessionId, dto);
  }

  @Get('sessions')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Lista dispositivos e sessoes ativas do usuario' })
  @ApiOkResponse({ type: [SessionDto] })
  listSessions(@CurrentUser() user: AuthenticatedUser) {
    return this.authService.listSessions(user.userId, user.sessionId);
  }

  @Delete('sessions/:sessionId')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Desconecta um dispositivo especifico' })
  @ApiOkResponse({ type: MessageResponseDto })
  revokeSession(
    @CurrentUser() user: AuthenticatedUser,
    @Param('sessionId', ParseUUIDPipe) sessionId: string,
  ) {
    return this.authService.revokeSession(user.userId, sessionId);
  }

  @Post('logout-all')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Encerra todas as sessoes ativas em todos os dispositivos' })
  @ApiOkResponse({ type: MessageResponseDto })
  logoutAll(@CurrentUser() user: AuthenticatedUser) {
    return this.authService.logoutAllDevices(user.userId);
  }

  @Public()
  @Post('forgot-password')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @ApiOperation({ summary: 'Solicita codigo de 6 digitos para recuperacao de senha (RF04)' })
  @ApiOkResponse({ type: MessageResponseDto })
  forgotPassword(@Body() dto: EmailOnlyDto) {
    return this.authService.forgotPassword(dto);
  }

  @Public()
  @Post('reset-password')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @ApiOperation({
    summary: 'Redefine a senha com codigo de 6 digitos ou token e revoga todas as sessoes (RF04)',
  })
  @ApiOkResponse({ type: MessageResponseDto })
  @ApiResponse({ status: 400, type: ErrorResponseDto })
  resetPassword(@Body() dto: ResetPasswordDto) {
    return this.authService.resetPassword(dto);
  }

  private extractContext(req: Request): RequestClientContext {
    const userAgent = req.headers['user-agent'];
    return {
      ipAddress: req.ip,
      userAgent: typeof userAgent === 'string' ? userAgent.slice(0, 500) : undefined,
    };
  }
}
