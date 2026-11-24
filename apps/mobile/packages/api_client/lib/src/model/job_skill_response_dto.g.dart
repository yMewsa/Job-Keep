// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_skill_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobSkillResponseDtoCWProxy {
  JobSkillResponseDto id(String id);

  JobSkillResponseDto skillId(String skillId);

  JobSkillResponseDto requirementType(
    JobSkillResponseDtoRequirementTypeEnum requirementType,
  );

  JobSkillResponseDto weight(int weight);

  JobSkillResponseDto minimumLevel(
    JobSkillResponseDtoMinimumLevelEnum? minimumLevel,
  );

  JobSkillResponseDto skill(JobSkillCatalogResponseDto skill);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillResponseDto call({
    String id,
    String skillId,
    JobSkillResponseDtoRequirementTypeEnum requirementType,
    int weight,
    JobSkillResponseDtoMinimumLevelEnum? minimumLevel,
    JobSkillCatalogResponseDto skill,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobSkillResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobSkillResponseDto.copyWith.fieldName(...)`
class _$JobSkillResponseDtoCWProxyImpl implements _$JobSkillResponseDtoCWProxy {
  const _$JobSkillResponseDtoCWProxyImpl(this._value);

  final JobSkillResponseDto _value;

  @override
  JobSkillResponseDto id(String id) => this(id: id);

  @override
  JobSkillResponseDto skillId(String skillId) => this(skillId: skillId);

  @override
  JobSkillResponseDto requirementType(
    JobSkillResponseDtoRequirementTypeEnum requirementType,
  ) => this(requirementType: requirementType);

  @override
  JobSkillResponseDto weight(int weight) => this(weight: weight);

  @override
  JobSkillResponseDto minimumLevel(
    JobSkillResponseDtoMinimumLevelEnum? minimumLevel,
  ) => this(minimumLevel: minimumLevel);

  @override
  JobSkillResponseDto skill(JobSkillCatalogResponseDto skill) =>
      this(skill: skill);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? skillId = const $CopyWithPlaceholder(),
    Object? requirementType = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
    Object? minimumLevel = const $CopyWithPlaceholder(),
    Object? skill = const $CopyWithPlaceholder(),
  }) {
    return JobSkillResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      skillId: skillId == const $CopyWithPlaceholder()
          ? _value.skillId
          // ignore: cast_nullable_to_non_nullable
          : skillId as String,
      requirementType: requirementType == const $CopyWithPlaceholder()
          ? _value.requirementType
          // ignore: cast_nullable_to_non_nullable
          : requirementType as JobSkillResponseDtoRequirementTypeEnum,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as int,
      minimumLevel: minimumLevel == const $CopyWithPlaceholder()
          ? _value.minimumLevel
          // ignore: cast_nullable_to_non_nullable
          : minimumLevel as JobSkillResponseDtoMinimumLevelEnum?,
      skill: skill == const $CopyWithPlaceholder()
          ? _value.skill
          // ignore: cast_nullable_to_non_nullable
          : skill as JobSkillCatalogResponseDto,
    );
  }
}

extension $JobSkillResponseDtoCopyWith on JobSkillResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobSkillResponseDto.copyWith(...)` or like so:`instanceOfJobSkillResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobSkillResponseDtoCWProxy get copyWith =>
      _$JobSkillResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobSkillResponseDto _$JobSkillResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobSkillResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'skillId', 'requirementType', 'weight', 'skill'],
  );
  final val = JobSkillResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    skillId: $checkedConvert('skillId', (v) => v as String),
    requirementType: $checkedConvert(
      'requirementType',
      (v) => $enumDecode(_$JobSkillResponseDtoRequirementTypeEnumEnumMap, v),
    ),
    weight: $checkedConvert('weight', (v) => (v as num).toInt()),
    minimumLevel: $checkedConvert(
      'minimumLevel',
      (v) =>
          $enumDecodeNullable(_$JobSkillResponseDtoMinimumLevelEnumEnumMap, v),
    ),
    skill: $checkedConvert(
      'skill',
      (v) => JobSkillCatalogResponseDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$JobSkillResponseDtoToJson(
  JobSkillResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'skillId': instance.skillId,
  'requirementType':
      _$JobSkillResponseDtoRequirementTypeEnumEnumMap[instance
          .requirementType]!,
  'weight': instance.weight,
  'minimumLevel':
      ?_$JobSkillResponseDtoMinimumLevelEnumEnumMap[instance.minimumLevel],
  'skill': instance.skill.toJson(),
};

const _$JobSkillResponseDtoRequirementTypeEnumEnumMap = {
  JobSkillResponseDtoRequirementTypeEnum.REQUIRED: 'REQUIRED',
  JobSkillResponseDtoRequirementTypeEnum.DESIRABLE: 'DESIRABLE',
};

const _$JobSkillResponseDtoMinimumLevelEnumEnumMap = {
  JobSkillResponseDtoMinimumLevelEnum.BEGINNER: 'BEGINNER',
  JobSkillResponseDtoMinimumLevelEnum.INTERMEDIATE: 'INTERMEDIATE',
  JobSkillResponseDtoMinimumLevelEnum.ADVANCED: 'ADVANCED',
  JobSkillResponseDtoMinimumLevelEnum.EXPERT: 'EXPERT',
};
