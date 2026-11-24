// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_invitation_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyInvitationResponseDtoCWProxy {
  CompanyInvitationResponseDto id(String id);

  CompanyInvitationResponseDto email(String email);

  CompanyInvitationResponseDto role(CompanyInvitationResponseDtoRoleEnum role);

  CompanyInvitationResponseDto expiresAt(DateTime expiresAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyInvitationResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyInvitationResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyInvitationResponseDto call({
    String id,
    String email,
    CompanyInvitationResponseDtoRoleEnum role,
    DateTime expiresAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyInvitationResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyInvitationResponseDto.copyWith.fieldName(...)`
class _$CompanyInvitationResponseDtoCWProxyImpl
    implements _$CompanyInvitationResponseDtoCWProxy {
  const _$CompanyInvitationResponseDtoCWProxyImpl(this._value);

  final CompanyInvitationResponseDto _value;

  @override
  CompanyInvitationResponseDto id(String id) => this(id: id);

  @override
  CompanyInvitationResponseDto email(String email) => this(email: email);

  @override
  CompanyInvitationResponseDto role(
    CompanyInvitationResponseDtoRoleEnum role,
  ) => this(role: role);

  @override
  CompanyInvitationResponseDto expiresAt(DateTime expiresAt) =>
      this(expiresAt: expiresAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyInvitationResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyInvitationResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyInvitationResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return CompanyInvitationResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as CompanyInvitationResponseDtoRoleEnum,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $CompanyInvitationResponseDtoCopyWith
    on CompanyInvitationResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyInvitationResponseDto.copyWith(...)` or like so:`instanceOfCompanyInvitationResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyInvitationResponseDtoCWProxy get copyWith =>
      _$CompanyInvitationResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInvitationResponseDto _$CompanyInvitationResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyInvitationResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'email', 'role', 'expiresAt']);
  final val = CompanyInvitationResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    role: $checkedConvert(
      'role',
      (v) => $enumDecode(_$CompanyInvitationResponseDtoRoleEnumEnumMap, v),
    ),
    expiresAt: $checkedConvert('expiresAt', (v) => DateTime.parse(v as String)),
  );
  return val;
});

Map<String, dynamic> _$CompanyInvitationResponseDtoToJson(
  CompanyInvitationResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'role': _$CompanyInvitationResponseDtoRoleEnumEnumMap[instance.role]!,
  'expiresAt': instance.expiresAt.toIso8601String(),
};

const _$CompanyInvitationResponseDtoRoleEnumEnumMap = {
  CompanyInvitationResponseDtoRoleEnum.OWNER: 'OWNER',
  CompanyInvitationResponseDtoRoleEnum.RECRUITER: 'RECRUITER',
};
