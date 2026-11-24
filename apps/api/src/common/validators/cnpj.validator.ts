import {
  registerDecorator,
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
} from 'class-validator';

/**
 * Remove caracteres nao numericos de um CNPJ.
 */
export function normalizeCnpj(value: string): string {
  return value.replace(/\D/g, '');
}

/**
 * Valida CNPJ brasileiro pelos 14 digitos e pelos dois digitos verificadores.
 */
export function isValidCnpj(rawValue: string): boolean {
  const cnpj = normalizeCnpj(rawValue);

  if (cnpj.length !== 14) {
    return false;
  }

  // Rejeita sequencias com todos os digitos iguais (ex.: 00000000000000)
  if (/^(\d)\1{13}$/.test(cnpj)) {
    return false;
  }

  const calcDigit = (base: string, weights: number[]): number => {
    let sum = 0;
    for (let i = 0; i < weights.length; i += 1) {
      sum += Number(base[i]) * weights[i];
    }
    const remainder = sum % 11;
    return remainder < 2 ? 0 : 11 - remainder;
  };

  const firstWeights = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  const secondWeights = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

  const firstDigit = calcDigit(cnpj.slice(0, 12), firstWeights);
  if (firstDigit !== Number(cnpj[12])) {
    return false;
  }

  const secondDigit = calcDigit(cnpj.slice(0, 13), secondWeights);
  return secondDigit === Number(cnpj[13]);
}

@ValidatorConstraint({ name: 'isCnpj', async: false })
export class CnpjConstraint implements ValidatorConstraintInterface {
  validate(value: unknown): boolean {
    return typeof value === 'string' && isValidCnpj(value);
  }

  defaultMessage(): string {
    return 'Informe um CNPJ valido.';
  }
}

/**
 * Decorator de validacao de CNPJ para DTOs com class-validator.
 */
export function IsCnpj(validationOptions?: ValidationOptions): PropertyDecorator {
  return (object: object, propertyName: string | symbol) => {
    registerDecorator({
      target: object.constructor,
      propertyName: String(propertyName),
      options: validationOptions,
      constraints: [],
      validator: CnpjConstraint,
    });
  };
}
