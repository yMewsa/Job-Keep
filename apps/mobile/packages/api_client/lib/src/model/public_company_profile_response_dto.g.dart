// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_company_profile_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PublicCompanyProfileResponseDtoCWProxy {
  PublicCompanyProfileResponseDto id(String id);

  PublicCompanyProfileResponseDto tradeName(String tradeName);

  PublicCompanyProfileResponseDto sector(String sector);

  PublicCompanyProfileResponseDto size(
    PublicCompanyProfileResponseDtoSizeEnum size,
  );

  PublicCompanyProfileResponseDto description(Object? description);

  PublicCompanyProfileResponseDto logoUrl(Object? logoUrl);

  PublicCompanyProfileResponseDto websiteUrl(Object? websiteUrl);

  PublicCompanyProfileResponseDto city(Object? city);

  PublicCompanyProfileResponseDto state(Object? state);

  PublicCompanyProfileResponseDto verificationStatus(
    PublicCompanyProfileResponseDtoVerificationStatusEnum verificationStatus,
  );

  PublicCompanyProfileResponseDto themeSettings(
    Map<String, Object>? themeSettings,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PublicCompanyProfileResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PublicCompanyProfileResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PublicCompanyProfileResponseDto call({
    String id,
    String tradeName,
    String sector,
    PublicCompanyProfileResponseDtoSizeEnum size,
    Object? description,
    Object? logoUrl,
    Object? websiteUrl,
    Object? city,
    Object? state,
    PublicCompanyProfileResponseDtoVerificationStatusEnum verificationStatus,
    Map<String, Object>? themeSettings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPublicCompanyProfileResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPublicCompanyProfileResponseDto.copyWith.fieldName(...)`
class _$PublicCompanyProfileResponseDtoCWProxyImpl
    implements _$PublicCompanyProfileResponseDtoCWProxy {
  const _$PublicCompanyProfileResponseDtoCWProxyImpl(this._value);

  final PublicCompanyProfileResponseDto _value;

  @override
  PublicCompanyProfileResponseDto id(String id) => this(id: id);

  @override
  PublicCompanyProfileResponseDto tradeName(String tradeName) =>
      this(tradeName: tradeName);

  @override
  PublicCompanyProfileResponseDto sector(String sector) => this(sector: sector);

  @override
  PublicCompanyProfileResponseDto size(
    PublicCompanyProfileResponseDtoSizeEnum size,
  ) => this(size: size);

  @override
  PublicCompanyProfileResponseDto description(Object? description) =>
      this(description: description);

  @override
  PublicCompanyProfileResponseDto logoUrl(Object? logoUrl) =>
      this(logoUrl: logoUrl);

  @override
  PublicCompanyProfileResponseDto websiteUrl(Object? websiteUrl) =>
      this(websiteUrl: websiteUrl);

  @override
  PublicCompanyProfileResponseDto city(Object? city) => this(city: city);

  @override
  PublicCompanyProfileResponseDto state(Object? state) => this(state: state);

  @override
  PublicCompanyProfileResponseDto verificationStatus(
    PublicCompanyProfileResponseDtoVerificationStatusEnum verificationStatus,
  ) => this(verificationStatus: verificationStatus);

  @override
  PublicCompanyProfileResponseDto themeSettings(
    Map<String, Object>? themeSettings,
  ) => this(themeSettings: themeSettings);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PublicCompanyProfileResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PublicCompanyProfileResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PublicCompanyProfileResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? tradeName = const $CopyWithPlaceholder(),
    Object? sector = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? logoUrl = const $CopyWithPlaceholder(),
    Object? websiteUrl = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? verificationStatus = const $CopyWithPlaceholder(),
    Object? themeSettings = const $CopyWithPlaceholder(),
  }) {
    return PublicCompanyProfileResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      tradeName: tradeName == const $CopyWithPlaceholder()
          ? _value.tradeName
          // ignore: cast_nullable_to_non_nullable
          : tradeName as String,
      sector: sector == const $CopyWithPlaceholder()
          ? _value.sector
          // ignore: cast_nullable_to_non_nullable
          : sector as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as PublicCompanyProfileResponseDtoSizeEnum,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as Object?,
      logoUrl: logoUrl == const $CopyWithPlaceholder()
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as Object?,
      websiteUrl: websiteUrl == const $CopyWithPlaceholder()
          ? _value.websiteUrl
          // ignore: cast_nullable_to_non_nullable
          : websiteUrl as Object?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as Object?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as Object?,
      verificationStatus: verificationStatus == const $CopyWithPlaceholder()
          ? _value.verificationStatus
          // ignore: cast_nullable_to_non_nullable
          : verificationStatus
                as PublicCompanyProfileResponseDtoVerificationStatusEnum,
      themeSettings: themeSettings == const $CopyWithPlaceholder()
          ? _value.themeSettings
          // ignore: cast_nullable_to_non_nullable
          : themeSettings as Map<String, Object>?,
    );
  }
}

extension $PublicCompanyProfileResponseDtoCopyWith
    on PublicCompanyProfileResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfPublicCompanyProfileResponseDto.copyWith(...)` or like so:`instanceOfPublicCompanyProfileResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PublicCompanyProfileResponseDtoCWProxy get copyWith =>
      _$PublicCompanyProfileResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicCompanyProfileResponseDto _$PublicCompanyProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PublicCompanyProfileResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'tradeName',
      'sector',
      'size',
      'verificationStatus',
    ],
  );
  final val = PublicCompanyProfileResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    tradeName: $checkedConvert('tradeName', (v) => v as String),
    sector: $checkedConvert('sector', (v) => v as String),
    size: $checkedConvert(
      'size',
      (v) => $enumDecode(_$PublicCompanyProfileResponseDtoSizeEnumEnumMap, v),
    ),
    description: $checkedConvert('description', (v) => v),
    logoUrl: $checkedConvert('logoUrl', (v) => v),
    websiteUrl: $checkedConvert('websiteUrl', (v) => v),
    city: $checkedConvert('city', (v) => v),
    state: $checkedConvert('state', (v) => v),
    verificationStatus: $checkedConvert(
      'verificationStatus',
      (v) => $enumDecode(
        _$PublicCompanyProfileResponseDtoVerificationStatusEnumEnumMap,
        v,
      ),
    ),
    themeSettings: $checkedConvert(
      'themeSettings',
      (v) =>
          (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as Object)),
    ),
  );
  return val;
});

Map<String, dynamic> _$PublicCompanyProfileResponseDtoToJson(
  PublicCompanyProfileResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'tradeName': instance.tradeName,
  'sector': instance.sector,
  'size': _$PublicCompanyProfileResponseDtoSizeEnumEnumMap[instance.size]!,
  'description': ?instance.description,
  'logoUrl': ?instance.logoUrl,
  'websiteUrl': ?instance.websiteUrl,
  'city': ?instance.city,
  'state': ?instance.state,
  'verificationStatus':
      _$PublicCompanyProfileResponseDtoVerificationStatusEnumEnumMap[instance
          .verificationStatus]!,
  'themeSettings': ?instance.themeSettings,
};

const _$PublicCompanyProfileResponseDtoSizeEnumEnumMap = {
  PublicCompanyProfileResponseDtoSizeEnum.MICRO: 'MICRO',
  PublicCompanyProfileResponseDtoSizeEnum.SMALL: 'SMALL',
  PublicCompanyProfileResponseDtoSizeEnum.MEDIUM: 'MEDIUM',
  PublicCompanyProfileResponseDtoSizeEnum.LARGE: 'LARGE',
  PublicCompanyProfileResponseDtoSizeEnum.ENTERPRISE: 'ENTERPRISE',
};

const _$PublicCompanyProfileResponseDtoVerificationStatusEnumEnumMap = {
  PublicCompanyProfileResponseDtoVerificationStatusEnum.PENDING: 'PENDING',
  PublicCompanyProfileResponseDtoVerificationStatusEnum.VERIFIED: 'VERIFIED',
  PublicCompanyProfileResponseDtoVerificationStatusEnum.REJECTED: 'REJECTED',
};
