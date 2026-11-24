import {
  ApplicationStatus,
  AvailabilityStatus,
  CompanyMemberRole,
  CompanySize,
  CompanyVerificationStatus,
  ConsentType,
  ContractType,
  EducationStatus,
  JobSeniority,
  JobStatus,
  MatchStatus,
  NotificationChannel,
  NotificationType,
  PrismaClient,
  SkillLevel,
  SkillRequirementType,
  SwipeDecision,
  SwipeTargetType,
  ThemeBackgroundType,
  ThemeFontFamily,
  ThemeLayoutPreset,
  UserRole,
  UserStatus,
  WorkMode,
} from '@prisma/client';
import * as argon2 from 'argon2';

const prisma = new PrismaClient();

/**
 * Gera um CNPJ valido de 14 digitos a partir de uma raiz de 8 digitos.
 */
function buildValidCnpj(root8: string): string {
  const base12 = `${root8}0001`;
  const calcDigit = (digits: string, weights: number[]): number => {
    const sum = weights.reduce((acc, weight, idx) => acc + Number(digits[idx]) * weight, 0);
    const remainder = sum % 11;
    return remainder < 2 ? 0 : 11 - remainder;
  };
  const d1 = calcDigit(base12, [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]);
  const d2 = calcDigit(`${base12}${d1}`, [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]);
  return `${base12}${d1}${d2}`;
}

const SKILLS_CATALOG = [
  { name: 'TypeScript', slug: 'typescript', category: 'Backend' },
  { name: 'Node.js', slug: 'nodejs', category: 'Backend' },
  { name: 'NestJS', slug: 'nestjs', category: 'Backend' },
  { name: 'PostgreSQL', slug: 'postgresql', category: 'Dados' },
  { name: 'Redis', slug: 'redis', category: 'Infraestrutura' },
  { name: 'Flutter', slug: 'flutter', category: 'Mobile' },
  { name: 'Dart', slug: 'dart', category: 'Mobile' },
  { name: 'React', slug: 'react', category: 'Frontend' },
  { name: 'Docker', slug: 'docker', category: 'DevOps' },
  { name: 'Kubernetes', slug: 'kubernetes', category: 'DevOps' },
  { name: 'AWS', slug: 'aws', category: 'Cloud' },
  { name: 'Python', slug: 'python', category: 'Backend' },
  { name: 'SQL', slug: 'sql', category: 'Dados' },
  { name: 'Figma', slug: 'figma', category: 'Design' },
  { name: 'Product Discovery', slug: 'product-discovery', category: 'Produto' },
  { name: 'Scrum', slug: 'scrum', category: 'Agilidade' },
  { name: 'GraphQL', slug: 'graphql', category: 'Backend' },
  { name: 'Jest', slug: 'jest', category: 'Qualidade' },
  { name: 'CI/CD', slug: 'ci-cd', category: 'DevOps' },
  { name: 'Power BI', slug: 'power-bi', category: 'Dados' },
] as const;

const COMPANIES_DATA = [
  {
    legalName: 'Nuvem Paulista Tecnologia Ltda',
    tradeName: 'NuvemPay',
    rootCnpj: '11222333',
    sector: 'Fintech',
    size: CompanySize.MEDIUM,
    city: 'Sao Paulo',
    state: 'SP',
    verified: true,
    accent: '#2563EB',
  },
  {
    legalName: 'Vortex Logistica Digital S.A.',
    tradeName: 'VortexLog',
    rootCnpj: '22333444',
    sector: 'Logistica',
    size: CompanySize.LARGE,
    city: 'Curitiba',
    state: 'PR',
    verified: true,
    accent: '#059669',
  },
  {
    legalName: 'Saude Conectada Servicos Medicos Ltda',
    tradeName: 'VidaMais Tech',
    rootCnpj: '33444555',
    sector: 'Healthtech',
    size: CompanySize.MEDIUM,
    city: 'Belo Horizonte',
    state: 'MG',
    verified: true,
    accent: '#0D9488',
  },
  {
    legalName: 'EducaBrasil Plataformas Educacionais S.A.',
    tradeName: 'EducaBrasil',
    rootCnpj: '44555666',
    sector: 'Edtech',
    size: CompanySize.LARGE,
    city: 'Florianopolis',
    state: 'SC',
    verified: true,
    accent: '#7C3AED',
  },
  {
    legalName: 'AgroDados Inteligencia Rural Ltda',
    tradeName: 'AgroDados',
    rootCnpj: '55666777',
    sector: 'Agrotech',
    size: CompanySize.SMALL,
    city: 'Campinas',
    state: 'SP',
    verified: true,
    accent: '#15803D',
  },
  {
    legalName: 'Pulso Varejo Omnichannel S.A.',
    tradeName: 'PulsoShop',
    rootCnpj: '66777888',
    sector: 'E-commerce',
    size: CompanySize.ENTERPRISE,
    city: 'Rio de Janeiro',
    state: 'RJ',
    verified: true,
    accent: '#DC2626',
  },
  {
    legalName: 'Estudio Atlantica Design e Produto Ltda',
    tradeName: 'Atlantica Studio',
    rootCnpj: '77888999',
    sector: 'Design e Produto',
    size: CompanySize.MICRO,
    city: 'Porto Alegre',
    state: 'RS',
    verified: false,
    accent: '#D97706',
  },
  {
    legalName: 'Cibersegura Defesa Digital Ltda',
    tradeName: 'CiberSegura',
    rootCnpj: '88999000',
    sector: 'Seguranca da Informacao',
    size: CompanySize.SMALL,
    city: 'Recife',
    state: 'PE',
    verified: true,
    accent: '#1D4ED8',
  },
] as const;

const AREAS = [
  'Desenvolvimento Backend',
  'Desenvolvimento Mobile',
  'Desenvolvimento Frontend',
  'Engenharia de Dados',
  'Produto e Design',
  'DevOps e Cloud',
] as const;

const CANDIDATE_NAMES = [
  'Ana Clara Oliveira',
  'Bruno Henrique Santos',
  'Camila Ferreira Costa',
  'Diego Almeida Souza',
  'Eduarda Lima Pereira',
  'Felipe Rodrigues Martins',
  'Gabriela Rocha Mendes',
  'Henrique Carvalho Dias',
  'Isabela Gomes Ribeiro',
  'Joao Pedro Barbosa',
  'Karina Teixeira Moura',
  'Lucas Gabriel Nunes',
  'Mariana Castro Freitas',
  'Nathaniel Araujo Pires',
  'Olivia Cardoso Monteiro',
  'Paulo Victor Cunha',
  'Rafaela Duarte Campos',
  'Samuel Moreira Teixeira',
  'Tatiane Azevedo Lopes',
  'Vinicius Machado Correia',
] as const;

const CITIES = [
  { city: 'Sao Paulo', state: 'SP' },
  { city: 'Rio de Janeiro', state: 'RJ' },
  { city: 'Belo Horizonte', state: 'MG' },
  { city: 'Curitiba', state: 'PR' },
  { city: 'Florianopolis', state: 'SC' },
  { city: 'Porto Alegre', state: 'RS' },
  { city: 'Campinas', state: 'SP' },
  { city: 'Recife', state: 'PE' },
] as const;

const JOB_TITLES = [
  'Pessoa Desenvolvedora Backend Node.js',
  'Engenheiro(a) Mobile Flutter',
  'Pessoa Desenvolvedora Full Stack TypeScript',
  'Arquiteto(a) de Dados PostgreSQL',
  'Especialista DevOps e Kubernetes',
  'Product Designer (UX/UI)',
  'Analista de Produto Digital',
  'Engenheiro(a) de Confiabilidade (SRE)',
] as const;

async function main(): Promise<void> {
  const defaultPasswordHash = await argon2.hash('JobKeep@2026!', {
    type: argon2.argon2id,
  });

  // 1. Catalogo de habilidades
  const skillMap = new Map<string, string>();
  for (const skill of SKILLS_CATALOG) {
    const upserted = await prisma.skill.upsert({
      where: { slug: skill.slug },
      update: { name: skill.name, category: skill.category, isApproved: true },
      create: {
        name: skill.name,
        slug: skill.slug,
        category: skill.category,
        isApproved: true,
      },
    });
    skillMap.set(skill.slug, upserted.id);
  }
  const skillIds = Array.from(skillMap.values());

  // 2. Administrador (1 admin)
  const adminEmail = 'admin@jobkeep.local';
  const existingAdmin = await prisma.user.findUnique({ where: { email: adminEmail } });
  const adminUser =
    existingAdmin ??
    (await prisma.user.create({
      data: {
        email: adminEmail,
        passwordHash: defaultPasswordHash,
        role: UserRole.ADMIN,
        status: UserStatus.ACTIVE,
        emailVerifiedAt: new Date(),
        consentRecords: {
          create: [
            {
              consentType: ConsentType.TERMS_OF_USE,
              documentVersion: '1.0.0',
              accepted: true,
            },
            {
              consentType: ConsentType.PRIVACY_POLICY,
              documentVersion: '1.0.0',
              accepted: true,
            },
          ],
        },
      },
    }));

  // 3. Empresas (8 empresas) e Vagas (40 vagas = 5 por empresa)
  const createdJobs: Array<{ id: string; companyId: string; ownerUserId: string }> = [];

  for (let i = 0; i < COMPANIES_DATA.length; i += 1) {
    const companyInput = COMPANIES_DATA[i];
    const cnpj = buildValidCnpj(companyInput.rootCnpj);
    const ownerEmail = `recrutamento+${i + 1}@${companyInput.tradeName.toLowerCase().replace(/\s+/g, '')}.com.br`;

    let company = await prisma.companyProfile.findUnique({ where: { cnpj } });
    let ownerUser = await prisma.user.findUnique({ where: { email: ownerEmail } });

    if (!ownerUser) {
      ownerUser = await prisma.user.create({
        data: {
          email: ownerEmail,
          passwordHash: defaultPasswordHash,
          role: UserRole.COMPANY,
          status: UserStatus.ACTIVE,
          emailVerifiedAt: new Date(),
          consentRecords: {
            create: [
              {
                consentType: ConsentType.TERMS_OF_USE,
                documentVersion: '1.0.0',
                accepted: true,
              },
              {
                consentType: ConsentType.PRIVACY_POLICY,
                documentVersion: '1.0.0',
                accepted: true,
              },
            ],
          },
          preferences: {
            create: {
              notificationSettings: { matchPush: true, messagePush: true, emailDigest: true },
              privacySettings: { showCompanyName: true },
              savedFilters: {},
            },
          },
        },
      });
    }

    if (!company) {
      const theme = await prisma.themeSettings.create({
        data: {
          backgroundType: ThemeBackgroundType.SOLID,
          backgroundColor: '#F8FAFC',
          accentColor: companyInput.accent,
          foregroundColor: '#0F172A',
          layoutPreset: ThemeLayoutPreset.SHOWCASE,
          fontFamily: ThemeFontFamily.INTER,
        },
      });

      company = await prisma.companyProfile.create({
        data: {
          legalName: companyInput.legalName,
          tradeName: companyInput.tradeName,
          cnpj,
          sector: companyInput.sector,
          size: companyInput.size,
          description: `Empresa de referencia no setor de ${companyInput.sector}, focada em tecnologia, transparencia salarial e cultura colaborativa.`,
          websiteUrl: `https://www.${companyInput.tradeName.toLowerCase().replace(/\s+/g, '')}.com.br`,
          city: companyInput.city,
          state: companyInput.state,
          verificationStatus: companyInput.verified
            ? CompanyVerificationStatus.VERIFIED
            : CompanyVerificationStatus.PENDING,
          verifiedAt: companyInput.verified ? new Date() : null,
          themeSettingsId: theme.id,
          members: {
            create: {
              userId: ownerUser.id,
              role: CompanyMemberRole.OWNER,
            },
          },
        },
      });
    }

    const existingCompanyJobs = await prisma.job.findMany({
      where: { companyId: company.id },
      orderBy: { createdAt: 'asc' },
    });

    if (existingCompanyJobs.length === 0) {
      const workModes = [WorkMode.REMOTO, WorkMode.HIBRIDO, WorkMode.PRESENCIAL];
      const seniorities = [
        JobSeniority.JUNIOR,
        JobSeniority.MID,
        JobSeniority.SENIOR,
        JobSeniority.LEAD,
        JobSeniority.MID,
      ];
      const contracts = [ContractType.CLT, ContractType.PJ, ContractType.CLT, ContractType.CLT, ContractType.PJ];

      for (let j = 0; j < 5; j += 1) {
        const titleBase = JOB_TITLES[(i + j) % JOB_TITLES.length];
        const area = AREAS[(i + j) % AREAS.length];
        const workMode = workModes[(i + j) % workModes.length];
        const seniority = seniorities[j];
        const salaryMin = (4500 + ((i + j) % 6) * 2000) * 100;
        const salaryMax = salaryMin + 3500 * 100;
        const status = i === 6 && j === 4 ? JobStatus.PAUSED : JobStatus.ACTIVE;

        const requiredSkillId = skillIds[(i * 3 + j) % skillIds.length];
        const requiredSkill2Id = skillIds[(i * 3 + j + 1) % skillIds.length];
        const desirableSkillId = skillIds[(i * 3 + j + 2) % skillIds.length];

        const job = await prisma.job.create({
          data: {
            companyId: company.id,
            createdByUserId: ownerUser.id,
            title: `${titleBase} (${seniority})`,
            description: `Atuacao em ${area} na ${companyInput.tradeName} com times multidisciplinares, metas claras e feedback estruturado em ate 10 dias.`,
            requirements:
              'Experiencia pratica com desenvolvimento de software moderno, testes automatizados e comunicacao clara.',
            area,
            city: companyInput.city,
            state: companyInput.state,
            workMode,
            salaryMin,
            salaryMax,
            benefits: [
              'Vale-refeicao / alimentacao R$ 1.100',
              'Plano de saude e odontologico sem coparticipacao',
              'Auxilio home office e educacao continuada',
            ],
            seniority,
            contractType: contracts[j],
            status,
            responseDeadlineDays: 10,
            publishedAt: status === JobStatus.ACTIVE ? new Date() : null,
            jobSkills: {
              create: [
                {
                  skillId: requiredSkillId,
                  requirementType: SkillRequirementType.REQUIRED,
                  weight: 9,
                  minimumLevel: SkillLevel.INTERMEDIATE,
                },
                {
                  skillId: requiredSkill2Id,
                  requirementType: SkillRequirementType.REQUIRED,
                  weight: 7,
                  minimumLevel: SkillLevel.INTERMEDIATE,
                },
                {
                  skillId: desirableSkillId,
                  requirementType: SkillRequirementType.DESIRABLE,
                  weight: 4,
                  minimumLevel: SkillLevel.BEGINNER,
                },
              ],
            },
          },
        });

        createdJobs.push({ id: job.id, companyId: company.id, ownerUserId: ownerUser.id });
      }
    } else {
      for (const job of existingCompanyJobs) {
        createdJobs.push({ id: job.id, companyId: company.id, ownerUserId: ownerUser.id });
      }
    }
  }

  // 4. Candidatos (20 candidatos)
  const createdCandidates: Array<{ id: string; userId: string }> = [];

  for (let i = 0; i < CANDIDATE_NAMES.length; i += 1) {
    const email = `candidato${i + 1}@jobkeep.local`;
    const location = CITIES[i % CITIES.length];
    const area = AREAS[i % AREAS.length];
    const salaryMin = (4000 + (i % 6) * 1800) * 100;
    const salaryMax = salaryMin + 4000 * 100;

    let user = await prisma.user.findUnique({
      where: { email },
      include: { candidateProfile: true },
    });

    if (!user) {
      const theme = await prisma.themeSettings.create({
        data: {
          backgroundType: ThemeBackgroundType.SOLID,
          backgroundColor: '#FFFFFF',
          accentColor: '#4F46E5',
          foregroundColor: '#111827',
          layoutPreset: ThemeLayoutPreset.MODERN,
          fontFamily: ThemeFontFamily.INTER,
        },
      });

      user = await prisma.user.create({
        data: {
          email,
          passwordHash: defaultPasswordHash,
          role: UserRole.CANDIDATE,
          status: UserStatus.ACTIVE,
          emailVerifiedAt: new Date(),
          consentRecords: {
            create: [
              {
                consentType: ConsentType.TERMS_OF_USE,
                documentVersion: '1.0.0',
                accepted: true,
              },
              {
                consentType: ConsentType.PRIVACY_POLICY,
                documentVersion: '1.0.0',
                accepted: true,
              },
            ],
          },
          preferences: {
            create: {
              notificationSettings: {
                newMatch: true,
                newMessage: true,
                applicationUpdates: true,
                channels: ['IN_APP', 'PUSH'],
              },
              privacySettings: {
                hideFullNameBeforeMatch: i % 3 === 0,
                hidePhotoBeforeMatch: i % 4 === 0,
              },
              savedFilters: {
                area,
                state: location.state,
                workModes: [WorkMode.REMOTO, WorkMode.HIBRIDO],
              },
            },
          },
          candidateProfile: {
            create: {
              fullName: CANDIDATE_NAMES[i],
              headline: `Profissional de ${area} | Foco em qualidade e produto`,
              bio: `Atuacao em ${area} com experiencia em projetos ageis, entregas continuas e colaboracao entre produto e engenharia.`,
              city: location.city,
              state: location.state,
              professionalArea: area,
              salaryExpectationMin: salaryMin,
              salaryExpectationMax: salaryMax,
              acceptedWorkModes: [WorkMode.REMOTO, WorkMode.HIBRIDO],
              acceptedContractTypes: [ContractType.CLT, ContractType.PJ],
              acceptedCities: [location.city, 'Sao Paulo'],
              acceptedStates: [location.state, 'SP'],
              areasOfInterest: [area],
              availability:
                i % 2 === 0 ? AvailabilityStatus.IMMEDIATE : AvailabilityStatus.WITHIN_15_DAYS,
              links: {
                linkedin: `https://linkedin.com/in/candidato-${i + 1}`,
                github: `https://github.com/candidato-${i + 1}`,
              },
              visibilitySettings: {
                hideFullNameBeforeMatch: i % 3 === 0,
                hidePhotoBeforeMatch: i % 4 === 0,
                hideResumeBeforeMatch: true,
                hideLinksBeforeMatch: false,
              },
              themeSettingsId: theme.id,
              experiences: {
                create: [
                  {
                    companyName: `Empresa Anterior ${i + 1} Tech`,
                    title: `Especialista em ${area}`,
                    description: 'Desenvolvimento e evolucao de sistemas de alta disponibilidade.',
                    workMode: WorkMode.HIBRIDO,
                    location: `${location.city}, ${location.state}`,
                    startDate: new Date('2022-03-01'),
                    isCurrent: true,
                  },
                ],
              },
              educations: {
                create: [
                  {
                    institution: 'Universidade Federal Tecnologica',
                    degree: 'Bacharelado',
                    fieldOfStudy: 'Ciencia da Computacao',
                    status: EducationStatus.COMPLETED,
                    startDate: new Date('2017-02-01'),
                    endDate: new Date('2021-12-15'),
                    isCurrent: false,
                  },
                ],
              },
              skills: {
                create: [
                  {
                    skillId: skillIds[i % skillIds.length],
                    level: SkillLevel.ADVANCED,
                    yearsOfExperience: 4,
                  },
                  {
                    skillId: skillIds[(i + 1) % skillIds.length],
                    level: SkillLevel.INTERMEDIATE,
                    yearsOfExperience: 2,
                  },
                  {
                    skillId: skillIds[(i + 3) % skillIds.length],
                    level: SkillLevel.INTERMEDIATE,
                    yearsOfExperience: 2,
                  },
                ],
              },
            },
          },
        },
        include: { candidateProfile: true },
      });
    }

    if (user.candidateProfile) {
      createdCandidates.push({ id: user.candidateProfile.id, userId: user.id });
    }
  }

  // 5. Exemplo de Match + Candidatura + Chat + Notificacao inicial (apenas se ainda nao houver matches)
  const existingMatchCount = await prisma.match.count();
  if (existingMatchCount === 0 && createdCandidates.length > 0 && createdJobs.length > 0) {
    const candidate = createdCandidates[0];
    const job = createdJobs[0];

    await prisma.swipe.createMany({
      data: [
        {
          authorUserId: candidate.userId,
          authorRole: UserRole.CANDIDATE,
          targetType: SwipeTargetType.JOB,
          targetId: job.id,
          decision: SwipeDecision.LIKE,
          jobId: job.id,
          candidateId: candidate.id,
        },
        {
          authorUserId: job.ownerUserId,
          authorRole: UserRole.COMPANY,
          targetType: SwipeTargetType.CANDIDATE,
          targetId: candidate.id,
          decision: SwipeDecision.LIKE,
          jobId: job.id,
          candidateId: candidate.id,
        },
      ],
      skipDuplicates: true,
    });

    const match = await prisma.match.create({
      data: {
        candidateId: candidate.id,
        jobId: job.id,
        companyId: job.companyId,
        status: MatchStatus.ACTIVE,
        compatibilityScore: 92,
        compatibilityBreakdown: {
          skillsScore: 95,
          salaryScore: 100,
          workModeScore: 100,
          highlights: ['Compatibilidade alta em TypeScript e Node.js', 'Faixa salarial alinhada'],
        },
      },
    });

    const deadline = new Date(Date.now() + 10 * 24 * 60 * 60 * 1000);
    await prisma.application.create({
      data: {
        candidateId: candidate.id,
        jobId: job.id,
        matchId: match.id,
        status: ApplicationStatus.MATCHED,
        responseDeadlineAt: deadline,
        history: {
          create: [
            {
              toStatus: ApplicationStatus.INTERESTED,
              reason: 'Candidato demonstrou interesse via swipe.',
              changedByUserId: candidate.userId,
            },
            {
              fromStatus: ApplicationStatus.INTERESTED,
              toStatus: ApplicationStatus.MATCHED,
              reason: 'Match mutuo confirmado pela empresa.',
              changedByUserId: job.ownerUserId,
            },
          ],
        },
      },
    });

    const conversation = await prisma.conversation.create({
      data: {
        matchId: match.id,
        candidateUserId: candidate.userId,
        companyContactUserId: job.ownerUserId,
        lastMessageAt: new Date(),
      },
    });

    await prisma.message.create({
      data: {
        conversationId: conversation.id,
        senderUserId: job.ownerUserId,
        content: 'Ola! Curtimos muito seu perfil. Podemos agendar uma conversa inicial nesta semana?',
        isRead: false,
      },
    });

    await prisma.notification.create({
      data: {
        userId: candidate.userId,
        type: NotificationType.NEW_MATCH,
        title: 'Novo Match confirmado!',
        body: 'Voce deu match com uma vaga compativel. Inicie a conversa agora.',
        payload: { matchId: match.id, jobId: job.id },
        channel: NotificationChannel.IN_APP,
        isRead: false,
      },
    });
  }

  console.info(
    `Seed concluido: 1 admin (${adminUser.email}), ${COMPANIES_DATA.length} empresas, ${createdJobs.length} vagas, ${createdCandidates.length} candidatos.`,
  );
}

main()
  .catch((error) => {
    console.error('Erro ao executar seed:', error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
