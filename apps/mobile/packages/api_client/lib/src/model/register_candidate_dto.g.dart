// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_candidate_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterCandidateDtoCWProxy {
  RegisterCandidateDto email(String email);

  RegisterCandidateDto password(String password);

  RegisterCandidateDto fullName(String fullName);

  RegisterCandidateDto acceptTerms(bool acceptTerms);

  RegisterCandidateDto acceptPrivacyPolicy(bool acceptPrivacyPolicy);

  RegisterCandidateDto termsVersion(String? termsVersion);

  RegisterCandidateDto privacyPolicyVersion(String? privacyPolicyVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterCandidateDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterCandidateDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterCandidateDto call({
    String email,
    String password,
    String fullName,
    bool acceptTerms,
    bool acceptPrivacyPolicy,
    String? termsVersion,
    String? privacyPolicyVersion,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterCandidateDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterCandidateDto.copyWith.fieldName(...)`
class _$RegisterCandidateDtoCWProxyImpl
    implements _$RegisterCandidateDtoCWProxy {
  const _$RegisterCandidateDtoCWProxyImpl(this._value);

  final RegisterCandidateDto _value;

  @override
  RegisterCandidateDto email(String email) => this(email: email);

  @override
  RegisterCandidateDto password(String password) => this(password: password);

  @override
  RegisterCandidateDto fullName(String fullName) => this(fullName: fullName);

  @override
  RegisterCandidateDto acceptTerms(bool acceptTerms) =>
      this(acceptTerms: acceptTerms);

  @override
  RegisterCandidateDto acceptPrivacyPolicy(bool acceptPrivacyPolicy) =>
      this(acceptPrivacyPolicy: acceptPrivacyPolicy);

  @override
  RegisterCandidateDto termsVersion(String? termsVersion) =>
      this(termsVersion: termsVersion);

  @override
  RegisterCandidateDto privacyPolicyVersion(String? privacyPolicyVersion) =>
      this(privacyPolicyVersion: privacyPolicyVersion);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterCandidateDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterCandidateDto(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterCandidateDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? acceptTerms = const $CopyWithPlaceholder(),
    Object? acceptPrivacyPolicy = const $CopyWithPlaceholder(),
    Object? termsVersion = const $CopyWithPlaceholder(),
    Object? privacyPolicyVersion = const $CopyWithPlaceholder(),
  }) {
    return RegisterCandidateDto(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String,
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

extension $RegisterCandidateDtoCopyWith on RegisterCandidateDto {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterCandidateDto.copyWith(...)` or like so:`instanceOfRegisterCandidateDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterCandidateDtoCWProxy get copyWith =>
      _$RegisterCandidateDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCandidateDto _$RegisterCandidateDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RegisterCandidateDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'email',
      'password',
      'fullName',
      'acceptTerms',
      'acceptPrivacyPolicy',
    ],
  );
  final val = RegisterCandidateDto(
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
    fullName: $checkedConvert('fullName', (v) => v as String),
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

Map<String, dynamic> _$RegisterCandidateDtoToJson(
  RegisterCandidateDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'fullName': instance.fullName,
  'acceptTerms': instance.acceptTerms,
  'acceptPrivacyPolicy': instance.acceptPrivacyPolicy,
  'termsVersion': ?instance.termsVersion,
  'privacyPolicyVersion': ?instance.privacyPolicyVersion,
};
