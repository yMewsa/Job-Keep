import { Body, Controller, Delete, Get, HttpCode, HttpStatus, Post } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiOkResponse,
  ApiOperation,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { AuthenticatedUser, CurrentUser } from '../../common/decorators/current-user.decorator';
import { Public } from '../../common/decorators/public.decorator';
import { ErrorResponseDto } from '../../common/dto/error-response.dto';
import {
  DeactivateAccountDto,
  DeleteAccountDto,
  ReactivateAccountDto,
} from './dto/account.dto';
import { UsersService } from './users.service';

@ApiTags('Account')
@Controller('account')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('me')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Retorna os dados da conta autenticada e consentimentos LGPD' })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  getMyAccount(@CurrentUser() user: AuthenticatedUser) {
    return this.usersService.getMyAccount(user.userId);
  }

  @Post('deactivate')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Desativa a conta de forma reversivel por 30 dias (RF18)' })
  @ApiOkResponse({ description: 'Conta desativada com prazo de 30 dias para reativacao.' })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  deactivate(@CurrentUser() user: AuthenticatedUser, @Body() dto: DeactivateAccountDto) {
    return this.usersService.deactivateMyAccount(user.userId, dto);
  }

  @Public()
  @Post('reactivate')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Reativa uma conta desativada dentro da janela de 30 dias' })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  reactivate(@Body() dto: ReactivateAccountDto) {
    return this.usersService.reactivateAccount(dto);
  }

  @Delete()
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiOperation({
    summary: 'Exclui definitivamente a conta com anonimizacao LGPD (RF18 / RNF07)',
  })
  @ApiResponse({ status: 401, type: ErrorResponseDto })
  deletePermanently(@CurrentUser() user: AuthenticatedUser, @Body() dto: DeleteAccountDto) {
    return this.usersService.deleteMyAccountPermanently(user.userId, dto);
  }
}
