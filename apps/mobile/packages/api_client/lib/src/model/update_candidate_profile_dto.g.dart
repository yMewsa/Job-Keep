// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_candidate_profile_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateCandidateProfileDtoCWProxy {
  UpdateCandidateProfileDto fullName(String? fullName);

  UpdateCandidateProfileDto headline(String? headline);

  UpdateCandidateProfileDto bio(String? bio);

  UpdateCandidateProfileDto city(String? city);

  UpdateCandidateProfileDto state(String? state);

  UpdateCandidateProfileDto professionalArea(String? professionalArea);

  UpdateCandidateProfileDto links(CandidateLinksDto? links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCandidateProfileDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCandidateProfileDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCandidateProfileDto call({
    String? fullName,
    String? headline,
    String? bio,
    String? city,
    String? state,
    String? professionalArea,
    CandidateLinksDto? links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateCandidateProfileDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateCandidateProfileDto.copyWith.fieldName(...)`
class _$UpdateCandidateProfileDtoCWProxyImpl
    implements _$UpdateCandidateProfileDtoCWProxy {
  const _$UpdateCandidateProfileDtoCWProxyImpl(this._value);

  final UpdateCandidateProfileDto _value;

  @override
  UpdateCandidateProfileDto fullName(String? fullName) =>
      this(fullName: fullName);

  @override
  UpdateCandidateProfileDto headline(String? headline) =>
      this(headline: headline);

  @override
  UpdateCandidateProfileDto bio(String? bio) => this(bio: bio);

  @override
  UpdateCandidateProfileDto city(String? city) => this(city: city);

  @override
  UpdateCandidateProfileDto state(String? state) => this(state: state);

  @override
  UpdateCandidateProfileDto professionalArea(String? professionalArea) =>
      this(professionalArea: professionalArea);

  @override
  UpdateCandidateProfileDto links(CandidateLinksDto? links) =>
      this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCandidateProfileDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCandidateProfileDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCandidateProfileDto call({
    Object? fullName = const $CopyWithPlaceholder(),
    Object? headline = const $CopyWithPlaceholder(),
    Object? bio = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? professionalArea = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
  }) {
    return UpdateCandidateProfileDto(
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      headline: headline == const $CopyWithPlaceholder()
          ? _value.headline
          // ignore: cast_nullable_to_non_nullable
          : headline as String?,
      bio: bio == const $CopyWithPlaceholder()
          ? _value.bio
          // ignore: cast_nullable_to_non_nullable
          : bio as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      professionalArea: professionalArea == const $CopyWithPlaceholder()
          ? _value.professionalArea
          // ignore: cast_nullable_to_non_nullable
          : professionalArea as String?,
      links: links == const $CopyWithPlaceholder()
          ? _value.links
          // ignore: cast_nullable_to_non_nullable
          : links as CandidateLinksDto?,
    );
  }
}

extension $UpdateCandidateProfileDtoCopyWith on UpdateCandidateProfileDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateCandidateProfileDto.copyWith(...)` or like so:`instanceOfUpdateCandidateProfileDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateCandidateProfileDtoCWProxy get copyWith =>
      _$UpdateCandidateProfileDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCandidateProfileDto _$UpdateCandidateProfileDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateCandidateProfileDto', json, ($checkedConvert) {
  final val = UpdateCandidateProfileDto(
    fullName: $checkedConvert('fullName', (v) => v as String?),
    headline: $checkedConvert('headline', (v) => v as String?),
    bio: $checkedConvert('bio', (v) => v as String?),
    city: $checkedConvert('city', (v) => v as String?),
    state: $checkedConvert('state', (v) => v as String?),
    professionalArea: $checkedConvert('professionalArea', (v) => v as String?),
    links: $checkedConvert(
      'links',
      (v) => v == null
          ? null
          : CandidateLinksDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$UpdateCandidateProfileDtoToJson(
  UpdateCandidateProfileDto instance,
) => <String, dynamic>{
  'fullName': ?instance.fullName,
  'headline': ?instance.headline,
  'bio': ?instance.bio,
  'city': ?instance.city,
  'state': ?instance.state,
  'professionalArea': ?instance.professionalArea,
  'links': ?instance.links?.toJson(),
};
