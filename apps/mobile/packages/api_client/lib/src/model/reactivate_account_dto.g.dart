// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactivate_account_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReactivateAccountDtoCWProxy {
  ReactivateAccountDto email(String email);

  ReactivateAccountDto password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReactivateAccountDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReactivateAccountDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ReactivateAccountDto call({String email, String password});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReactivateAccountDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReactivateAccountDto.copyWith.fieldName(...)`
class _$ReactivateAccountDtoCWProxyImpl
    implements _$ReactivateAccountDtoCWProxy {
  const _$ReactivateAccountDtoCWProxyImpl(this._value);

  final ReactivateAccountDto _value;

  @override
  ReactivateAccountDto email(String email) => this(email: email);

  @override
  ReactivateAccountDto password(String password) => this(password: password);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReactivateAccountDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReactivateAccountDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ReactivateAccountDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return ReactivateAccountDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $ReactivateAccountDtoCopyWith on ReactivateAccountDto {
  /// Returns a callable class that can be used as follows: `instanceOfReactivateAccountDto.copyWith(...)` or like so:`instanceOfReactivateAccountDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReactivateAccountDtoCWProxy get copyWith =>
      _$ReactivateAccountDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactivateAccountDto _$ReactivateAccountDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReactivateAccountDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email', 'password']);
  final val = ReactivateAccountDto(
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ReactivateAccountDtoToJson(
  ReactivateAccountDto instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
