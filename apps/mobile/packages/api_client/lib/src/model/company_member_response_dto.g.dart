// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_member_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyMemberResponseDtoCWProxy {
  CompanyMemberResponseDto id(String id);

  CompanyMemberResponseDto userId(String userId);

  CompanyMemberResponseDto companyId(String companyId);

  CompanyMemberResponseDto role(CompanyMemberResponseDtoRoleEnum role);

  CompanyMemberResponseDto createdAt(DateTime createdAt);

  CompanyMemberResponseDto user(CompanyMemberUserResponseDto? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyMemberResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyMemberResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyMemberResponseDto call({
    String id,
    String userId,
    String companyId,
    CompanyMemberResponseDtoRoleEnum role,
    DateTime createdAt,
    CompanyMemberUserResponseDto? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyMemberResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyMemberResponseDto.copyWith.fieldName(...)`
class _$CompanyMemberResponseDtoCWProxyImpl
    implements _$CompanyMemberResponseDtoCWProxy {
  const _$CompanyMemberResponseDtoCWProxyImpl(this._value);

  final CompanyMemberResponseDto _value;

  @override
  CompanyMemberResponseDto id(String id) => this(id: id);

  @override
  CompanyMemberResponseDto userId(String userId) => this(userId: userId);

  @override
  CompanyMemberResponseDto companyId(String companyId) =>
      this(companyId: companyId);

  @override
  CompanyMemberResponseDto role(CompanyMemberResponseDtoRoleEnum role) =>
      this(role: role);

  @override
  CompanyMemberResponseDto createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  CompanyMemberResponseDto user(CompanyMemberUserResponseDto? user) =>
      this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyMemberResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyMemberResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyMemberResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? companyId = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return CompanyMemberResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      companyId: companyId == const $CopyWithPlaceholder()
          ? _value.companyId
          // ignore: cast_nullable_to_non_nullable
          : companyId as String,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as CompanyMemberResponseDtoRoleEnum,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as CompanyMemberUserResponseDto?,
    );
  }
}

extension $CompanyMemberResponseDtoCopyWith on CompanyMemberResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyMemberResponseDto.copyWith(...)` or like so:`instanceOfCompanyMemberResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyMemberResponseDtoCWProxy get copyWith =>
      _$CompanyMemberResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyMemberResponseDto _$CompanyMemberResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyMemberResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'userId', 'companyId', 'role', 'createdAt'],
  );
  final val = CompanyMemberResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    userId: $checkedConvert('userId', (v) => v as String),
    companyId: $checkedConvert('companyId', (v) => v as String),
    role: $checkedConvert(
      'role',
      (v) => $enumDecode(_$CompanyMemberResponseDtoRoleEnumEnumMap, v),
    ),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    user: $checkedConvert(
      'user',
      (v) => v == null
          ? null
          : CompanyMemberUserResponseDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyMemberResponseDtoToJson(
  CompanyMemberResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'companyId': instance.companyId,
  'role': _$CompanyMemberResponseDtoRoleEnumEnumMap[instance.role]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'user': ?instance.user?.toJson(),
};

const _$CompanyMemberResponseDtoRoleEnumEnumMap = {
  CompanyMemberResponseDtoRoleEnum.OWNER: 'OWNER',
  CompanyMemberResponseDtoRoleEnum.RECRUITER: 'RECRUITER',
};
