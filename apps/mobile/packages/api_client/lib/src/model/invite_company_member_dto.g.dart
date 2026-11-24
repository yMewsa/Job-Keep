// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_company_member_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteCompanyMemberDtoCWProxy {
  InviteCompanyMemberDto email(String email);

  InviteCompanyMemberDto role(InviteCompanyMemberDtoRoleEnum? role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InviteCompanyMemberDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InviteCompanyMemberDto(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteCompanyMemberDto call({
    String email,
    InviteCompanyMemberDtoRoleEnum? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteCompanyMemberDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInviteCompanyMemberDto.copyWith.fieldName(...)`
class _$InviteCompanyMemberDtoCWProxyImpl
    implements _$InviteCompanyMemberDtoCWProxy {
  const _$InviteCompanyMemberDtoCWProxyImpl(this._value);

  final InviteCompanyMemberDto _value;

  @override
  InviteCompanyMemberDto email(String email) => this(email: email);

  @override
  InviteCompanyMemberDto role(InviteCompanyMemberDtoRoleEnum? role) =>
      this(role: role);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InviteCompanyMemberDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InviteCompanyMemberDto(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteCompanyMemberDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return InviteCompanyMemberDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as InviteCompanyMemberDtoRoleEnum?,
    );
  }
}

extension $InviteCompanyMemberDtoCopyWith on InviteCompanyMemberDto {
  /// Returns a callable class that can be used as follows: `instanceOfInviteCompanyMemberDto.copyWith(...)` or like so:`instanceOfInviteCompanyMemberDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteCompanyMemberDtoCWProxy get copyWith =>
      _$InviteCompanyMemberDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteCompanyMemberDto _$InviteCompanyMemberDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('InviteCompanyMemberDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email']);
  final val = InviteCompanyMemberDto(
    email: $checkedConvert('email', (v) => v as String),
    role: $checkedConvert(
      'role',
      (v) => $enumDecodeNullable(_$InviteCompanyMemberDtoRoleEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$InviteCompanyMemberDtoToJson(
  InviteCompanyMemberDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'role': ?_$InviteCompanyMemberDtoRoleEnumEnumMap[instance.role],
};

const _$InviteCompanyMemberDtoRoleEnumEnumMap = {
  InviteCompanyMemberDtoRoleEnum.OWNER: 'OWNER',
  InviteCompanyMemberDtoRoleEnum.RECRUITER: 'RECRUITER',
};
