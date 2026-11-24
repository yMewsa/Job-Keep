// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_job_summary_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyJobSummaryResponseDtoCWProxy {
  CompanyJobSummaryResponseDto id(String id);

  CompanyJobSummaryResponseDto tradeName(String tradeName);

  CompanyJobSummaryResponseDto sector(String sector);

  CompanyJobSummaryResponseDto logoUrl(Object? logoUrl);

  CompanyJobSummaryResponseDto verificationStatus(
    CompanyJobSummaryResponseDtoVerificationStatusEnum verificationStatus,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyJobSummaryResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyJobSummaryResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyJobSummaryResponseDto call({
    String id,
    String tradeName,
    String sector,
    Object? logoUrl,
    CompanyJobSummaryResponseDtoVerificationStatusEnum verificationStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyJobSummaryResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyJobSummaryResponseDto.copyWith.fieldName(...)`
class _$CompanyJobSummaryResponseDtoCWProxyImpl
    implements _$CompanyJobSummaryResponseDtoCWProxy {
  const _$CompanyJobSummaryResponseDtoCWProxyImpl(this._value);

  final CompanyJobSummaryResponseDto _value;

  @override
  CompanyJobSummaryResponseDto id(String id) => this(id: id);

  @override
  CompanyJobSummaryResponseDto tradeName(String tradeName) =>
      this(tradeName: tradeName);

  @override
  CompanyJobSummaryResponseDto sector(String sector) => this(sector: sector);

  @override
  CompanyJobSummaryResponseDto logoUrl(Object? logoUrl) =>
      this(logoUrl: logoUrl);

  @override
  CompanyJobSummaryResponseDto verificationStatus(
    CompanyJobSummaryResponseDtoVerificationStatusEnum verificationStatus,
  ) => this(verificationStatus: verificationStatus);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyJobSummaryResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyJobSummaryResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyJobSummaryResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? tradeName = const $CopyWithPlaceholder(),
    Object? sector = const $CopyWithPlaceholder(),
    Object? logoUrl = const $CopyWithPlaceholder(),
    Object? verificationStatus = const $CopyWithPlaceholder(),
  }) {
    return CompanyJobSummaryResponseDto(
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
      logoUrl: logoUrl == const $CopyWithPlaceholder()
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as Object?,
      verificationStatus: verificationStatus == const $CopyWithPlaceholder()
          ? _value.verificationStatus
          // ignore: cast_nullable_to_non_nullable
          : verificationStatus
                as CompanyJobSummaryResponseDtoVerificationStatusEnum,
    );
  }
}

extension $CompanyJobSummaryResponseDtoCopyWith
    on CompanyJobSummaryResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyJobSummaryResponseDto.copyWith(...)` or like so:`instanceOfCompanyJobSummaryResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyJobSummaryResponseDtoCWProxy get copyWith =>
      _$CompanyJobSummaryResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyJobSummaryResponseDto _$CompanyJobSummaryResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyJobSummaryResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'tradeName', 'sector', 'verificationStatus'],
  );
  final val = CompanyJobSummaryResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    tradeName: $checkedConvert('tradeName', (v) => v as String),
    sector: $checkedConvert('sector', (v) => v as String),
    logoUrl: $checkedConvert('logoUrl', (v) => v),
    verificationStatus: $checkedConvert(
      'verificationStatus',
      (v) => $enumDecode(
        _$CompanyJobSummaryResponseDtoVerificationStatusEnumEnumMap,
        v,
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyJobSummaryResponseDtoToJson(
  CompanyJobSummaryResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'tradeName': instance.tradeName,
  'sector': instance.sector,
  'logoUrl': ?instance.logoUrl,
  'verificationStatus':
      _$CompanyJobSummaryResponseDtoVerificationStatusEnumEnumMap[instance
          .verificationStatus]!,
};

const _$CompanyJobSummaryResponseDtoVerificationStatusEnumEnumMap = {
  CompanyJobSummaryResponseDtoVerificationStatusEnum.PENDING: 'PENDING',
  CompanyJobSummaryResponseDtoVerificationStatusEnum.VERIFIED: 'VERIFIED',
  CompanyJobSummaryResponseDtoVerificationStatusEnum.REJECTED: 'REJECTED',
};
