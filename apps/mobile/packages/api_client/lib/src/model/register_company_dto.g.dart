// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_company_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterCompanyDtoCWProxy {
  RegisterCompanyDto email(String email);

  RegisterCompanyDto password(String password);

  RegisterCompanyDto legalName(String legalName);

  RegisterCompanyDto tradeName(String tradeName);

  RegisterCompanyDto cnpj(String cnpj);

  RegisterCompanyDto sector(String sector);

  RegisterCompanyDto size(RegisterCompanyDtoSizeEnum size);

  RegisterCompanyDto acceptTerms(bool acceptTerms);

  RegisterCompanyDto acceptPrivacyPolicy(bool acceptPrivacyPolicy);

  RegisterCompanyDto termsVersion(String? termsVersion);

  RegisterCompanyDto privacyPolicyVersion(String? privacyPolicyVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterCompanyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterCompanyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterCompanyDto call({
    String email,
    String password,
    String legalName,
    String tradeName,
    String cnpj,
    String sector,
    RegisterCompanyDtoSizeEnum size,
    bool acceptTerms,
    bool acceptPrivacyPolicy,
    String? termsVersion,
    String? privacyPolicyVersion,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterCompanyDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterCompanyDto.copyWith.fieldName(...)`
class _$RegisterCompanyDtoCWProxyImpl implements _$RegisterCompanyDtoCWProxy {
  const _$RegisterCompanyDtoCWProxyImpl(this._value);

  final RegisterCompanyDto _value;

  @override
  RegisterCompanyDto email(String email) => this(email: email);

  @override
  RegisterCompanyDto password(String password) => this(password: password);

  @override
  RegisterCompanyDto legalName(String legalName) => this(legalName: legalName);

  @override
  RegisterCompanyDto tradeName(String tradeName) => this(tradeName: tradeName);

  @override
  RegisterCompanyDto cnpj(String cnpj) => this(cnpj: cnpj);

  @override
  RegisterCompanyDto sector(String sector) => this(sector: sector);

  @override
  RegisterCompanyDto size(RegisterCompanyDtoSizeEnum size) => this(size: size);

  @override
  RegisterCompanyDto acceptTerms(bool acceptTerms) =>
      this(acceptTerms: acceptTerms);

  @override
  RegisterCompanyDto acceptPrivacyPolicy(bool acceptPrivacyPolicy) =>
      this(acceptPrivacyPolicy: acceptPrivacyPolicy);

  @override
  RegisterCompanyDto termsVersion(String? termsVersion) =>
      this(termsVersion: termsVersion);

  @override
  RegisterCompanyDto privacyPolicyVersion(String? privacyPolicyVersion) =>
      this(privacyPolicyVersion: privacyPolicyVersion);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterCompanyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterCompanyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterCompanyDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? legalName = const $CopyWithPlaceholder(),
    Object? tradeName = const $CopyWithPlaceholder(),
    Object? cnpj = const $CopyWithPlaceholder(),
    Object? sector = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? acceptTerms = const $CopyWithPlaceholder(),
    Object? acceptPrivacyPolicy = const $CopyWithPlaceholder(),
    Object? termsVersion = const $CopyWithPlaceholder(),
    Object? privacyPolicyVersion = const $CopyWithPlaceholder(),
  }) {
    return RegisterCompanyDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      legalName: legalName == const $CopyWithPlaceholder()
          ? _value.legalName
          // ignore: cast_nullable_to_non_nullable
          : legalName as String,
      tradeName: tradeName == const $CopyWithPlaceholder()
          ? _value.tradeName
          // ignore: cast_nullable_to_non_nullable
          : tradeName as String,
      cnpj: cnpj == const $CopyWithPlaceholder()
          ? _value.cnpj
          // ignore: cast_nullable_to_non_nullable
          : cnpj as String,
      sector: sector == const $CopyWithPlaceholder()
          ? _value.sector
          // ignore: cast_nullable_to_non_nullable
          : sector as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as RegisterCompanyDtoSizeEnum,
      acceptTerms: acceptTerms == const $CopyWithPlaceholder()
          ? _value.acceptTerms
          // ignore: cast_nullable_to_non_nullable
          : acceptTerms as bool,
      acceptPrivacyPolicy: acceptPrivacyPolicy == const $CopyWithPlaceholder()
          ? _value.acceptPrivacyPolicy
          // ignore: cast_nullable_to_non_nullable
          : acceptPrivacyPolicy as bool,
      termsVersion: termsVersion == const $CopyWithPlaceholder()
          ? _value.termsVersion
          // ignore: cast_nullable_to_non_nullable
          : termsVersion as String?,
      privacyPolicyVersion: privacyPolicyVersion == const $CopyWithPlaceholder()
          ? _value.privacyPolicyVersion
          // ignore: cast_nullable_to_non_nullable
          : privacyPolicyVersion as String?,
    );
  }
}

extension $RegisterCompanyDtoCopyWith on RegisterCompanyDto {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterCompanyDto.copyWith(...)` or like so:`instanceOfRegisterCompanyDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterCompanyDtoCWProxy get copyWith =>
      _$RegisterCompanyDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCompanyDto _$RegisterCompanyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterCompanyDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'email',
          'password',
          'legalName',
          'tradeName',
          'cnpj',
          'sector',
          'size',
          'acceptTerms',
          'acceptPrivacyPolicy',
        ],
      );
      final val = RegisterCompanyDto(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        legalName: $checkedConvert('legalName', (v) => v as String),
        tradeName: $checkedConvert('tradeName', (v) => v as String),
        cnpj: $checkedConvert('cnpj', (v) => v as String),
        sector: $checkedConvert('sector', (v) => v as String),
        size: $checkedConvert(
          'size',
          (v) => $enumDecode(_$RegisterCompanyDtoSizeEnumEnumMap, v),
        ),
        acceptTerms: $checkedConvert('acceptTerms', (v) => v as bool),
        acceptPrivacyPolicy: $checkedConvert(
          'acceptPrivacyPolicy',
          (v) => v as bool,
        ),
        termsVersion: $checkedConvert(
          'termsVersion',
          (v) => v as String? ?? '1.0.0',
        ),
        privacyPolicyVersion: $checkedConvert(
          'privacyPolicyVersion',
          (v) => v as String? ?? '1.0.0',
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegisterCompanyDtoToJson(RegisterCompanyDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'legalName': instance.legalName,
      'tradeName': instance.tradeName,
      'cnpj': instance.cnpj,
      'sector': instance.sector,
      'size': _$RegisterCompanyDtoSizeEnumEnumMap[instance.size]!,
      'acceptTerms': instance.acceptTerms,
      'acceptPrivacyPolicy': instance.acceptPrivacyPolicy,
      'termsVersion': ?instance.termsVersion,
      'privacyPolicyVersion': ?instance.privacyPolicyVersion,
    };

const _$RegisterCompanyDtoSizeEnumEnumMap = {
  RegisterCompanyDtoSizeEnum.MICRO: 'MICRO',
  RegisterCompanyDtoSizeEnum.SMALL: 'SMALL',
  RegisterCompanyDtoSizeEnum.MEDIUM: 'MEDIUM',
  RegisterCompanyDtoSizeEnum.LARGE: 'LARGE',
  RegisterCompanyDtoSizeEnum.ENTERPRISE: 'ENTERPRISE',
};
