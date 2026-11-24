// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_upload_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfirmUploadDtoCWProxy {
  ConfirmUploadDto fileKey(String fileKey);

  ConfirmUploadDto originalFileName(String originalFileName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfirmUploadDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfirmUploadDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmUploadDto call({String fileKey, String originalFileName});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfirmUploadDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfirmUploadDto.copyWith.fieldName(...)`
class _$ConfirmUploadDtoCWProxyImpl implements _$ConfirmUploadDtoCWProxy {
  const _$ConfirmUploadDtoCWProxyImpl(this._value);

  final ConfirmUploadDto _value;

  @override
  ConfirmUploadDto fileKey(String fileKey) => this(fileKey: fileKey);

  @override
  ConfirmUploadDto originalFileName(String originalFileName) =>
      this(originalFileName: originalFileName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfirmUploadDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfirmUploadDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmUploadDto call({
    Object? fileKey = const $CopyWithPlaceholder(),
    Object? originalFileName = const $CopyWithPlaceholder(),
  }) {
    return ConfirmUploadDto(
      fileKey: fileKey == const $CopyWithPlaceholder()
          ? _value.fileKey
          // ignore: cast_nullable_to_non_nullable
          : fileKey as String,
      originalFileName: originalFileName == const $CopyWithPlaceholder()
          ? _value.originalFileName
          // ignore: cast_nullable_to_non_nullable
          : originalFileName as String,
    );
  }
}

extension $ConfirmUploadDtoCopyWith on ConfirmUploadDto {
  /// Returns a callable class that can be used as follows: `instanceOfConfirmUploadDto.copyWith(...)` or like so:`instanceOfConfirmUploadDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfirmUploadDtoCWProxy get copyWith => _$ConfirmUploadDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmUploadDto _$ConfirmUploadDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfirmUploadDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['fileKey', 'originalFileName']);
      final val = ConfirmUploadDto(
        fileKey: $checkedConvert('fileKey', (v) => v as String),
        originalFileName: $checkedConvert(
          'originalFileName',
          (v) => v as String,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConfirmUploadDtoToJson(ConfirmUploadDto instance) =>
    <String, dynamic>{
      'fileKey': instance.fileKey,
      'originalFileName': instance.originalFileName,
    };
