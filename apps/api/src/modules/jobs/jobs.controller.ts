import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseUUIDPipe,
  Patch,
  Post,
  Query,
} from '@nestjs/common';
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
import {
  ChangeJobStatusDto,
  CreateJobDto,
  CreateJobReportDto,
  JobQueryDto,
  UpdateJobDto,
} from './dto/job.dto';
import {
  JobDeletionResponseDto,
  JobModerationQueueItemResponseDto,
  JobPageResponseDto,
  JobReportResponseDto,
  JobResponseDto,
} from './dto/job-response.dto';
import { JobsService } from './jobs.service';

@ApiTags('Jobs')
@Controller('jobs')
export class JobsController {
  constructor(private readonly jobsService: JobsService) {}

  @Public()
  @Get()
  @ApiOperation({ summary: 'Lista vagas públicas de empresas verificadas com filtros' })
  @ApiOkResponse({ type: JobPageResponseDto })
  listPublicJobs(@Query() query: JobQueryDto) {
    return this.jobsService.listPublicJobs(query);
  }

  @Get('me')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Lista vagas da empresa do recrutador autenticado' })
  @ApiOkResponse({ type: [JobResponseDto] })
  listCompanyJobs(@CurrentUser() user: AuthenticatedUser) {
    return this.jobsService.listCompanyJobs(user.userId);
  }

  @Post()
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Cria uma vaga em rascunho' })
  @ApiCreatedResponse({ type: JobResponseDto })
  createJob(@CurrentUser() user: AuthenticatedUser, @Body() dto: CreateJobDto) {
    return this.jobsService.createJob(user.userId, dto);
  }

  @Get('moderation/queue')
  @Roles(UserRole.ADMIN)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Lista vagas sinalizadas para moderação (ADMIN)' })
  @ApiOkResponse({ type: [JobModerationQueueItemResponseDto] })
  listModerationQueue() {
    return this.jobsService.listModerationQueue();
  }

  @Public()
  @Get(':jobId')
  @ApiOperation({ summary: 'Consulta uma vaga pública' })
  @ApiOkResponse({ type: JobResponseDto })
  getPublicJob(@Param('jobId', ParseUUIDPipe) jobId: string) {
    return this.jobsService.getPublicJob(jobId);
  }

  @Patch(':jobId')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Atualiza uma vaga da empresa do recrutador' })
  @ApiOkResponse({ type: JobResponseDto })
  updateJob(
    @CurrentUser() user: AuthenticatedUser,
    @Param('jobId', ParseUUIDPipe) jobId: string,
    @Body() dto: UpdateJobDto,
  ) {
    return this.jobsService.updateJob(user.userId, jobId, dto);
  }

  @Patch(':jobId/status')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Publica, pausa ou encerra uma vaga' })
  @ApiOkResponse({ type: JobResponseDto })
  changeStatus(
    @CurrentUser() user: AuthenticatedUser,
    @Param('jobId', ParseUUIDPipe) jobId: string,
    @Body() dto: ChangeJobStatusDto,
  ) {
    return this.jobsService.changeStatus(user.userId, jobId, dto);
  }

  @Delete(':jobId')
  @Roles(UserRole.COMPANY)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Exclui logicamente; encerra e notifica se houver candidaturas ativas' })
  @ApiOkResponse({ type: JobDeletionResponseDto })
  deleteJob(@CurrentUser() user: AuthenticatedUser, @Param('jobId', ParseUUIDPipe) jobId: string) {
    return this.jobsService.deleteJob(user.userId, jobId);
  }

  @Post(':jobId/reports')
  @Roles(UserRole.CANDIDATE)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Denuncia uma vaga para análise de moderação' })
  @ApiCreatedResponse({ type: JobReportResponseDto })
  reportJob(
    @CurrentUser() user: AuthenticatedUser,
    @Param('jobId', ParseUUIDPipe) jobId: string,
    @Body() dto: CreateJobReportDto,
  ) {
    return this.jobsService.reportJob(user.userId, jobId, dto);
  }
}
