// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presign_company_logo_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PresignCompanyLogoDtoCWProxy {
  PresignCompanyLogoDto fileName(String fileName);

  PresignCompanyLogoDto mimeType(String mimeType);

  PresignCompanyLogoDto sizeBytes(num sizeBytes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignCompanyLogoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignCompanyLogoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignCompanyLogoDto call({String fileName, String mimeType, num sizeBytes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPresignCompanyLogoDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPresignCompanyLogoDto.copyWith.fieldName(...)`
class _$PresignCompanyLogoDtoCWProxyImpl
    implements _$PresignCompanyLogoDtoCWProxy {
  const _$PresignCompanyLogoDtoCWProxyImpl(this._value);

  final PresignCompanyLogoDto _value;

  @override
  PresignCompanyLogoDto fileName(String fileName) => this(fileName: fileName);

  @override
  PresignCompanyLogoDto mimeType(String mimeType) => this(mimeType: mimeType);

  @override
  PresignCompanyLogoDto sizeBytes(num sizeBytes) => this(sizeBytes: sizeBytes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignCompanyLogoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignCompanyLogoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignCompanyLogoDto call({
    Object? fileName = const $CopyWithPlaceholder(),
    Object? mimeType = const $CopyWithPlaceholder(),
    Object? sizeBytes = const $CopyWithPlaceholder(),
  }) {
    return PresignCompanyLogoDto(
      fileName: fileName == const $CopyWithPlaceholder()
          ? _value.fileName
          // ignore: cast_nullable_to_non_nullable
          : fileName as String,
      mimeType: mimeType == const $CopyWithPlaceholder()
          ? _value.mimeType
          // ignore: cast_nullable_to_non_nullable
          : mimeType as String,
      sizeBytes: sizeBytes == const $CopyWithPlaceholder()
          ? _value.sizeBytes
          // ignore: cast_nullable_to_non_nullable
          : sizeBytes as num,
    );
  }
}

extension $PresignCompanyLogoDtoCopyWith on PresignCompanyLogoDto {
  /// Returns a callable class that can be used as follows: `instanceOfPresignCompanyLogoDto.copyWith(...)` or like so:`instanceOfPresignCompanyLogoDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PresignCompanyLogoDtoCWProxy get copyWith =>
      _$PresignCompanyLogoDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignCompanyLogoDto _$PresignCompanyLogoDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PresignCompanyLogoDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['fileName', 'mimeType', 'sizeBytes']);
  final val = PresignCompanyLogoDto(
    fileName: $checkedConvert('fileName', (v) => v as String),
    mimeType: $checkedConvert('mimeType', (v) => v as String),
    sizeBytes: $checkedConvert('sizeBytes', (v) => v as num),
  );
  return val;
});

Map<String, dynamic> _$PresignCompanyLogoDtoToJson(
  PresignCompanyLogoDto instance,
) => <String, dynamic>{
  'fileName': instance.fileName,
  'mimeType': instance.mimeType,
  'sizeBytes': instance.sizeBytes,
};
