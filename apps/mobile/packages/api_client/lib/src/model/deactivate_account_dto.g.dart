// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deactivate_account_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeactivateAccountDtoCWProxy {
  DeactivateAccountDto password(String password);

  DeactivateAccountDto reason(String? reason);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeactivateAccountDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeactivateAccountDto(...).copyWith(id: 12, name: "My name")
  /// ````
  DeactivateAccountDto call({String password, String? reason});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeactivateAccountDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeactivateAccountDto.copyWith.fieldName(...)`
class _$DeactivateAccountDtoCWProxyImpl
    implements _$DeactivateAccountDtoCWProxy {
  const _$DeactivateAccountDtoCWProxyImpl(this._value);

  final DeactivateAccountDto _value;

  @override
  DeactivateAccountDto password(String password) => this(password: password);

  @override
  DeactivateAccountDto reason(String? reason) => this(reason: reason);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeactivateAccountDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeactivateAccountDto(...).copyWith(id: 12, name: "My name")
  /// ````
  DeactivateAccountDto call({
    Object? password = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
  }) {
    return DeactivateAccountDto(
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String?,
    );
  }
}

extension $DeactivateAccountDtoCopyWith on DeactivateAccountDto {
  /// Returns a callable class that can be used as follows: `instanceOfDeactivateAccountDto.copyWith(...)` or like so:`instanceOfDeactivateAccountDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeactivateAccountDtoCWProxy get copyWith =>
      _$DeactivateAccountDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeactivateAccountDto _$DeactivateAccountDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DeactivateAccountDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['password']);
  final val = DeactivateAccountDto(
    password: $checkedConvert('password', (v) => v as String),
    reason: $checkedConvert('reason', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$DeactivateAccountDtoToJson(
  DeactivateAccountDto instance,
) => <String, dynamic>{
  'password': instance.password,
  'reason': ?instance.reason,
};
