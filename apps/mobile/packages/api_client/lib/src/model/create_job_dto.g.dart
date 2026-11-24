// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateJobDtoCWProxy {
  CreateJobDto title(String title);

  CreateJobDto description(String description);

  CreateJobDto requirements(String requirements);

  CreateJobDto area(String area);

  CreateJobDto city(String? city);

  CreateJobDto state(String? state);

  CreateJobDto workMode(CreateJobDtoWorkModeEnum workMode);

  CreateJobDto salaryMin(int salaryMin);

  CreateJobDto salaryMax(int salaryMax);

  CreateJobDto benefits(List<String> benefits);

  CreateJobDto seniority(CreateJobDtoSeniorityEnum seniority);

  CreateJobDto contractType(CreateJobDtoContractTypeEnum contractType);

  CreateJobDto responseDeadlineDays(int? responseDeadlineDays);

  CreateJobDto skills(List<JobSkillInputDto>? skills);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateJobDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateJobDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateJobDto call({
    String title,
    String description,
    String requirements,
    String area,
    String? city,
    String? state,
    CreateJobDtoWorkModeEnum workMode,
    int salaryMin,
    int salaryMax,
    List<String> benefits,
    CreateJobDtoSeniorityEnum seniority,
    CreateJobDtoContractTypeEnum contractType,
    int? responseDeadlineDays,
    List<JobSkillInputDto>? skills,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateJobDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateJobDto.copyWith.fieldName(...)`
class _$CreateJobDtoCWProxyImpl implements _$CreateJobDtoCWProxy {
  const _$CreateJobDtoCWProxyImpl(this._value);

  final CreateJobDto _value;

  @override
  CreateJobDto title(String title) => this(title: title);

  @override
  CreateJobDto description(String description) =>
      this(description: description);

  @override
  CreateJobDto requirements(String requirements) =>
      this(requirements: requirements);

  @override
  CreateJobDto area(String area) => this(area: area);

  @override
  CreateJobDto city(String? city) => this(city: city);

  @override
  CreateJobDto state(String? state) => this(state: state);

  @override
  CreateJobDto workMode(CreateJobDtoWorkModeEnum workMode) =>
      this(workMode: workMode);

  @override
  CreateJobDto salaryMin(int salaryMin) => this(salaryMin: salaryMin);

  @override
  CreateJobDto salaryMax(int salaryMax) => this(salaryMax: salaryMax);

  @override
  CreateJobDto benefits(List<String> benefits) => this(benefits: benefits);

  @override
  CreateJobDto seniority(CreateJobDtoSeniorityEnum seniority) =>
      this(seniority: seniority);

  @override
  CreateJobDto contractType(CreateJobDtoContractTypeEnum contractType) =>
      this(contractType: contractType);

  @override
  CreateJobDto responseDeadlineDays(int? responseDeadlineDays) =>
      this(responseDeadlineDays: responseDeadlineDays);

  @override
  CreateJobDto skills(List<JobSkillInputDto>? skills) => this(skills: skills);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateJobDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateJobDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateJobDto call({
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
    return CreateJobDto(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      requirements: requirements == const $CopyWithPlaceholder()
          ? _value.requirements
          // ignore: cast_nullable_to_non_nullable
          : requirements as String,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as String,
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
          : workMode as CreateJobDtoWorkModeEnum,
      salaryMin: salaryMin == const $CopyWithPlaceholder()
          ? _value.salaryMin
          // ignore: cast_nullable_to_non_nullable
          : salaryMin as int,
      salaryMax: salaryMax == const $CopyWithPlaceholder()
          ? _value.salaryMax
          // ignore: cast_nullable_to_non_nullable
          : salaryMax as int,
      benefits: benefits == const $CopyWithPlaceholder()
          ? _value.benefits
          // ignore: cast_nullable_to_non_nullable
          : benefits as List<String>,
      seniority: seniority == const $CopyWithPlaceholder()
          ? _value.seniority
          // ignore: cast_nullable_to_non_nullable
          : seniority as CreateJobDtoSeniorityEnum,
      contractType: contractType == const $CopyWithPlaceholder()
          ? _value.contractType
          // ignore: cast_nullable_to_non_nullable
          : contractType as CreateJobDtoContractTypeEnum,
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

extension $CreateJobDtoCopyWith on CreateJobDto {
  /// Returns a callable class that can be used as follows: `instanceOfCreateJobDto.copyWith(...)` or like so:`instanceOfCreateJobDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateJobDtoCWProxy get copyWith => _$CreateJobDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateJobDto _$CreateJobDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateJobDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'title',
          'description',
          'requirements',
          'area',
          'workMode',
          'salaryMin',
          'salaryMax',
          'benefits',
          'seniority',
          'contractType',
        ],
      );
      final val = CreateJobDto(
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        requirements: $checkedConvert('requirements', (v) => v as String),
        area: $checkedConvert('area', (v) => v as String),
        city: $checkedConvert('city', (v) => v as String?),
        state: $checkedConvert('state', (v) => v as String?),
        workMode: $checkedConvert(
          'workMode',
          (v) => $enumDecode(_$CreateJobDtoWorkModeEnumEnumMap, v),
        ),
        salaryMin: $checkedConvert('salaryMin', (v) => (v as num).toInt()),
        salaryMax: $checkedConvert('salaryMax', (v) => (v as num).toInt()),
        benefits: $checkedConvert(
          'benefits',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        seniority: $checkedConvert(
          'seniority',
          (v) => $enumDecode(_$CreateJobDtoSeniorityEnumEnumMap, v),
        ),
        contractType: $checkedConvert(
          'contractType',
          (v) => $enumDecode(_$CreateJobDtoContractTypeEnumEnumMap, v),
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

Map<String, dynamic> _$CreateJobDtoToJson(
  CreateJobDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'requirements': instance.requirements,
  'area': instance.area,
  'city': ?instance.city,
  'state': ?instance.state,
  'workMode': _$CreateJobDtoWorkModeEnumEnumMap[instance.workMode]!,
  'salaryMin': instance.salaryMin,
  'salaryMax': instance.salaryMax,
  'benefits': instance.benefits,
  'seniority': _$CreateJobDtoSeniorityEnumEnumMap[instance.seniority]!,
  'contractType': _$CreateJobDtoContractTypeEnumEnumMap[instance.contractType]!,
  'responseDeadlineDays': ?instance.responseDeadlineDays,
  'skills': ?instance.skills?.map((e) => e.toJson()).toList(),
};

const _$CreateJobDtoWorkModeEnumEnumMap = {
  CreateJobDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  CreateJobDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  CreateJobDtoWorkModeEnum.REMOTO: 'REMOTO',
};

const _$CreateJobDtoSeniorityEnumEnumMap = {
  CreateJobDtoSeniorityEnum.INTERN: 'INTERN',
  CreateJobDtoSeniorityEnum.JUNIOR: 'JUNIOR',
  CreateJobDtoSeniorityEnum.MID: 'MID',
  CreateJobDtoSeniorityEnum.SENIOR: 'SENIOR',
  CreateJobDtoSeniorityEnum.LEAD: 'LEAD',
  CreateJobDtoSeniorityEnum.SPECIALIST: 'SPECIALIST',
};

const _$CreateJobDtoContractTypeEnumEnumMap = {
  CreateJobDtoContractTypeEnum.CLT: 'CLT',
  CreateJobDtoContractTypeEnum.PJ: 'PJ',
  CreateJobDtoContractTypeEnum.INTERNSHIP: 'INTERNSHIP',
  CreateJobDtoContractTypeEnum.TEMPORARY: 'TEMPORARY',
  CreateJobDtoContractTypeEnum.FREELANCE: 'FREELANCE',
};
