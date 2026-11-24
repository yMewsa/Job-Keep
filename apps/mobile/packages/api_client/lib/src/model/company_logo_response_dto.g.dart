// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_logo_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyLogoResponseDtoCWProxy {
  CompanyLogoResponseDto logoUrl(String logoUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyLogoResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyLogoResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyLogoResponseDto call({String logoUrl});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyLogoResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyLogoResponseDto.copyWith.fieldName(...)`
class _$CompanyLogoResponseDtoCWProxyImpl
    implements _$CompanyLogoResponseDtoCWProxy {
  const _$CompanyLogoResponseDtoCWProxyImpl(this._value);

  final CompanyLogoResponseDto _value;

  @override
  CompanyLogoResponseDto logoUrl(String logoUrl) => this(logoUrl: logoUrl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyLogoResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyLogoResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyLogoResponseDto call({
    Object? logoUrl = const $CopyWithPlaceholder(),
  }) {
    return CompanyLogoResponseDto(
      logoUrl: logoUrl == const $CopyWithPlaceholder()
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as String,
    );
  }
}

extension $CompanyLogoResponseDtoCopyWith on CompanyLogoResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyLogoResponseDto.copyWith(...)` or like so:`instanceOfCompanyLogoResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyLogoResponseDtoCWProxy get copyWith =>
      _$CompanyLogoResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLogoResponseDto _$CompanyLogoResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyLogoResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['logoUrl']);
  final val = CompanyLogoResponseDto(
    logoUrl: $checkedConvert('logoUrl', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CompanyLogoResponseDtoToJson(
  CompanyLogoResponseDto instance,
) => <String, dynamic>{'logoUrl': instance.logoUrl};
