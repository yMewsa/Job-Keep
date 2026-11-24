import { JobStatus, NotificationChannel, NotificationType } from '@prisma/client';
import { PrismaService } from '../../infrastructure/prisma/prisma.service';
import { JobsRepository } from './jobs.repository';

interface JobUpdateArgs {
  where: { id: string };
  data: { status?: JobStatus; closedAt?: Date; deletedAt?: Date };
}

interface NotificationCreateManyArgs {
  data: Array<{
    userId: string;
    type: NotificationType;
    title: string;
    body: string;
    payload: { jobId: string; applicationId: string; event: string };
    channel: NotificationChannel;
    sentAt: Date;
  }>;
}

function createTransaction(activeApplicationCount = 1, jobStatus: JobStatus = JobStatus.ACTIVE) {
  const applications = Array.from({ length: activeApplicationCount }, (_, index) => ({
    id: `c0a80123-0000-4000-8000-00000000000${index + 2}`,
    candidate: { userId: `c0a80123-0000-4000-8000-00000000001${index}` },
  }));
  const job = {
    id: 'c0a80123-0000-4000-8000-000000000001',
    title: 'Desenvolvedor backend',
    status: jobStatus,
    applications,
  };
  const update = jest
    .fn<Promise<{ status: JobStatus; deletedAt?: Date | null }>, [JobUpdateArgs]>()
    .mockResolvedValue({ ...job, status: JobStatus.CLOSED });
  const createMany = jest
    .fn<Promise<{ count: number }>, [NotificationCreateManyArgs]>()
    .mockResolvedValue({ count: activeApplicationCount });
  const transaction = {
    job: {
      findFirst: jest.fn().mockResolvedValue(job),
      update,
    },
    notification: {
      createMany,
    },
  };
  const prisma = {
    $transaction: jest.fn(async (callback: (tx: typeof transaction) => Promise<unknown>) =>
      callback(transaction),
    ),
  } as unknown as PrismaService;
  return { repository: new JobsRepository(prisma), transaction };
}

describe('JobsRepository.closeOrDeleteJob', () => {
  it('encerra e notifica candidaturas ativas em vez de excluir a vaga', async () => {
    const { repository, transaction } = createTransaction(2);

    const result = await repository.closeOrDeleteJob('company-id', 'job-id', true);

    expect(result?.closedInsteadOfDeleted).toBe(true);
    expect(transaction.job.update.mock.calls[0][0].data).not.toHaveProperty('deletedAt');
    const notifications = transaction.notification.createMany.mock.calls[0][0].data;
    expect(
      notifications.map(({ type, channel, payload }) => ({
        type,
        channel,
        event: payload.event,
      })),
    ).toEqual([
      {
        type: NotificationType.SYSTEM,
        channel: NotificationChannel.IN_APP,
        event: 'JOB_CLOSED',
      },
      {
        type: NotificationType.SYSTEM,
        channel: NotificationChannel.IN_APP,
        event: 'JOB_CLOSED',
      },
    ]);
  });

  it('aplica exclusão lógica quando não há candidaturas ativas', async () => {
    const { repository, transaction } = createTransaction(0);

    const result = await repository.closeOrDeleteJob('company-id', 'job-id', true);

    expect(result?.closedInsteadOfDeleted).toBe(false);
    expect(transaction.job.update.mock.calls[0][0].data).toHaveProperty('deletedAt');
    expect(transaction.notification.createMany.mock.calls).toHaveLength(0);
  });

  it('não repete notificações ao excluir uma vaga já encerrada', async () => {
    const { repository, transaction } = createTransaction(1, JobStatus.CLOSED);

    const result = await repository.closeOrDeleteJob('company-id', 'job-id', true);

    expect(result?.closedInsteadOfDeleted).toBe(true);
    expect(transaction.job.update.mock.calls).toHaveLength(0);
    expect(transaction.notification.createMany.mock.calls).toHaveLength(0);
  });
});
