// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_candidate_skill_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddCandidateSkillDtoCWProxy {
  AddCandidateSkillDto skillId(String skillId);

  AddCandidateSkillDto level(AddCandidateSkillDtoLevelEnum level);

  AddCandidateSkillDto yearsOfExperience(num yearsOfExperience);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddCandidateSkillDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddCandidateSkillDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AddCandidateSkillDto call({
    String skillId,
    AddCandidateSkillDtoLevelEnum level,
    num yearsOfExperience,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddCandidateSkillDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddCandidateSkillDto.copyWith.fieldName(...)`
class _$AddCandidateSkillDtoCWProxyImpl
    implements _$AddCandidateSkillDtoCWProxy {
  const _$AddCandidateSkillDtoCWProxyImpl(this._value);

  final AddCandidateSkillDto _value;

  @override
  AddCandidateSkillDto skillId(String skillId) => this(skillId: skillId);

  @override
  AddCandidateSkillDto level(AddCandidateSkillDtoLevelEnum level) =>
      this(level: level);

  @override
  AddCandidateSkillDto yearsOfExperience(num yearsOfExperience) =>
      this(yearsOfExperience: yearsOfExperience);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddCandidateSkillDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddCandidateSkillDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AddCandidateSkillDto call({
    Object? skillId = const $CopyWithPlaceholder(),
    Object? level = const $CopyWithPlaceholder(),
    Object? yearsOfExperience = const $CopyWithPlaceholder(),
  }) {
    return AddCandidateSkillDto(
      skillId: skillId == const $CopyWithPlaceholder()
          ? _value.skillId
          // ignore: cast_nullable_to_non_nullable
          : skillId as String,
      level: level == const $CopyWithPlaceholder()
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as AddCandidateSkillDtoLevelEnum,
      yearsOfExperience: yearsOfExperience == const $CopyWithPlaceholder()
          ? _value.yearsOfExperience
          // ignore: cast_nullable_to_non_nullable
          : yearsOfExperience as num,
    );
  }
}

extension $AddCandidateSkillDtoCopyWith on AddCandidateSkillDto {
  /// Returns a callable class that can be used as follows: `instanceOfAddCandidateSkillDto.copyWith(...)` or like so:`instanceOfAddCandidateSkillDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddCandidateSkillDtoCWProxy get copyWith =>
      _$AddCandidateSkillDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCandidateSkillDto _$AddCandidateSkillDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AddCandidateSkillDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['skillId', 'level', 'yearsOfExperience'],
  );
  final val = AddCandidateSkillDto(
    skillId: $checkedConvert('skillId', (v) => v as String),
    level: $checkedConvert(
      'level',
      (v) => $enumDecode(_$AddCandidateSkillDtoLevelEnumEnumMap, v),
    ),
    yearsOfExperience: $checkedConvert('yearsOfExperience', (v) => v as num),
  );
  return val;
});

Map<String, dynamic> _$AddCandidateSkillDtoToJson(
  AddCandidateSkillDto instance,
) => <String, dynamic>{
  'skillId': instance.skillId,
  'level': _$AddCandidateSkillDtoLevelEnumEnumMap[instance.level]!,
  'yearsOfExperience': instance.yearsOfExperience,
};

const _$AddCandidateSkillDtoLevelEnumEnumMap = {
  AddCandidateSkillDtoLevelEnum.BEGINNER: 'BEGINNER',
  AddCandidateSkillDtoLevelEnum.INTERMEDIATE: 'INTERMEDIATE',
  AddCandidateSkillDtoLevelEnum.ADVANCED: 'ADVANCED',
  AddCandidateSkillDtoLevelEnum.EXPERT: 'EXPERT',
};
