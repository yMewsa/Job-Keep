// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthUserDtoCWProxy {
  AuthUserDto id(String id);

  AuthUserDto email(String email);

  AuthUserDto role(AuthUserDtoRoleEnum role);

  AuthUserDto status(AuthUserDtoStatusEnum status);

  AuthUserDto emailVerified(bool emailVerified);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUserDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUserDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUserDto call({
    String id,
    String email,
    AuthUserDtoRoleEnum role,
    AuthUserDtoStatusEnum status,
    bool emailVerified,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthUserDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthUserDto.copyWith.fieldName(...)`
class _$AuthUserDtoCWProxyImpl implements _$AuthUserDtoCWProxy {
  const _$AuthUserDtoCWProxyImpl(this._value);

  final AuthUserDto _value;

  @override
  AuthUserDto id(String id) => this(id: id);

  @override
  AuthUserDto email(String email) => this(email: email);

  @override
  AuthUserDto role(AuthUserDtoRoleEnum role) => this(role: role);

  @override
  AuthUserDto status(AuthUserDtoStatusEnum status) => this(status: status);

  @override
  AuthUserDto emailVerified(bool emailVerified) =>
      this(emailVerified: emailVerified);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUserDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUserDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUserDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? emailVerified = const $CopyWithPlaceholder(),
  }) {
    return AuthUserDto(
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
          : role as AuthUserDtoRoleEnum,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AuthUserDtoStatusEnum,
      emailVerified: emailVerified == const $CopyWithPlaceholder()
          ? _value.emailVerified
          // ignore: cast_nullable_to_non_nullable
          : emailVerified as bool,
    );
  }
}

extension $AuthUserDtoCopyWith on AuthUserDto {
  /// Returns a callable class that can be used as follows: `instanceOfAuthUserDto.copyWith(...)` or like so:`instanceOfAuthUserDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthUserDtoCWProxy get copyWith => _$AuthUserDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserDto _$AuthUserDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthUserDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['id', 'email', 'role', 'status', 'emailVerified'],
      );
      final val = AuthUserDto(
        id: $checkedConvert('id', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        role: $checkedConvert(
          'role',
          (v) => $enumDecode(_$AuthUserDtoRoleEnumEnumMap, v),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$AuthUserDtoStatusEnumEnumMap, v),
        ),
        emailVerified: $checkedConvert('emailVerified', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$AuthUserDtoToJson(AuthUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': _$AuthUserDtoRoleEnumEnumMap[instance.role]!,
      'status': _$AuthUserDtoStatusEnumEnumMap[instance.status]!,
      'emailVerified': instance.emailVerified,
    };

const _$AuthUserDtoRoleEnumEnumMap = {
  AuthUserDtoRoleEnum.CANDIDATE: 'CANDIDATE',
  AuthUserDtoRoleEnum.COMPANY: 'COMPANY',
  AuthUserDtoRoleEnum.ADMIN: 'ADMIN',
};

const _$AuthUserDtoStatusEnumEnumMap = {
  AuthUserDtoStatusEnum.ACTIVE: 'ACTIVE',
  AuthUserDtoStatusEnum.DEACTIVATED: 'DEACTIVATED',
  AuthUserDtoStatusEnum.SUSPENDED: 'SUSPENDED',
  AuthUserDtoStatusEnum.DELETED: 'DELETED',
};
