import 'package:job_keep_api_client/src/model/accept_company_invitation_dto.dart';
import 'package:job_keep_api_client/src/model/add_candidate_skill_dto.dart';
import 'package:job_keep_api_client/src/model/auth_tokens_response_dto.dart';
import 'package:job_keep_api_client/src/model/auth_user_dto.dart';
import 'package:job_keep_api_client/src/model/candidate_links_dto.dart';
import 'package:job_keep_api_client/src/model/change_job_status_dto.dart';
import 'package:job_keep_api_client/src/model/company_action_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_invitation_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_job_summary_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_logo_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_logo_upload_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_member_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_member_user_response_dto.dart';
import 'package:job_keep_api_client/src/model/company_profile_response_dto.dart';
import 'package:job_keep_api_client/src/model/confirm_company_logo_dto.dart';
import 'package:job_keep_api_client/src/model/confirm_upload_dto.dart';
import 'package:job_keep_api_client/src/model/create_education_dto.dart';
import 'package:job_keep_api_client/src/model/create_experience_dto.dart';
import 'package:job_keep_api_client/src/model/create_job_dto.dart';
import 'package:job_keep_api_client/src/model/create_job_report_dto.dart';
import 'package:job_keep_api_client/src/model/deactivate_account_dto.dart';
import 'package:job_keep_api_client/src/model/delete_account_dto.dart';
import 'package:job_keep_api_client/src/model/email_only_dto.dart';
import 'package:job_keep_api_client/src/model/error_detail_dto.dart';
import 'package:job_keep_api_client/src/model/error_response_dto.dart';
import 'package:job_keep_api_client/src/model/health_check_response_dto.dart';
import 'package:job_keep_api_client/src/model/invite_company_member_dto.dart';
import 'package:job_keep_api_client/src/model/job_deletion_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_moderation_queue_item_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_page_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_report_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_skill_catalog_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_skill_input_dto.dart';
import 'package:job_keep_api_client/src/model/job_skill_response_dto.dart';
import 'package:job_keep_api_client/src/model/login_dto.dart';
import 'package:job_keep_api_client/src/model/logout_dto.dart';
import 'package:job_keep_api_client/src/model/message_response_dto.dart';
import 'package:job_keep_api_client/src/model/presign_company_logo_dto.dart';
import 'package:job_keep_api_client/src/model/presign_upload_dto.dart';
import 'package:job_keep_api_client/src/model/public_company_profile_response_dto.dart';
import 'package:job_keep_api_client/src/model/reactivate_account_dto.dart';
import 'package:job_keep_api_client/src/model/refresh_token_dto.dart';
import 'package:job_keep_api_client/src/model/register_candidate_dto.dart';
import 'package:job_keep_api_client/src/model/register_company_dto.dart';
import 'package:job_keep_api_client/src/model/register_response_dto.dart';
import 'package:job_keep_api_client/src/model/reset_password_dto.dart';
import 'package:job_keep_api_client/src/model/session_dto.dart';
import 'package:job_keep_api_client/src/model/suggest_skill_dto.dart';
import 'package:job_keep_api_client/src/model/update_candidate_profile_dto.dart';
import 'package:job_keep_api_client/src/model/update_candidate_visibility_dto.dart';
import 'package:job_keep_api_client/src/model/update_candidate_work_preferences_dto.dart';
import 'package:job_keep_api_client/src/model/update_company_profile_dto.dart';
import 'package:job_keep_api_client/src/model/update_education_dto.dart';
import 'package:job_keep_api_client/src/model/update_experience_dto.dart';
import 'package:job_keep_api_client/src/model/update_job_dto.dart';
import 'package:job_keep_api_client/src/model/verify_company_dto.dart';
import 'package:job_keep_api_client/src/model/verify_email_dto.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'AcceptCompanyInvitationDto':
          return AcceptCompanyInvitationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddCandidateSkillDto':
          return AddCandidateSkillDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthTokensResponseDto':
          return AuthTokensResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthUserDto':
          return AuthUserDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CandidateLinksDto':
          return CandidateLinksDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChangeJobStatusDto':
          return ChangeJobStatusDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyActionResponseDto':
          return CompanyActionResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyInvitationResponseDto':
          return CompanyInvitationResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyJobSummaryResponseDto':
          return CompanyJobSummaryResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyLogoResponseDto':
          return CompanyLogoResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyLogoUploadResponseDto':
          return CompanyLogoUploadResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyMemberResponseDto':
          return CompanyMemberResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyMemberUserResponseDto':
          return CompanyMemberUserResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CompanyProfileResponseDto':
          return CompanyProfileResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfirmCompanyLogoDto':
          return ConfirmCompanyLogoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfirmUploadDto':
          return ConfirmUploadDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateEducationDto':
          return CreateEducationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateExperienceDto':
          return CreateExperienceDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateJobDto':
          return CreateJobDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateJobReportDto':
          return CreateJobReportDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeactivateAccountDto':
          return DeactivateAccountDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeleteAccountDto':
          return DeleteAccountDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EmailOnlyDto':
          return EmailOnlyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorDetailDto':
          return ErrorDetailDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorResponseDto':
          return ErrorResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HealthCheckResponseDto':
          return HealthCheckResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InviteCompanyMemberDto':
          return InviteCompanyMemberDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobDeletionResponseDto':
          return JobDeletionResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobModerationQueueItemResponseDto':
          return JobModerationQueueItemResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobPageResponseDto':
          return JobPageResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobReportResponseDto':
          return JobReportResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobResponseDto':
          return JobResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobSkillCatalogResponseDto':
          return JobSkillCatalogResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobSkillInputDto':
          return JobSkillInputDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JobSkillResponseDto':
          return JobSkillResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LoginDto':
          return LoginDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LogoutDto':
          return LogoutDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MessageResponseDto':
          return MessageResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PresignCompanyLogoDto':
          return PresignCompanyLogoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PresignUploadDto':
          return PresignUploadDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PublicCompanyProfileResponseDto':
          return PublicCompanyProfileResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReactivateAccountDto':
          return ReactivateAccountDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RefreshTokenDto':
          return RefreshTokenDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RegisterCandidateDto':
          return RegisterCandidateDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RegisterCompanyDto':
          return RegisterCompanyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RegisterResponseDto':
          return RegisterResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResetPasswordDto':
          return ResetPasswordDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionDto':
          return SessionDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuggestSkillDto':
          return SuggestSkillDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateCandidateProfileDto':
          return UpdateCandidateProfileDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateCandidateVisibilityDto':
          return UpdateCandidateVisibilityDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateCandidateWorkPreferencesDto':
          return UpdateCandidateWorkPreferencesDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateCompanyProfileDto':
          return UpdateCompanyProfileDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateEducationDto':
          return UpdateEducationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateExperienceDto':
          return UpdateExperienceDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateJobDto':
          return UpdateJobDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VerifyCompanyDto':
          return VerifyCompanyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VerifyEmailDto':
          return VerifyEmailDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }