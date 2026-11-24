// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginDtoCWProxy {
  LoginDto email(String email);

  LoginDto password(String password);

  LoginDto deviceName(String? deviceName);

  LoginDto platform(String? platform);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginDto(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginDto call({
    String email,
    String password,
    String? deviceName,
    String? platform,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginDto.copyWith.fieldName(...)`
class _$LoginDtoCWProxyImpl implements _$LoginDtoCWProxy {
  const _$LoginDtoCWProxyImpl(this._value);

  final LoginDto _value;

  @override
  LoginDto email(String email) => this(email: email);

  @override
  LoginDto password(String password) => this(password: password);

  @override
  LoginDto deviceName(String? deviceName) => this(deviceName: deviceName);

  @override
  LoginDto platform(String? platform) => this(platform: platform);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginDto(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return LoginDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as String?,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
    );
  }
}

extension $LoginDtoCopyWith on LoginDto {
  /// Returns a callable class that can be used as follows: `instanceOfLoginDto.copyWith(...)` or like so:`instanceOfLoginDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginDtoCWProxy get copyWith => _$LoginDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email', 'password']);
      final val = LoginDto(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        deviceName: $checkedConvert('deviceName', (v) => v as String?),
        platform: $checkedConvert('platform', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'deviceName': ?instance.deviceName,
  'platform': ?instance.platform,
};
