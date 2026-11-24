import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseUUIDPipe,
  Patch,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { UserRole } from '@prisma/client';
import { AuthenticatedUser, CurrentUser } from '../../common/decorators/current-user.decorator';
import { Roles } from '../../common/decorators/roles.decorator';
import { ErrorResponseDto } from '../../common/dto/error-response.dto';
import { CandidatesService } from './candidates.service';
import {
  AddCandidateSkillDto,
  ConfirmUploadDto,
  CreateEducationDto,
  CreateExperienceDto,
  PresignUploadDto,
  SuggestSkillDto,
  UpdateCandidateProfileDto,
  UpdateCandidateVisibilityDto,
  UpdateCandidateWorkPreferencesDto,
  UpdateEducationDto,
  UpdateExperienceDto,
} from './dto/candidate-profile.dto';

@ApiTags('Candidates')
@ApiBearerAuth()
@Controller('candidates')
export class CandidatesController {
  constructor(private readonly candidatesService: CandidatesService) {}

  @Get('me')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Retorna o perfil completo do candidato autenticado e percentual de completude' })
  @ApiResponse({ status: 403, type: ErrorResponseDto })
  getMyProfile(@CurrentUser() user: AuthenticatedUser) {
    return this.candidatesService.getMyProfile(user.userId);
  }

  @Put('me')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Atualiza dados basicos do perfil do candidato (RF05)' })
  updateMyProfile(@CurrentUser() user: AuthenticatedUser, @Body() dto: UpdateCandidateProfileDto) {
    return this.candidatesService.updateMyProfile(user.userId, dto);
  }

  @Put('me/preferences')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Atualiza preferencias de trabalho e pretensao salarial do candidato' })
  updateWorkPreferences(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdateCandidateWorkPreferencesDto,
  ) {
    return this.candidatesService.updateWorkPreferences(user.userId, dto);
  }

  @Put('me/visibility')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Configura o que empresas visualizam antes do match' })
  updateVisibility(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdateCandidateVisibilityDto,
  ) {
    return this.candidatesService.updateVisibility(user.userId, dto);
  }

  @Post('me/experiences')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Adiciona experiencia profissional (RF06)' })
  addExperience(@CurrentUser() user: AuthenticatedUser, @Body() dto: CreateExperienceDto) {
    return this.candidatesService.addExperience(user.userId, dto);
  }

  @Patch('me/experiences/:experienceId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Edita experiencia profissional (RF06)' })
  updateExperience(
    @CurrentUser() user: AuthenticatedUser,
    @Param('experienceId', ParseUUIDPipe) experienceId: string,
    @Body() dto: UpdateExperienceDto,
  ) {
    return this.candidatesService.updateExperience(user.userId, experienceId, dto);
  }

  @Delete('me/experiences/:experienceId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Remove experiencia profissional (RF06)' })
  deleteExperience(
    @CurrentUser() user: AuthenticatedUser,
    @Param('experienceId', ParseUUIDPipe) experienceId: string,
  ) {
    return this.candidatesService.deleteExperience(user.userId, experienceId);
  }

  @Post('me/educations')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Adiciona formacao academica (RF06)' })
  addEducation(@CurrentUser() user: AuthenticatedUser, @Body() dto: CreateEducationDto) {
    return this.candidatesService.addEducation(user.userId, dto);
  }

  @Patch('me/educations/:educationId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Edita formacao academica (RF06)' })
  updateEducation(
    @CurrentUser() user: AuthenticatedUser,
    @Param('educationId', ParseUUIDPipe) educationId: string,
    @Body() dto: UpdateEducationDto,
  ) {
    return this.candidatesService.updateEducation(user.userId, educationId, dto);
  }

  @Delete('me/educations/:educationId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Remove formacao academica (RF06)' })
  deleteEducation(
    @CurrentUser() user: AuthenticatedUser,
    @Param('educationId', ParseUUIDPipe) educationId: string,
  ) {
    return this.candidatesService.deleteEducation(user.userId, educationId);
  }

  @Get('skills')
  @ApiOperation({ summary: 'Busca habilidades padronizadas para autocomplete' })
  @ApiQuery({ name: 'q', required: false })
  @ApiQuery({ name: 'category', required: false })
  searchSkills(@Query('q') query?: string, @Query('category') category?: string) {
    return this.candidatesService.searchSkills(query, category);
  }

  @Post('skills/suggest')
  @Roles(UserRole.CANDIDATE, UserRole.COMPANY)
  @ApiOperation({ summary: 'Sugere uma nova habilidade para o catalogo' })
  suggestSkill(@CurrentUser() user: AuthenticatedUser, @Body() dto: SuggestSkillDto) {
    return this.candidatesService.suggestSkill(user.userId, dto);
  }

  @Post('me/skills')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Adiciona ou atualiza habilidade no perfil do candidato (RF06)' })
  upsertSkill(@CurrentUser() user: AuthenticatedUser, @Body() dto: AddCandidateSkillDto) {
    return this.candidatesService.upsertCandidateSkill(user.userId, dto);
  }

  @Delete('me/skills/:skillId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Remove habilidade do perfil do candidato' })
  removeSkill(
    @CurrentUser() user: AuthenticatedUser,
    @Param('skillId', ParseUUIDPipe) skillId: string,
  ) {
    return this.candidatesService.removeCandidateSkill(user.userId, skillId);
  }

  @Post('me/resume/presign')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Gera URL pre-assinada para upload direto de curriculo (PDF/DOCX)' })
  presignResume(@CurrentUser() user: AuthenticatedUser, @Body() dto: PresignUploadDto) {
    return this.candidatesService.createResumePresignedUpload(user.userId, dto);
  }

  @Post('me/resume/confirm')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Confirma upload do curriculo validando magic bytes e tamanho real' })
  confirmResume(@CurrentUser() user: AuthenticatedUser, @Body() dto: ConfirmUploadDto) {
    return this.candidatesService.confirmResumeUpload(user.userId, dto);
  }

  @Delete('me/resume/:resumeId')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Remove um curriculo enviado' })
  deleteResume(
    @CurrentUser() user: AuthenticatedUser,
    @Param('resumeId', ParseUUIDPipe) resumeId: string,
  ) {
    return this.candidatesService.deleteResume(user.userId, resumeId);
  }

  @Post('me/photo/presign')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Gera URL pre-assinada para upload da foto de perfil' })
  presignPhoto(@CurrentUser() user: AuthenticatedUser, @Body() dto: PresignUploadDto) {
    return this.candidatesService.createPhotoPresignedUpload(user.userId, dto);
  }

  @Post('me/photo/confirm')
  @Roles(UserRole.CANDIDATE)
  @ApiOperation({ summary: 'Confirma upload da foto de perfil e gera miniatura' })
  confirmPhoto(@CurrentUser() user: AuthenticatedUser, @Body() dto: ConfirmUploadDto) {
    return this.candidatesService.confirmPhotoUpload(user.userId, dto);
  }

  @Get(':candidateId')
  @Roles(UserRole.COMPANY, UserRole.ADMIN, UserRole.CANDIDATE)
  @ApiOperation({
    summary: 'Visualiza perfil do candidato respeitando regras de visibilidade antes do match',
  })
  getCandidateById(
    @Param('candidateId', ParseUUIDPipe) candidateId: string,
    @CurrentUser() user: AuthenticatedUser,
  ) {
    return this.candidatesService.getCandidateProfileForViewer(
      candidateId,
      user.userId,
      user.role,
    );
  }
}
