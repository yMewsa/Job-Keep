// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_member_user_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyMemberUserResponseDtoCWProxy {
  CompanyMemberUserResponseDto id(String id);

  CompanyMemberUserResponseDto email(String email);

  CompanyMemberUserResponseDto role(CompanyMemberUserResponseDtoRoleEnum role);

  CompanyMemberUserResponseDto status(
    CompanyMemberUserResponseDtoStatusEnum status,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyMemberUserResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyMemberUserResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyMemberUserResponseDto call({
    String id,
    String email,
    CompanyMemberUserResponseDtoRoleEnum role,
    CompanyMemberUserResponseDtoStatusEnum status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyMemberUserResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyMemberUserResponseDto.copyWith.fieldName(...)`
class _$CompanyMemberUserResponseDtoCWProxyImpl
    implements _$CompanyMemberUserResponseDtoCWProxy {
  const _$CompanyMemberUserResponseDtoCWProxyImpl(this._value);

  final CompanyMemberUserResponseDto _value;

  @override
  CompanyMemberUserResponseDto id(String id) => this(id: id);

  @override
  CompanyMemberUserResponseDto email(String email) => this(email: email);

  @override
  CompanyMemberUserResponseDto role(
    CompanyMemberUserResponseDtoRoleEnum role,
  ) => this(role: role);

  @override
  CompanyMemberUserResponseDto status(
    CompanyMemberUserResponseDtoStatusEnum status,
  ) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyMemberUserResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyMemberUserResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyMemberUserResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return CompanyMemberUserResponseDto(
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
          : role as CompanyMemberUserResponseDtoRoleEnum,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CompanyMemberUserResponseDtoStatusEnum,
    );
  }
}

extension $CompanyMemberUserResponseDtoCopyWith
    on CompanyMemberUserResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyMemberUserResponseDto.copyWith(...)` or like so:`instanceOfCompanyMemberUserResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyMemberUserResponseDtoCWProxy get copyWith =>
      _$CompanyMemberUserResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyMemberUserResponseDto _$CompanyMemberUserResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyMemberUserResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'email', 'role', 'status']);
  final val = CompanyMemberUserResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    role: $checkedConvert(
      'role',
      (v) => $enumDecode(_$CompanyMemberUserResponseDtoRoleEnumEnumMap, v),
    ),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$CompanyMemberUserResponseDtoStatusEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyMemberUserResponseDtoToJson(
  CompanyMemberUserResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'role': _$CompanyMemberUserResponseDtoRoleEnumEnumMap[instance.role]!,
  'status': _$CompanyMemberUserResponseDtoStatusEnumEnumMap[instance.status]!,
};

const _$CompanyMemberUserResponseDtoRoleEnumEnumMap = {
  CompanyMemberUserResponseDtoRoleEnum.CANDIDATE: 'CANDIDATE',
  CompanyMemberUserResponseDtoRoleEnum.COMPANY: 'COMPANY',
  CompanyMemberUserResponseDtoRoleEnum.ADMIN: 'ADMIN',
};

const _$CompanyMemberUserResponseDtoStatusEnumEnumMap = {
  CompanyMemberUserResponseDtoStatusEnum.ACTIVE: 'ACTIVE',
  CompanyMemberUserResponseDtoStatusEnum.DEACTIVATED: 'DEACTIVATED',
  CompanyMemberUserResponseDtoStatusEnum.SUSPENDED: 'SUSPENDED',
  CompanyMemberUserResponseDtoStatusEnum.DELETED: 'DELETED',
};
