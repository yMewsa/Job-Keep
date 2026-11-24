// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_company_logo_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfirmCompanyLogoDtoCWProxy {
  ConfirmCompanyLogoDto fileKey(String fileKey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfirmCompanyLogoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfirmCompanyLogoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmCompanyLogoDto call({String fileKey});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfirmCompanyLogoDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfirmCompanyLogoDto.copyWith.fieldName(...)`
class _$ConfirmCompanyLogoDtoCWProxyImpl
    implements _$ConfirmCompanyLogoDtoCWProxy {
  const _$ConfirmCompanyLogoDtoCWProxyImpl(this._value);

  final ConfirmCompanyLogoDto _value;

  @override
  ConfirmCompanyLogoDto fileKey(String fileKey) => this(fileKey: fileKey);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfirmCompanyLogoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfirmCompanyLogoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmCompanyLogoDto call({Object? fileKey = const $CopyWithPlaceholder()}) {
    return ConfirmCompanyLogoDto(
      fileKey: fileKey == const $CopyWithPlaceholder()
          ? _value.fileKey
          // ignore: cast_nullable_to_non_nullable
          : fileKey as String,
    );
  }
}

extension $ConfirmCompanyLogoDtoCopyWith on ConfirmCompanyLogoDto {
  /// Returns a callable class that can be used as follows: `instanceOfConfirmCompanyLogoDto.copyWith(...)` or like so:`instanceOfConfirmCompanyLogoDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfirmCompanyLogoDtoCWProxy get copyWith =>
      _$ConfirmCompanyLogoDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmCompanyLogoDto _$ConfirmCompanyLogoDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfirmCompanyLogoDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['fileKey']);
  final val = ConfirmCompanyLogoDto(
    fileKey: $checkedConvert('fileKey', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ConfirmCompanyLogoDtoToJson(
  ConfirmCompanyLogoDto instance,
) => <String, dynamic>{'fileKey': instance.fileKey};
