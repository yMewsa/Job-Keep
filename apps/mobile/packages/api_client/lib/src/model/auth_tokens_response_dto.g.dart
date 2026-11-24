// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthTokensResponseDtoCWProxy {
  AuthTokensResponseDto accessToken(String accessToken);

  AuthTokensResponseDto refreshToken(String refreshToken);

  AuthTokensResponseDto expiresInSeconds(num expiresInSeconds);

  AuthTokensResponseDto user(AuthUserDto user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthTokensResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthTokensResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthTokensResponseDto call({
    String accessToken,
    String refreshToken,
    num expiresInSeconds,
    AuthUserDto user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthTokensResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthTokensResponseDto.copyWith.fieldName(...)`
class _$AuthTokensResponseDtoCWProxyImpl
    implements _$AuthTokensResponseDtoCWProxy {
  const _$AuthTokensResponseDtoCWProxyImpl(this._value);

  final AuthTokensResponseDto _value;

  @override
  AuthTokensResponseDto accessToken(String accessToken) =>
      this(accessToken: accessToken);

  @override
  AuthTokensResponseDto refreshToken(String refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  AuthTokensResponseDto expiresInSeconds(num expiresInSeconds) =>
      this(expiresInSeconds: expiresInSeconds);

  @override
  AuthTokensResponseDto user(AuthUserDto user) => this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthTokensResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthTokensResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthTokensResponseDto call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
    Object? expiresInSeconds = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return AuthTokensResponseDto(
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String,
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String,
      expiresInSeconds: expiresInSeconds == const $CopyWithPlaceholder()
          ? _value.expiresInSeconds
          // ignore: cast_nullable_to_non_nullable
          : expiresInSeconds as num,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AuthUserDto,
    );
  }
}

extension $AuthTokensResponseDtoCopyWith on AuthTokensResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfAuthTokensResponseDto.copyWith(...)` or like so:`instanceOfAuthTokensResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthTokensResponseDtoCWProxy get copyWith =>
      _$AuthTokensResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokensResponseDto _$AuthTokensResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AuthTokensResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'accessToken',
      'refreshToken',
      'expiresInSeconds',
      'user',
    ],
  );
  final val = AuthTokensResponseDto(
    accessToken: $checkedConvert('accessToken', (v) => v as String),
    refreshToken: $checkedConvert('refreshToken', (v) => v as String),
    expiresInSeconds: $checkedConvert('expiresInSeconds', (v) => v as num),
    user: $checkedConvert(
      'user',
      (v) => AuthUserDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AuthTokensResponseDtoToJson(
  AuthTokensResponseDto instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'expiresInSeconds': instance.expiresInSeconds,
  'user': instance.user.toJson(),
};
