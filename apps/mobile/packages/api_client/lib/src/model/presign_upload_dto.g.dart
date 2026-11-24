// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presign_upload_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PresignUploadDtoCWProxy {
  PresignUploadDto fileName(String fileName);

  PresignUploadDto mimeType(String mimeType);

  PresignUploadDto sizeBytes(num sizeBytes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignUploadDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignUploadDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignUploadDto call({String fileName, String mimeType, num sizeBytes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPresignUploadDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPresignUploadDto.copyWith.fieldName(...)`
class _$PresignUploadDtoCWProxyImpl implements _$PresignUploadDtoCWProxy {
  const _$PresignUploadDtoCWProxyImpl(this._value);

  final PresignUploadDto _value;

  @override
  PresignUploadDto fileName(String fileName) => this(fileName: fileName);

  @override
  PresignUploadDto mimeType(String mimeType) => this(mimeType: mimeType);

  @override
  PresignUploadDto sizeBytes(num sizeBytes) => this(sizeBytes: sizeBytes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignUploadDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignUploadDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignUploadDto call({
    Object? fileName = const $CopyWithPlaceholder(),
    Object? mimeType = const $CopyWithPlaceholder(),
    Object? sizeBytes = const $CopyWithPlaceholder(),
  }) {
    return PresignUploadDto(
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

extension $PresignUploadDtoCopyWith on PresignUploadDto {
  /// Returns a callable class that can be used as follows: `instanceOfPresignUploadDto.copyWith(...)` or like so:`instanceOfPresignUploadDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PresignUploadDtoCWProxy get copyWith => _$PresignUploadDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignUploadDto _$PresignUploadDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PresignUploadDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['fileName', 'mimeType', 'sizeBytes'],
      );
      final val = PresignUploadDto(
        fileName: $checkedConvert('fileName', (v) => v as String),
        mimeType: $checkedConvert('mimeType', (v) => v as String),
        sizeBytes: $checkedConvert('sizeBytes', (v) => v as num),
      );
      return val;
    });

Map<String, dynamic> _$PresignUploadDtoToJson(PresignUploadDto instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'mimeType': instance.mimeType,
      'sizeBytes': instance.sizeBytes,
    };
