// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VerifyEmailDtoCWProxy {
  VerifyEmailDto email(String? email);

  VerifyEmailDto code(String? code);

  VerifyEmailDto token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyEmailDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyEmailDto(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyEmailDto call({String? email, String? code, String? token});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVerifyEmailDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVerifyEmailDto.copyWith.fieldName(...)`
class _$VerifyEmailDtoCWProxyImpl implements _$VerifyEmailDtoCWProxy {
  const _$VerifyEmailDtoCWProxyImpl(this._value);

  final VerifyEmailDto _value;

  @override
  VerifyEmailDto email(String? email) => this(email: email);

  @override
  VerifyEmailDto code(String? code) => this(code: code);

  @override
  VerifyEmailDto token(String? token) => this(token: token);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyEmailDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyEmailDto(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyEmailDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return VerifyEmailDto(
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
    );
  }
}

extension $VerifyEmailDtoCopyWith on VerifyEmailDto {
  /// Returns a callable class that can be used as follows: `instanceOfVerifyEmailDto.copyWith(...)` or like so:`instanceOfVerifyEmailDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VerifyEmailDtoCWProxy get copyWith => _$VerifyEmailDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailDto _$VerifyEmailDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VerifyEmailDto', json, ($checkedConvert) {
      final val = VerifyEmailDto(
        email: $checkedConvert('email', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        token: $checkedConvert('token', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$VerifyEmailDtoToJson(VerifyEmailDto instance) =>
    <String, dynamic>{
      'email': ?instance.email,
      'code': ?instance.code,
      'token': ?instance.token,
    };
