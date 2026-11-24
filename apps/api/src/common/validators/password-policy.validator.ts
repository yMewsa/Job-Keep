import {
  registerDecorator,
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
} from 'class-validator';

export const PASSWORD_POLICY_MESSAGE =
  'A senha deve ter no minimo 8 caracteres, incluindo letra maiuscula, minuscula, numero e caractere especial.';

/**
 * Verifica a politica minima de senha forte da plataforma.
 */
export function isStrongPassword(password: string): boolean {
  if (password.length < 8 || password.length > 128) {
    return false;
  }
  const hasUpper = /[A-Z]/.test(password);
  const hasLower = /[a-z]/.test(password);
  const hasDigit = /\d/.test(password);
  const hasSpecial = /[^A-Za-z0-9]/.test(password);
  return hasUpper && hasLower && hasDigit && hasSpecial;
}

@ValidatorConstraint({ name: 'isStrongPassword', async: false })
export class StrongPasswordConstraint implements ValidatorConstraintInterface {
  validate(value: unknown): boolean {
    return typeof value === 'string' && isStrongPassword(value);
  }

  defaultMessage(): string {
    return PASSWORD_POLICY_MESSAGE;
  }
}

/**
 * Decorator de validacao de senha forte para DTOs.
 */
export function IsStrongPassword(validationOptions?: ValidationOptions): PropertyDecorator {
  return (object: object, propertyName: string | symbol) => {
    registerDecorator({
      target: object.constructor,
      propertyName: String(propertyName),
      options: validationOptions,
      constraints: [],
      validator: StrongPasswordConstraint,
    });
  };
}
