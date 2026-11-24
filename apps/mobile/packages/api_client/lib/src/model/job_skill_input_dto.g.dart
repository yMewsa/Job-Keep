// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_skill_input_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobSkillInputDtoCWProxy {
  JobSkillInputDto skillId(String skillId);

  JobSkillInputDto requirementType(
    JobSkillInputDtoRequirementTypeEnum requirementType,
  );

  JobSkillInputDto weight(int weight);

  JobSkillInputDto minimumLevel(JobSkillInputDtoMinimumLevelEnum? minimumLevel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillInputDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillInputDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillInputDto call({
    String skillId,
    JobSkillInputDtoRequirementTypeEnum requirementType,
    int weight,
    JobSkillInputDtoMinimumLevelEnum? minimumLevel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobSkillInputDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobSkillInputDto.copyWith.fieldName(...)`
class _$JobSkillInputDtoCWProxyImpl implements _$JobSkillInputDtoCWProxy {
  const _$JobSkillInputDtoCWProxyImpl(this._value);

  final JobSkillInputDto _value;

  @override
  JobSkillInputDto skillId(String skillId) => this(skillId: skillId);

  @override
  JobSkillInputDto requirementType(
    JobSkillInputDtoRequirementTypeEnum requirementType,
  ) => this(requirementType: requirementType);

  @override
  JobSkillInputDto weight(int weight) => this(weight: weight);

  @override
  JobSkillInputDto minimumLevel(
    JobSkillInputDtoMinimumLevelEnum? minimumLevel,
  ) => this(minimumLevel: minimumLevel);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillInputDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillInputDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillInputDto call({
    Object? skillId = const $CopyWithPlaceholder(),
    Object? requirementType = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
    Object? minimumLevel = const $CopyWithPlaceholder(),
  }) {
    return JobSkillInputDto(
      skillId: skillId == const $CopyWithPlaceholder()
          ? _value.skillId
          // ignore: cast_nullable_to_non_nullable
          : skillId as String,
      requirementType: requirementType == const $CopyWithPlaceholder()
          ? _value.requirementType
          // ignore: cast_nullable_to_non_nullable
          : requirementType as JobSkillInputDtoRequirementTypeEnum,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as int,
      minimumLevel: minimumLevel == const $CopyWithPlaceholder()
          ? _value.minimumLevel
          // ignore: cast_nullable_to_non_nullable
          : minimumLevel as JobSkillInputDtoMinimumLevelEnum?,
    );
  }
}

extension $JobSkillInputDtoCopyWith on JobSkillInputDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobSkillInputDto.copyWith(...)` or like so:`instanceOfJobSkillInputDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobSkillInputDtoCWProxy get copyWith => _$JobSkillInputDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobSkillInputDto _$JobSkillInputDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JobSkillInputDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['skillId', 'requirementType', 'weight'],
      );
      final val = JobSkillInputDto(
        skillId: $checkedConvert('skillId', (v) => v as String),
        requirementType: $checkedConvert(
          'requirementType',
          (v) => $enumDecode(_$JobSkillInputDtoRequirementTypeEnumEnumMap, v),
        ),
        weight: $checkedConvert('weight', (v) => (v as num?)?.toInt() ?? 5),
        minimumLevel: $checkedConvert(
          'minimumLevel',
          (v) =>
              $enumDecodeNullable(_$JobSkillInputDtoMinimumLevelEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$JobSkillInputDtoToJson(
  JobSkillInputDto instance,
) => <String, dynamic>{
  'skillId': instance.skillId,
  'requirementType':
      _$JobSkillInputDtoRequirementTypeEnumEnumMap[instance.requirementType]!,
  'weight': instance.weight,
  'minimumLevel':
      ?_$JobSkillInputDtoMinimumLevelEnumEnumMap[instance.minimumLevel],
};

const _$JobSkillInputDtoRequirementTypeEnumEnumMap = {
  JobSkillInputDtoRequirementTypeEnum.REQUIRED: 'REQUIRED',
  JobSkillInputDtoRequirementTypeEnum.DESIRABLE: 'DESIRABLE',
};

const _$JobSkillInputDtoMinimumLevelEnumEnumMap = {
  JobSkillInputDtoMinimumLevelEnum.BEGINNER: 'BEGINNER',
  JobSkillInputDtoMinimumLevelEnum.INTERMEDIATE: 'INTERMEDIATE',
  JobSkillInputDtoMinimumLevelEnum.ADVANCED: 'ADVANCED',
  JobSkillInputDtoMinimumLevelEnum.EXPERT: 'EXPERT',
};
