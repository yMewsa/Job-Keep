import { Module } from '@nestjs/common';
import { CompaniesModule } from '../companies/companies.module';
import { JobsController } from './jobs.controller';
import { JobsRepository } from './jobs.repository';
import { JobsService } from './jobs.service';

@Module({
  imports: [CompaniesModule],
  controllers: [JobsController],
  providers: [JobsRepository, JobsService],
  exports: [JobsRepository, JobsService],
})
export class JobsModule {}
