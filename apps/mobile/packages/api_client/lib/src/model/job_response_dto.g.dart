// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobResponseDtoCWProxy {
  JobResponseDto id(String id);

  JobResponseDto companyId(String companyId);

  JobResponseDto title(String title);

  JobResponseDto description(String description);

  JobResponseDto requirements(String requirements);

  JobResponseDto area(String area);

  JobResponseDto city(Object? city);

  JobResponseDto state(Object? state);

  JobResponseDto workMode(JobResponseDtoWorkModeEnum workMode);

  JobResponseDto salaryMin(int salaryMin);

  JobResponseDto salaryMax(int salaryMax);

  JobResponseDto benefits(List<String> benefits);

  JobResponseDto seniority(JobResponseDtoSeniorityEnum seniority);

  JobResponseDto contractType(JobResponseDtoContractTypeEnum contractType);

  JobResponseDto status(JobResponseDtoStatusEnum status);

  JobResponseDto responseDeadlineDays(int responseDeadlineDays);

  JobResponseDto publishedAt(DateTime? publishedAt);

  JobResponseDto closedAt(DateTime? closedAt);

  JobResponseDto createdAt(DateTime createdAt);

  JobResponseDto updatedAt(DateTime updatedAt);

  JobResponseDto jobSkills(List<JobSkillResponseDto> jobSkills);

  JobResponseDto company(CompanyJobSummaryResponseDto? company);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobResponseDto call({
    String id,
    String companyId,
    String title,
    String description,
    String requirements,
    String area,
    Object? city,
    Object? state,
    JobResponseDtoWorkModeEnum workMode,
    int salaryMin,
    int salaryMax,
    List<String> benefits,
    JobResponseDtoSeniorityEnum seniority,
    JobResponseDtoContractTypeEnum contractType,
    JobResponseDtoStatusEnum status,
    int responseDeadlineDays,
    DateTime? publishedAt,
    DateTime? closedAt,
    DateTime createdAt,
    DateTime updatedAt,
    List<JobSkillResponseDto> jobSkills,
    CompanyJobSummaryResponseDto? company,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobResponseDto.copyWith.fieldName(...)`
class _$JobResponseDtoCWProxyImpl implements _$JobResponseDtoCWProxy {
  const _$JobResponseDtoCWProxyImpl(this._value);

  final JobResponseDto _value;

  @override
  JobResponseDto id(String id) => this(id: id);

  @override
  JobResponseDto companyId(String companyId) => this(companyId: companyId);

  @override
  JobResponseDto title(String title) => this(title: title);

  @override
  JobResponseDto description(String description) =>
      this(description: description);

  @override
  JobResponseDto requirements(String requirements) =>
      this(requirements: requirements);

  @override
  JobResponseDto area(String area) => this(area: area);

  @override
  JobResponseDto city(Object? city) => this(city: city);

  @override
  JobResponseDto state(Object? state) => this(state: state);

  @override
  JobResponseDto workMode(JobResponseDtoWorkModeEnum workMode) =>
      this(workMode: workMode);

  @override
  JobResponseDto salaryMin(int salaryMin) => this(salaryMin: salaryMin);

  @override
  JobResponseDto salaryMax(int salaryMax) => this(salaryMax: salaryMax);

  @override
  JobResponseDto benefits(List<String> benefits) => this(benefits: benefits);

  @override
  JobResponseDto seniority(JobResponseDtoSeniorityEnum seniority) =>
      this(seniority: seniority);

  @override
  JobResponseDto contractType(JobResponseDtoContractTypeEnum contractType) =>
      this(contractType: contractType);

  @override
  JobResponseDto status(JobResponseDtoStatusEnum status) =>
      this(status: status);

  @override
  JobResponseDto responseDeadlineDays(int responseDeadlineDays) =>
      this(responseDeadlineDays: responseDeadlineDays);

  @override
  JobResponseDto publishedAt(DateTime? publishedAt) =>
      this(publishedAt: publishedAt);

  @override
  JobResponseDto closedAt(DateTime? closedAt) => this(closedAt: closedAt);

  @override
  JobResponseDto createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  JobResponseDto updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  JobResponseDto jobSkills(List<JobSkillResponseDto> jobSkills) =>
      this(jobSkills: jobSkills);

  @override
  JobResponseDto company(CompanyJobSummaryResponseDto? company) =>
      this(company: company);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? companyId = const $CopyWithPlaceholder(),
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
    Object? status = const $CopyWithPlaceholder(),
    Object? responseDeadlineDays = const $CopyWithPlaceholder(),
    Object? publishedAt = const $CopyWithPlaceholder(),
    Object? closedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? jobSkills = const $CopyWithPlaceholder(),
    Object? company = const $CopyWithPlaceholder(),
  }) {
    return JobResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      companyId: companyId == const $CopyWithPlaceholder()
          ? _value.companyId
          // ignore: cast_nullable_to_non_nullable
          : companyId as String,
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
          : city as Object?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as Object?,
      workMode: workMode == const $CopyWithPlaceholder()
          ? _value.workMode
          // ignore: cast_nullable_to_non_nullable
          : workMode as JobResponseDtoWorkModeEnum,
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
          : seniority as JobResponseDtoSeniorityEnum,
      contractType: contractType == const $CopyWithPlaceholder()
          ? _value.contractType
          // ignore: cast_nullable_to_non_nullable
          : contractType as JobResponseDtoContractTypeEnum,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as JobResponseDtoStatusEnum,
      responseDeadlineDays: responseDeadlineDays == const $CopyWithPlaceholder()
          ? _value.responseDeadlineDays
          // ignore: cast_nullable_to_non_nullable
          : responseDeadlineDays as int,
      publishedAt: publishedAt == const $CopyWithPlaceholder()
          ? _value.publishedAt
          // ignore: cast_nullable_to_non_nullable
          : publishedAt as DateTime?,
      closedAt: closedAt == const $CopyWithPlaceholder()
          ? _value.closedAt
          // ignore: cast_nullable_to_non_nullable
          : closedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      jobSkills: jobSkills == const $CopyWithPlaceholder()
          ? _value.jobSkills
          // ignore: cast_nullable_to_non_nullable
          : jobSkills as List<JobSkillResponseDto>,
      company: company == const $CopyWithPlaceholder()
          ? _value.company
          // ignore: cast_nullable_to_non_nullable
          : company as CompanyJobSummaryResponseDto?,
    );
  }
}

extension $JobResponseDtoCopyWith on JobResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobResponseDto.copyWith(...)` or like so:`instanceOfJobResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobResponseDtoCWProxy get copyWith => _$JobResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponseDto _$JobResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'companyId',
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
      'status',
      'responseDeadlineDays',
      'createdAt',
      'updatedAt',
      'jobSkills',
    ],
  );
  final val = JobResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    companyId: $checkedConvert('companyId', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String),
    requirements: $checkedConvert('requirements', (v) => v as String),
    area: $checkedConvert('area', (v) => v as String),
    city: $checkedConvert('city', (v) => v),
    state: $checkedConvert('state', (v) => v),
    workMode: $checkedConvert(
      'workMode',
      (v) => $enumDecode(_$JobResponseDtoWorkModeEnumEnumMap, v),
    ),
    salaryMin: $checkedConvert('salaryMin', (v) => (v as num).toInt()),
    salaryMax: $checkedConvert('salaryMax', (v) => (v as num).toInt()),
    benefits: $checkedConvert(
      'benefits',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    seniority: $checkedConvert(
      'seniority',
      (v) => $enumDecode(_$JobResponseDtoSeniorityEnumEnumMap, v),
    ),
    contractType: $checkedConvert(
      'contractType',
      (v) => $enumDecode(_$JobResponseDtoContractTypeEnumEnumMap, v),
    ),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$JobResponseDtoStatusEnumEnumMap, v),
    ),
    responseDeadlineDays: $checkedConvert(
      'responseDeadlineDays',
      (v) => (v as num).toInt(),
    ),
    publishedAt: $checkedConvert(
      'publishedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    closedAt: $checkedConvert(
      'closedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    jobSkills: $checkedConvert(
      'jobSkills',
      (v) => (v as List<dynamic>)
          .map((e) => JobSkillResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    company: $checkedConvert(
      'company',
      (v) => v == null
          ? null
          : CompanyJobSummaryResponseDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$JobResponseDtoToJson(JobResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'title': instance.title,
      'description': instance.description,
      'requirements': instance.requirements,
      'area': instance.area,
      'city': ?instance.city,
      'state': ?instance.state,
      'workMode': _$JobResponseDtoWorkModeEnumEnumMap[instance.workMode]!,
      'salaryMin': instance.salaryMin,
      'salaryMax': instance.salaryMax,
      'benefits': instance.benefits,
      'seniority': _$JobResponseDtoSeniorityEnumEnumMap[instance.seniority]!,
      'contractType':
          _$JobResponseDtoContractTypeEnumEnumMap[instance.contractType]!,
      'status': _$JobResponseDtoStatusEnumEnumMap[instance.status]!,
      'responseDeadlineDays': instance.responseDeadlineDays,
      'publishedAt': ?instance.publishedAt?.toIso8601String(),
      'closedAt': ?instance.closedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'jobSkills': instance.jobSkills.map((e) => e.toJson()).toList(),
      'company': ?instance.company?.toJson(),
    };

const _$JobResponseDtoWorkModeEnumEnumMap = {
  JobResponseDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  JobResponseDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  JobResponseDtoWorkModeEnum.REMOTO: 'REMOTO',
};

const _$JobResponseDtoSeniorityEnumEnumMap = {
  JobResponseDtoSeniorityEnum.INTERN: 'INTERN',
  JobResponseDtoSeniorityEnum.JUNIOR: 'JUNIOR',
  JobResponseDtoSeniorityEnum.MID: 'MID',
  JobResponseDtoSeniorityEnum.SENIOR: 'SENIOR',
  JobResponseDtoSeniorityEnum.LEAD: 'LEAD',
  JobResponseDtoSeniorityEnum.SPECIALIST: 'SPECIALIST',
};

const _$JobResponseDtoContractTypeEnumEnumMap = {
  JobResponseDtoContractTypeEnum.CLT: 'CLT',
  JobResponseDtoContractTypeEnum.PJ: 'PJ',
  JobResponseDtoContractTypeEnum.INTERNSHIP: 'INTERNSHIP',
  JobResponseDtoContractTypeEnum.TEMPORARY: 'TEMPORARY',
  JobResponseDtoContractTypeEnum.FREELANCE: 'FREELANCE',
};

const _$JobResponseDtoStatusEnumEnumMap = {
  JobResponseDtoStatusEnum.DRAFT: 'DRAFT',
  JobResponseDtoStatusEnum.ACTIVE: 'ACTIVE',
  JobResponseDtoStatusEnum.PAUSED: 'PAUSED',
  JobResponseDtoStatusEnum.CLOSED: 'CLOSED',
};
