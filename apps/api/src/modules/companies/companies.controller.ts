import { Body, Controller, Delete, Get, Param, ParseUUIDPipe, Patch, Post } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { UserRole } from '@prisma/client';
import { AuthenticatedUser, CurrentUser } from '../../common/decorators/current-user.decorator';
import { Public } from '../../common/decorators/public.decorator';
import { Roles } from '../../common/decorators/roles.decorator';
import { CompaniesService } from './companies.service';
import {
  AcceptCompanyInvitationDto,
  ConfirmCompanyLogoDto,
  InviteCompanyMemberDto,
  PresignCompanyLogoDto,
  UpdateCompanyProfileDto,
  VerifyCompanyDto,
} from './dto/company.dto';
import {
  CompanyActionResponseDto,
  CompanyInvitationResponseDto,
  CompanyLogoResponseDto,
  CompanyLogoUploadResponseDto,
  CompanyMemberResponseDto,
  CompanyProfileResponseDto,
  PublicCompanyProfileResponseDto,
} from './dto/company-response.dto';

@ApiTags('Companies')
@Controller('companies')
export class CompaniesController {
  constructor(private readonly companiesService: CompaniesService) {}

  @Get('me')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Retorna o perfil da empresa do recrutador autenticado (RF07)' })
  @ApiOkResponse({ type: CompanyProfileResponseDto })
  getMyCompany(@CurrentUser() user: AuthenticatedUser) {
    return this.companiesService.getMyCompany(user.userId);
  }

  @Patch('me')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Atualiza perfil institucional da empresa (RF07)' })
  @ApiOkResponse({ type: CompanyProfileResponseDto })
  updateMyCompany(@CurrentUser() user: AuthenticatedUser, @Body() dto: UpdateCompanyProfileDto) {
    return this.companiesService.updateMyCompany(user.userId, dto);
  }

  @Delete('me')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Desativa logicamente o perfil da empresa (RF18)' })
  @ApiOkResponse({ type: CompanyActionResponseDto })
  deleteMyCompany(@CurrentUser() user: AuthenticatedUser) {
    return this.companiesService.deleteMyCompany(user.userId);
  }

  @Post('me/logo/presign')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Gera URL pre-assinada para upload do logo da empresa' })
  @ApiOkResponse({ type: CompanyLogoUploadResponseDto })
  presignLogo(@CurrentUser() user: AuthenticatedUser, @Body() dto: PresignCompanyLogoDto) {
    return this.companiesService.createLogoPresignedUpload(user.userId, dto);
  }

  @Post('me/logo/confirm')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Confirma upload do logo da empresa' })
  @ApiOkResponse({ type: CompanyLogoResponseDto })
  confirmLogo(@CurrentUser() user: AuthenticatedUser, @Body() dto: ConfirmCompanyLogoDto) {
    return this.companiesService.confirmLogoUpload(user.userId, dto);
  }

  @Post('me/invitations')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Convida recrutador por e-mail para a empresa (somente OWNER)' })
  @ApiCreatedResponse({ type: CompanyInvitationResponseDto })
  inviteMember(@CurrentUser() user: AuthenticatedUser, @Body() dto: InviteCompanyMemberDto) {
    return this.companiesService.inviteMember(user.userId, dto);
  }

  @Post('invitations/accept')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Aceita convite para atuar como recrutador da empresa' })
  @ApiOkResponse({ type: CompanyMemberResponseDto })
  acceptInvitation(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: AcceptCompanyInvitationDto,
  ) {
    return this.companiesService.acceptInvitation(user.userId, user.email, user.role, dto);
  }

  @Delete('me/members/:memberId')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Remove membro recrutador da empresa (somente OWNER)' })
  @ApiOkResponse({ type: CompanyActionResponseDto })
  removeMember(
    @CurrentUser() user: AuthenticatedUser,
    @Param('memberId', ParseUUIDPipe) memberId: string,
  ) {
    return this.companiesService.removeMember(user.userId, memberId);
  }

  @Patch(':companyId/verification')
  @Roles(UserRole.ADMIN)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Aprova ou rejeita verificacao CNPJ da empresa (ADMIN)' })
  @ApiOkResponse({ type: CompanyProfileResponseDto })
  verifyCompany(
    @Param('companyId', ParseUUIDPipe) companyId: string,
    @CurrentUser() admin: AuthenticatedUser,
    @Body() dto: VerifyCompanyDto,
  ) {
    return this.companiesService.verifyCompanyByAdmin(companyId, admin.userId, dto);
  }

  @Public()
  @Get(':companyId')
  @ApiOperation({ summary: 'Consulta dados publicos de uma empresa' })
  @ApiOkResponse({ type: PublicCompanyProfileResponseDto })
  getCompanyById(@Param('companyId', ParseUUIDPipe) companyId: string) {
    return this.companiesService.getPublicCompany(companyId);
  }
}
