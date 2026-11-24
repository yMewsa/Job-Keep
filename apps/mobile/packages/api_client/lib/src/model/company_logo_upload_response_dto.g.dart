// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_logo_upload_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyLogoUploadResponseDtoCWProxy {
  CompanyLogoUploadResponseDto uploadUrl(String uploadUrl);

  CompanyLogoUploadResponseDto fileKey(String fileKey);

  CompanyLogoUploadResponseDto publicUrl(String publicUrl);

  CompanyLogoUploadResponseDto expiresInSeconds(int expiresInSeconds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyLogoUploadResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyLogoUploadResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyLogoUploadResponseDto call({
    String uploadUrl,
    String fileKey,
    String publicUrl,
    int expiresInSeconds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyLogoUploadResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyLogoUploadResponseDto.copyWith.fieldName(...)`
class _$CompanyLogoUploadResponseDtoCWProxyImpl
    implements _$CompanyLogoUploadResponseDtoCWProxy {
  const _$CompanyLogoUploadResponseDtoCWProxyImpl(this._value);

  final CompanyLogoUploadResponseDto _value;

  @override
  CompanyLogoUploadResponseDto uploadUrl(String uploadUrl) =>
      this(uploadUrl: uploadUrl);

  @override
  CompanyLogoUploadResponseDto fileKey(String fileKey) =>
      this(fileKey: fileKey);

  @override
  CompanyLogoUploadResponseDto publicUrl(String publicUrl) =>
      this(publicUrl: publicUrl);

  @override
  CompanyLogoUploadResponseDto expiresInSeconds(int expiresInSeconds) =>
      this(expiresInSeconds: expiresInSeconds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyLogoUploadResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyLogoUploadResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyLogoUploadResponseDto call({
    Object? uploadUrl = const $CopyWithPlaceholder(),
    Object? fileKey = const $CopyWithPlaceholder(),
    Object? publicUrl = const $CopyWithPlaceholder(),
    Object? expiresInSeconds = const $CopyWithPlaceholder(),
  }) {
    return CompanyLogoUploadResponseDto(
      uploadUrl: uploadUrl == const $CopyWithPlaceholder()
          ? _value.uploadUrl
          // ignore: cast_nullable_to_non_nullable
          : uploadUrl as String,
      fileKey: fileKey == const $CopyWithPlaceholder()
          ? _value.fileKey
          // ignore: cast_nullable_to_non_nullable
          : fileKey as String,
      publicUrl: publicUrl == const $CopyWithPlaceholder()
          ? _value.publicUrl
          // ignore: cast_nullable_to_non_nullable
          : publicUrl as String,
      expiresInSeconds: expiresInSeconds == const $CopyWithPlaceholder()
          ? _value.expiresInSeconds
          // ignore: cast_nullable_to_non_nullable
          : expiresInSeconds as int,
    );
  }
}

extension $CompanyLogoUploadResponseDtoCopyWith
    on CompanyLogoUploadResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyLogoUploadResponseDto.copyWith(...)` or like so:`instanceOfCompanyLogoUploadResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyLogoUploadResponseDtoCWProxy get copyWith =>
      _$CompanyLogoUploadResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLogoUploadResponseDto _$CompanyLogoUploadResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyLogoUploadResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'uploadUrl',
      'fileKey',
      'publicUrl',
      'expiresInSeconds',
    ],
  );
  final val = CompanyLogoUploadResponseDto(
    uploadUrl: $checkedConvert('uploadUrl', (v) => v as String),
    fileKey: $checkedConvert('fileKey', (v) => v as String),
    publicUrl: $checkedConvert('publicUrl', (v) => v as String),
    expiresInSeconds: $checkedConvert(
      'expiresInSeconds',
      (v) => (v as num).toInt(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyLogoUploadResponseDtoToJson(
  CompanyLogoUploadResponseDto instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'fileKey': instance.fileKey,
  'publicUrl': instance.publicUrl,
  'expiresInSeconds': instance.expiresInSeconds,
};
