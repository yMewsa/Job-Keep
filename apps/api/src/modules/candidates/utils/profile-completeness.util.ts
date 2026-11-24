export interface CandidateCompletenessInput {
  fullName: string;
  headline: string | null;
  bio: string | null;
  city: string | null;
  state: string | null;
  professionalArea: string | null;
  salaryExpectationMin: number | null;
  acceptedWorkModes: unknown[];
  acceptedContractTypes: unknown[];
  experiencesCount: number;
  educationsCount: number;
  skillsCount: number;
  hasResume: boolean;
  hasPhoto: boolean;
}

export interface ProfileCompletenessResult {
  completionPercentage: number;
  missingFields: string[];
}

/**
 * Calcula o percentual de completude do perfil profissional do candidato (0 a 100).
 */
export function calculateCandidateCompleteness(
  input: CandidateCompletenessInput,
): ProfileCompletenessResult {
  const checks: Array<{ key: string; weight: number; done: boolean }> = [
    { key: 'fullName', weight: 10, done: input.fullName.trim().length >= 3 },
    { key: 'headline', weight: 10, done: Boolean(input.headline && input.headline.trim().length > 0) },
    { key: 'bio', weight: 10, done: Boolean(input.bio && input.bio.trim().length >= 20) },
    {
      key: 'location',
      weight: 5,
      done: Boolean(input.city && input.state),
    },
    {
      key: 'professionalArea',
      weight: 5,
      done: Boolean(input.professionalArea && input.professionalArea.trim().length > 0),
    },
    {
      key: 'workPreferences',
      weight: 10,
      done:
        input.salaryExpectationMin !== null &&
        input.acceptedWorkModes.length > 0 &&
        input.acceptedContractTypes.length > 0,
    },
    { key: 'experiences', weight: 15, done: input.experiencesCount > 0 },
    { key: 'educations', weight: 10, done: input.educationsCount > 0 },
    { key: 'skills', weight: 15, done: input.skillsCount >= 3 },
    { key: 'resume', weight: 5, done: input.hasResume },
    { key: 'photo', weight: 5, done: input.hasPhoto },
  ];

  let score = 0;
  const missingFields: string[] = [];

  for (const item of checks) {
    if (item.done) {
      score += item.weight;
    } else {
      missingFields.push(item.key);
    }
  }

  return {
    completionPercentage: Math.min(100, score),
    missingFields,
  };
}
