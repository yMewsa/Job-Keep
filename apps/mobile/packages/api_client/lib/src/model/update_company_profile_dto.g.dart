// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_company_profile_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateCompanyProfileDtoCWProxy {
  UpdateCompanyProfileDto tradeName(String? tradeName);

  UpdateCompanyProfileDto sector(String? sector);

  UpdateCompanyProfileDto size(UpdateCompanyProfileDtoSizeEnum? size);

  UpdateCompanyProfileDto description(String? description);

  UpdateCompanyProfileDto websiteUrl(String? websiteUrl);

  UpdateCompanyProfileDto city(String? city);

  UpdateCompanyProfileDto state(String? state);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCompanyProfileDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCompanyProfileDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCompanyProfileDto call({
    String? tradeName,
    String? sector,
    UpdateCompanyProfileDtoSizeEnum? size,
    String? description,
    String? websiteUrl,
    String? city,
    String? state,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateCompanyProfileDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateCompanyProfileDto.copyWith.fieldName(...)`
class _$UpdateCompanyProfileDtoCWProxyImpl
    implements _$UpdateCompanyProfileDtoCWProxy {
  const _$UpdateCompanyProfileDtoCWProxyImpl(this._value);

  final UpdateCompanyProfileDto _value;

  @override
  UpdateCompanyProfileDto tradeName(String? tradeName) =>
      this(tradeName: tradeName);

  @override
  UpdateCompanyProfileDto sector(String? sector) => this(sector: sector);

  @override
  UpdateCompanyProfileDto size(UpdateCompanyProfileDtoSizeEnum? size) =>
      this(size: size);

  @override
  UpdateCompanyProfileDto description(String? description) =>
      this(description: description);

  @override
  UpdateCompanyProfileDto websiteUrl(String? websiteUrl) =>
      this(websiteUrl: websiteUrl);

  @override
  UpdateCompanyProfileDto city(String? city) => this(city: city);

  @override
  UpdateCompanyProfileDto state(String? state) => this(state: state);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCompanyProfileDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCompanyProfileDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCompanyProfileDto call({
    Object? tradeName = const $CopyWithPlaceholder(),
    Object? sector = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? websiteUrl = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
  }) {
    return UpdateCompanyProfileDto(
      tradeName: tradeName == const $CopyWithPlaceholder()
          ? _value.tradeName
          // ignore: cast_nullable_to_non_nullable
          : tradeName as String?,
      sector: sector == const $CopyWithPlaceholder()
          ? _value.sector
          // ignore: cast_nullable_to_non_nullable
          : sector as String?,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as UpdateCompanyProfileDtoSizeEnum?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      websiteUrl: websiteUrl == const $CopyWithPlaceholder()
          ? _value.websiteUrl
          // ignore: cast_nullable_to_non_nullable
          : websiteUrl as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
    );
  }
}

extension $UpdateCompanyProfileDtoCopyWith on UpdateCompanyProfileDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateCompanyProfileDto.copyWith(...)` or like so:`instanceOfUpdateCompanyProfileDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateCompanyProfileDtoCWProxy get copyWith =>
      _$UpdateCompanyProfileDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCompanyProfileDto _$UpdateCompanyProfileDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateCompanyProfileDto', json, ($checkedConvert) {
  final val = UpdateCompanyProfileDto(
    tradeName: $checkedConvert('tradeName', (v) => v as String?),
    sector: $checkedConvert('sector', (v) => v as String?),
    size: $checkedConvert(
      'size',
      (v) => $enumDecodeNullable(_$UpdateCompanyProfileDtoSizeEnumEnumMap, v),
    ),
    description: $checkedConvert('description', (v) => v as String?),
    websiteUrl: $checkedConvert('websiteUrl', (v) => v as String?),
    city: $checkedConvert('city', (v) => v as String?),
    state: $checkedConvert('state', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$UpdateCompanyProfileDtoToJson(
  UpdateCompanyProfileDto instance,
) => <String, dynamic>{
  'tradeName': ?instance.tradeName,
  'sector': ?instance.sector,
  'size': ?_$UpdateCompanyProfileDtoSizeEnumEnumMap[instance.size],
  'description': ?instance.description,
  'websiteUrl': ?instance.websiteUrl,
  'city': ?instance.city,
  'state': ?instance.state,
};

const _$UpdateCompanyProfileDtoSizeEnumEnumMap = {
  UpdateCompanyProfileDtoSizeEnum.MICRO: 'MICRO',
  UpdateCompanyProfileDtoSizeEnum.SMALL: 'SMALL',
  UpdateCompanyProfileDtoSizeEnum.MEDIUM: 'MEDIUM',
  UpdateCompanyProfileDtoSizeEnum.LARGE: 'LARGE',
  UpdateCompanyProfileDtoSizeEnum.ENTERPRISE: 'ENTERPRISE',
};
