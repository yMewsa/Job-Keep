// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_candidate_visibility_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateCandidateVisibilityDtoCWProxy {
  UpdateCandidateVisibilityDto hideFullNameBeforeMatch(
    bool hideFullNameBeforeMatch,
  );

  UpdateCandidateVisibilityDto hidePhotoBeforeMatch(bool hidePhotoBeforeMatch);

  UpdateCandidateVisibilityDto hideResumeBeforeMatch(
    bool hideResumeBeforeMatch,
  );

  UpdateCandidateVisibilityDto hideLinksBeforeMatch(bool hideLinksBeforeMatch);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCandidateVisibilityDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCandidateVisibilityDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCandidateVisibilityDto call({
    bool hideFullNameBeforeMatch,
    bool hidePhotoBeforeMatch,
    bool hideResumeBeforeMatch,
    bool hideLinksBeforeMatch,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateCandidateVisibilityDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateCandidateVisibilityDto.copyWith.fieldName(...)`
class _$UpdateCandidateVisibilityDtoCWProxyImpl
    implements _$UpdateCandidateVisibilityDtoCWProxy {
  const _$UpdateCandidateVisibilityDtoCWProxyImpl(this._value);

  final UpdateCandidateVisibilityDto _value;

  @override
  UpdateCandidateVisibilityDto hideFullNameBeforeMatch(
    bool hideFullNameBeforeMatch,
  ) => this(hideFullNameBeforeMatch: hideFullNameBeforeMatch);

  @override
  UpdateCandidateVisibilityDto hidePhotoBeforeMatch(
    bool hidePhotoBeforeMatch,
  ) => this(hidePhotoBeforeMatch: hidePhotoBeforeMatch);

  @override
  UpdateCandidateVisibilityDto hideResumeBeforeMatch(
    bool hideResumeBeforeMatch,
  ) => this(hideResumeBeforeMatch: hideResumeBeforeMatch);

  @override
  UpdateCandidateVisibilityDto hideLinksBeforeMatch(
    bool hideLinksBeforeMatch,
  ) => this(hideLinksBeforeMatch: hideLinksBeforeMatch);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCandidateVisibilityDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCandidateVisibilityDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCandidateVisibilityDto call({
    Object? hideFullNameBeforeMatch = const $CopyWithPlaceholder(),
    Object? hidePhotoBeforeMatch = const $CopyWithPlaceholder(),
    Object? hideResumeBeforeMatch = const $CopyWithPlaceholder(),
    Object? hideLinksBeforeMatch = const $CopyWithPlaceholder(),
  }) {
    return UpdateCandidateVisibilityDto(
      hideFullNameBeforeMatch:
          hideFullNameBeforeMatch == const $CopyWithPlaceholder()
          ? _value.hideFullNameBeforeMatch
          // ignore: cast_nullable_to_non_nullable
          : hideFullNameBeforeMatch as bool,
      hidePhotoBeforeMatch: hidePhotoBeforeMatch == const $CopyWithPlaceholder()
          ? _value.hidePhotoBeforeMatch
          // ignore: cast_nullable_to_non_nullable
          : hidePhotoBeforeMatch as bool,
      hideResumeBeforeMatch:
          hideResumeBeforeMatch == const $CopyWithPlaceholder()
          ? _value.hideResumeBeforeMatch
          // ignore: cast_nullable_to_non_nullable
          : hideResumeBeforeMatch as bool,
      hideLinksBeforeMatch: hideLinksBeforeMatch == const $CopyWithPlaceholder()
          ? _value.hideLinksBeforeMatch
          // ignore: cast_nullable_to_non_nullable
          : hideLinksBeforeMatch as bool,
    );
  }
}

extension $UpdateCandidateVisibilityDtoCopyWith
    on UpdateCandidateVisibilityDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateCandidateVisibilityDto.copyWith(...)` or like so:`instanceOfUpdateCandidateVisibilityDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateCandidateVisibilityDtoCWProxy get copyWith =>
      _$UpdateCandidateVisibilityDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCandidateVisibilityDto _$UpdateCandidateVisibilityDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateCandidateVisibilityDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'hideFullNameBeforeMatch',
      'hidePhotoBeforeMatch',
      'hideResumeBeforeMatch',
      'hideLinksBeforeMatch',
    ],
  );
  final val = UpdateCandidateVisibilityDto(
    hideFullNameBeforeMatch: $checkedConvert(
      'hideFullNameBeforeMatch',
      (v) => v as bool,
    ),
    hidePhotoBeforeMatch: $checkedConvert(
      'hidePhotoBeforeMatch',
      (v) => v as bool,
    ),
    hideResumeBeforeMatch: $checkedConvert(
      'hideResumeBeforeMatch',
      (v) => v as bool,
    ),
    hideLinksBeforeMatch: $checkedConvert(
      'hideLinksBeforeMatch',
      (v) => v as bool,
    ),
  );
  return val;
});

Map<String, dynamic> _$UpdateCandidateVisibilityDtoToJson(
  UpdateCandidateVisibilityDto instance,
) => <String, dynamic>{
  'hideFullNameBeforeMatch': instance.hideFullNameBeforeMatch,
  'hidePhotoBeforeMatch': instance.hidePhotoBeforeMatch,
  'hideResumeBeforeMatch': instance.hideResumeBeforeMatch,
  'hideLinksBeforeMatch': instance.hideLinksBeforeMatch,
};
