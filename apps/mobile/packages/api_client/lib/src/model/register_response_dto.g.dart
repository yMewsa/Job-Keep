// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterResponseDtoCWProxy {
  RegisterResponseDto message(String message);

  RegisterResponseDto user(AuthUserDto user);

  RegisterResponseDto devVerificationCode(String? devVerificationCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterResponseDto call({
    String message,
    AuthUserDto user,
    String? devVerificationCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterResponseDto.copyWith.fieldName(...)`
class _$RegisterResponseDtoCWProxyImpl implements _$RegisterResponseDtoCWProxy {
  const _$RegisterResponseDtoCWProxyImpl(this._value);

  final RegisterResponseDto _value;

  @override
  RegisterResponseDto message(String message) => this(message: message);

  @override
  RegisterResponseDto user(AuthUserDto user) => this(user: user);

  @override
  RegisterResponseDto devVerificationCode(String? devVerificationCode) =>
      this(devVerificationCode: devVerificationCode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterResponseDto call({
    Object? message = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? devVerificationCode = const $CopyWithPlaceholder(),
  }) {
    return RegisterResponseDto(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AuthUserDto,
      devVerificationCode: devVerificationCode == const $CopyWithPlaceholder()
          ? _value.devVerificationCode
          // ignore: cast_nullable_to_non_nullable
          : devVerificationCode as String?,
    );
  }
}

extension $RegisterResponseDtoCopyWith on RegisterResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterResponseDto.copyWith(...)` or like so:`instanceOfRegisterResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterResponseDtoCWProxy get copyWith =>
      _$RegisterResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterResponseDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['message', 'user']);
      final val = RegisterResponseDto(
        message: $checkedConvert('message', (v) => v as String),
        user: $checkedConvert(
          'user',
          (v) => AuthUserDto.fromJson(v as Map<String, dynamic>),
        ),
        devVerificationCode: $checkedConvert(
          'devVerificationCode',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegisterResponseDtoToJson(
  RegisterResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user.toJson(),
  'devVerificationCode': ?instance.devVerificationCode,
};
