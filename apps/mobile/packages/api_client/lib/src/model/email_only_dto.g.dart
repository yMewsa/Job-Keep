// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_only_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmailOnlyDtoCWProxy {
  EmailOnlyDto email(String email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmailOnlyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmailOnlyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  EmailOnlyDto call({String email});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEmailOnlyDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEmailOnlyDto.copyWith.fieldName(...)`
class _$EmailOnlyDtoCWProxyImpl implements _$EmailOnlyDtoCWProxy {
  const _$EmailOnlyDtoCWProxyImpl(this._value);

  final EmailOnlyDto _value;

  @override
  EmailOnlyDto email(String email) => this(email: email);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmailOnlyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmailOnlyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  EmailOnlyDto call({Object? email = const $CopyWithPlaceholder()}) {
    return EmailOnlyDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $EmailOnlyDtoCopyWith on EmailOnlyDto {
  /// Returns a callable class that can be used as follows: `instanceOfEmailOnlyDto.copyWith(...)` or like so:`instanceOfEmailOnlyDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmailOnlyDtoCWProxy get copyWith => _$EmailOnlyDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailOnlyDto _$EmailOnlyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('EmailOnlyDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email']);
      final val = EmailOnlyDto(
        email: $checkedConvert('email', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$EmailOnlyDtoToJson(EmailOnlyDto instance) =>
    <String, dynamic>{'email': instance.email};
