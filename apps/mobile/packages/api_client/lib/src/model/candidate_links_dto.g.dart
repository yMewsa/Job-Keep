// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_links_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CandidateLinksDtoCWProxy {
  CandidateLinksDto linkedin(String? linkedin);

  CandidateLinksDto github(String? github);

  CandidateLinksDto portfolio(String? portfolio);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CandidateLinksDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CandidateLinksDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CandidateLinksDto call({String? linkedin, String? github, String? portfolio});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCandidateLinksDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCandidateLinksDto.copyWith.fieldName(...)`
class _$CandidateLinksDtoCWProxyImpl implements _$CandidateLinksDtoCWProxy {
  const _$CandidateLinksDtoCWProxyImpl(this._value);

  final CandidateLinksDto _value;

  @override
  CandidateLinksDto linkedin(String? linkedin) => this(linkedin: linkedin);

  @override
  CandidateLinksDto github(String? github) => this(github: github);

  @override
  CandidateLinksDto portfolio(String? portfolio) => this(portfolio: portfolio);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CandidateLinksDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CandidateLinksDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CandidateLinksDto call({
    Object? linkedin = const $CopyWithPlaceholder(),
    Object? github = const $CopyWithPlaceholder(),
    Object? portfolio = const $CopyWithPlaceholder(),
  }) {
    return CandidateLinksDto(
      linkedin: linkedin == const $CopyWithPlaceholder()
          ? _value.linkedin
          // ignore: cast_nullable_to_non_nullable
          : linkedin as String?,
      github: github == const $CopyWithPlaceholder()
          ? _value.github
          // ignore: cast_nullable_to_non_nullable
          : github as String?,
      portfolio: portfolio == const $CopyWithPlaceholder()
          ? _value.portfolio
          // ignore: cast_nullable_to_non_nullable
          : portfolio as String?,
    );
  }
}

extension $CandidateLinksDtoCopyWith on CandidateLinksDto {
  /// Returns a callable class that can be used as follows: `instanceOfCandidateLinksDto.copyWith(...)` or like so:`instanceOfCandidateLinksDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CandidateLinksDtoCWProxy get copyWith =>
      _$CandidateLinksDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateLinksDto _$CandidateLinksDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CandidateLinksDto', json, ($checkedConvert) {
      final val = CandidateLinksDto(
        linkedin: $checkedConvert('linkedin', (v) => v as String?),
        github: $checkedConvert('github', (v) => v as String?),
        portfolio: $checkedConvert('portfolio', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CandidateLinksDtoToJson(CandidateLinksDto instance) =>
    <String, dynamic>{
      'linkedin': ?instance.linkedin,
      'github': ?instance.github,
      'portfolio': ?instance.portfolio,
    };
