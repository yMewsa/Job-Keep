// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResetPasswordDtoCWProxy {
  ResetPasswordDto email(String? email);

  ResetPasswordDto code(String? code);

  ResetPasswordDto token(String? token);

  ResetPasswordDto newPassword(String newPassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResetPasswordDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResetPasswordDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ResetPasswordDto call({
    String? email,
    String? code,
    String? token,
    String newPassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfResetPasswordDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfResetPasswordDto.copyWith.fieldName(...)`
class _$ResetPasswordDtoCWProxyImpl implements _$ResetPasswordDtoCWProxy {
  const _$ResetPasswordDtoCWProxyImpl(this._value);

  final ResetPasswordDto _value;

  @override
  ResetPasswordDto email(String? email) => this(email: email);

  @override
  ResetPasswordDto code(String? code) => this(code: code);

  @override
  ResetPasswordDto token(String? token) => this(token: token);

  @override
  ResetPasswordDto newPassword(String newPassword) =>
      this(newPassword: newPassword);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResetPasswordDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResetPasswordDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ResetPasswordDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
  }) {
    return ResetPasswordDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
      newPassword: newPassword == const $CopyWithPlaceholder()
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String,
    );
  }
}

extension $ResetPasswordDtoCopyWith on ResetPasswordDto {
  /// Returns a callable class that can be used as follows: `instanceOfResetPasswordDto.copyWith(...)` or like so:`instanceOfResetPasswordDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResetPasswordDtoCWProxy get copyWith => _$ResetPasswordDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ResetPasswordDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['newPassword']);
      final val = ResetPasswordDto(
        email: $checkedConvert('email', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        token: $checkedConvert('token', (v) => v as String?),
        newPassword: $checkedConvert('newPassword', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ResetPasswordDtoToJson(ResetPasswordDto instance) =>
    <String, dynamic>{
      'email': ?instance.email,
      'code': ?instance.code,
      'token': ?instance.token,
      'newPassword': instance.newPassword,
    };
