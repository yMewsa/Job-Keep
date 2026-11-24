// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_job_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateJobDtoCWProxy {
  UpdateJobDto title(String? title);

  UpdateJobDto description(String? description);

  UpdateJobDto requirements(String? requirements);

  UpdateJobDto area(String? area);

  UpdateJobDto city(String? city);

  UpdateJobDto state(String? state);

  UpdateJobDto workMode(UpdateJobDtoWorkModeEnum? workMode);

  UpdateJobDto salaryMin(int? salaryMin);

  UpdateJobDto salaryMax(int? salaryMax);

  UpdateJobDto benefits(List<String>? benefits);

  UpdateJobDto seniority(UpdateJobDtoSeniorityEnum? seniority);

  UpdateJobDto contractType(UpdateJobDtoContractTypeEnum? contractType);

  UpdateJobDto responseDeadlineDays(int? responseDeadlineDays);

  UpdateJobDto skills(List<JobSkillInputDto>? skills);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateJobDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateJobDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateJobDto call({
    String? title,
    String? description,
    String? requirements,
    String? area,
    String? city,
    String? state,
    UpdateJobDtoWorkModeEnum? workMode,
    int? salaryMin,
    int? salaryMax,
    List<String>? benefits,
    UpdateJobDtoSeniorityEnum? seniority,
    UpdateJobDtoContractTypeEnum? contractType,
    int? responseDeadlineDays,
    List<JobSkillInputDto>? skills,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateJobDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateJobDto.copyWith.fieldName(...)`
class _$UpdateJobDtoCWProxyImpl implements _$UpdateJobDtoCWProxy {
  const _$UpdateJobDtoCWProxyImpl(this._value);

  final UpdateJobDto _value;

  @override
  UpdateJobDto title(String? title) => this(title: title);

  @override
  UpdateJobDto description(String? description) =>
      this(description: description);

  @override
  UpdateJobDto requirements(String? requirements) =>
      this(requirements: requirements);

  @override
  UpdateJobDto area(String? area) => this(area: area);

  @override
  UpdateJobDto city(String? city) => this(city: city);

  @override
  UpdateJobDto state(String? state) => this(state: state);

  @override
  UpdateJobDto workMode(UpdateJobDtoWorkModeEnum? workMode) =>
      this(workMode: workMode);

  @override
  UpdateJobDto salaryMin(int? salaryMin) => this(salaryMin: salaryMin);

  @override
  UpdateJobDto salaryMax(int? salaryMax) => this(salaryMax: salaryMax);

  @override
  UpdateJobDto benefits(List<String>? benefits) => this(benefits: benefits);

  @override
  UpdateJobDto seniority(UpdateJobDtoSeniorityEnum? seniority) =>
      this(seniority: seniority);

  @override
  UpdateJobDto contractType(UpdateJobDtoContractTypeEnum? contractType) =>
      this(contractType: contractType);

  @override
  UpdateJobDto responseDeadlineDays(int? responseDeadlineDays) =>
      this(responseDeadlineDays: responseDeadlineDays);

  @override
  UpdateJobDto skills(List<JobSkillInputDto>? skills) => this(skills: skills);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateJobDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateJobDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateJobDto call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? requirements = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? workMode = const $CopyWithPlaceholder(),
    Object? salaryMin = const $CopyWithPlaceholder(),
    Object? salaryMax = const $CopyWithPlaceholder(),
    Object? benefits = const $CopyWithPlaceholder(),
    Object? seniority = const $CopyWithPlaceholder(),
    Object? contractType = const $CopyWithPlaceholder(),
    Object? responseDeadlineDays = const $CopyWithPlaceholder(),
    Object? skills = const $CopyWithPlaceholder(),
  }) {
    return UpdateJobDto(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      requirements: requirements == const $CopyWithPlaceholder()
          ? _value.requirements
          // ignore: cast_nullable_to_non_nullable
          : requirements as String?,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      workMode: workMode == const $CopyWithPlaceholder()
          ? _value.workMode
          // ignore: cast_nullable_to_non_nullable
          : workMode as UpdateJobDtoWorkModeEnum?,
      salaryMin: salaryMin == const $CopyWithPlaceholder()
          ? _value.salaryMin
          // ignore: cast_nullable_to_non_nullable
          : salaryMin as int?,
      salaryMax: salaryMax == const $CopyWithPlaceholder()
          ? _value.salaryMax
          // ignore: cast_nullable_to_non_nullable
          : salaryMax as int?,
      benefits: benefits == const $CopyWithPlaceholder()
          ? _value.benefits
          // ignore: cast_nullable_to_non_nullable
          : benefits as List<String>?,
      seniority: seniority == const $CopyWithPlaceholder()
          ? _value.seniority
          // ignore: cast_nullable_to_non_nullable
          : seniority as UpdateJobDtoSeniorityEnum?,
      contractType: contractType == const $CopyWithPlaceholder()
          ? _value.contractType
          // ignore: cast_nullable_to_non_nullable
          : contractType as UpdateJobDtoContractTypeEnum?,
      responseDeadlineDays: responseDeadlineDays == const $CopyWithPlaceholder()
          ? _value.responseDeadlineDays
          // ignore: cast_nullable_to_non_nullable
          : responseDeadlineDays as int?,
      skills: skills == const $CopyWithPlaceholder()
          ? _value.skills
          // ignore: cast_nullable_to_non_nullable
          : skills as List<JobSkillInputDto>?,
    );
  }
}

extension $UpdateJobDtoCopyWith on UpdateJobDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateJobDto.copyWith(...)` or like so:`instanceOfUpdateJobDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateJobDtoCWProxy get copyWith => _$UpdateJobDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateJobDto _$UpdateJobDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateJobDto', json, ($checkedConvert) {
      final val = UpdateJobDto(
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        requirements: $checkedConvert('requirements', (v) => v as String?),
        area: $checkedConvert('area', (v) => v as String?),
        city: $checkedConvert('city', (v) => v as String?),
        state: $checkedConvert('state', (v) => v as String?),
        workMode: $checkedConvert(
          'workMode',
          (v) => $enumDecodeNullable(_$UpdateJobDtoWorkModeEnumEnumMap, v),
        ),
        salaryMin: $checkedConvert('salaryMin', (v) => (v as num?)?.toInt()),
        salaryMax: $checkedConvert('salaryMax', (v) => (v as num?)?.toInt()),
        benefits: $checkedConvert(
          'benefits',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        seniority: $checkedConvert(
          'seniority',
          (v) => $enumDecodeNullable(_$UpdateJobDtoSeniorityEnumEnumMap, v),
        ),
        contractType: $checkedConvert(
          'contractType',
          (v) => $enumDecodeNullable(_$UpdateJobDtoContractTypeEnumEnumMap, v),
        ),
        responseDeadlineDays: $checkedConvert(
          'responseDeadlineDays',
          (v) => (v as num?)?.toInt() ?? 14,
        ),
        skills: $checkedConvert(
          'skills',
          (v) => (v as List<dynamic>?)
              ?.map((e) => JobSkillInputDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UpdateJobDtoToJson(
  UpdateJobDto instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'description': ?instance.description,
  'requirements': ?instance.requirements,
  'area': ?instance.area,
  'city': ?instance.city,
  'state': ?instance.state,
  'workMode': ?_$UpdateJobDtoWorkModeEnumEnumMap[instance.workMode],
  'salaryMin': ?instance.salaryMin,
  'salaryMax': ?instance.salaryMax,
  'benefits': ?instance.benefits,
  'seniority': ?_$UpdateJobDtoSeniorityEnumEnumMap[instance.seniority],
  'contractType': ?_$UpdateJobDtoContractTypeEnumEnumMap[instance.contractType],
  'responseDeadlineDays': ?instance.responseDeadlineDays,
  'skills': ?instance.skills?.map((e) => e.toJson()).toList(),
};

const _$UpdateJobDtoWorkModeEnumEnumMap = {
  UpdateJobDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  UpdateJobDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  UpdateJobDtoWorkModeEnum.REMOTO: 'REMOTO',
};

const _$UpdateJobDtoSeniorityEnumEnumMap = {
  UpdateJobDtoSeniorityEnum.INTERN: 'INTERN',
  UpdateJobDtoSeniorityEnum.JUNIOR: 'JUNIOR',
  UpdateJobDtoSeniorityEnum.MID: 'MID',
  UpdateJobDtoSeniorityEnum.SENIOR: 'SENIOR',
  UpdateJobDtoSeniorityEnum.LEAD: 'LEAD',
  UpdateJobDtoSeniorityEnum.SPECIALIST: 'SPECIALIST',
};

const _$UpdateJobDtoContractTypeEnumEnumMap = {
  UpdateJobDtoContractTypeEnum.CLT: 'CLT',
  UpdateJobDtoContractTypeEnum.PJ: 'PJ',
  UpdateJobDtoContractTypeEnum.INTERNSHIP: 'INTERNSHIP',
  UpdateJobDtoContractTypeEnum.TEMPORARY: 'TEMPORARY',
  UpdateJobDtoContractTypeEnum.FREELANCE: 'FREELANCE',
};
