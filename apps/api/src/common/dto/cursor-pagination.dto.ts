import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt, IsOptional, IsString, Max, Min } from 'class-validator';

/**
 * Parametros padrao de paginacao por cursor.
 */
export class CursorPaginationQueryDto {
  @ApiPropertyOptional({
    description: 'Cursor opaco retornado na pagina anterior.',
    example: 'eyJpZCI6IjAxOTBhIn0=',
  })
  @IsOptional()
  @IsString({ message: 'O cursor deve ser uma string valida.' })
  cursor?: string;

  @ApiPropertyOptional({
    description: 'Quantidade maxima de itens por pagina.',
    minimum: 1,
    maximum: 50,
    default: 20,
  })
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'O limite deve ser um numero inteiro.' })
  @Min(1, { message: 'O limite minimo e 1.' })
  @Max(50, { message: 'O limite maximo e 50.' })
  limit: number = 20;
}

/**
 * Metadados de paginacao por cursor.
 */
export class PageInfoDto {
  @ApiPropertyOptional({ nullable: true, example: 'eyJpZCI6IjAxOTBhIn0=' })
  nextCursor!: string | null;

  @ApiProperty({ example: true })
  hasNextPage!: boolean;
}
