// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_moderation_queue_item_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobModerationQueueItemResponseDtoCWProxy {
  JobModerationQueueItemResponseDto id(String id);

  JobModerationQueueItemResponseDto companyId(String companyId);

  JobModerationQueueItemResponseDto title(String title);

  JobModerationQueueItemResponseDto description(String description);

  JobModerationQueueItemResponseDto requirements(String requirements);

  JobModerationQueueItemResponseDto area(String area);

  JobModerationQueueItemResponseDto city(Object? city);

  JobModerationQueueItemResponseDto state(Object? state);

  JobModerationQueueItemResponseDto workMode(
    JobModerationQueueItemResponseDtoWorkModeEnum workMode,
  );

  JobModerationQueueItemResponseDto salaryMin(int salaryMin);

  JobModerationQueueItemResponseDto salaryMax(int salaryMax);

  JobModerationQueueItemResponseDto benefits(List<String> benefits);

  JobModerationQueueItemResponseDto seniority(
    JobModerationQueueItemResponseDtoSeniorityEnum seniority,
  );

  JobModerationQueueItemResponseDto contractType(
    JobModerationQueueItemResponseDtoContractTypeEnum contractType,
  );

  JobModerationQueueItemResponseDto status(
    JobModerationQueueItemResponseDtoStatusEnum status,
  );

  JobModerationQueueItemResponseDto responseDeadlineDays(
    int responseDeadlineDays,
  );

  JobModerationQueueItemResponseDto publishedAt(DateTime? publishedAt);

  JobModerationQueueItemResponseDto closedAt(DateTime? closedAt);

  JobModerationQueueItemResponseDto createdAt(DateTime createdAt);

  JobModerationQueueItemResponseDto updatedAt(DateTime updatedAt);

  JobModerationQueueItemResponseDto jobSkills(
    List<JobSkillResponseDto> jobSkills,
  );

  JobModerationQueueItemResponseDto company(
    CompanyJobSummaryResponseDto? company,
  );

  JobModerationQueueItemResponseDto isSuspicious(bool isSuspicious);

  JobModerationQueueItemResponseDto suspiciousReasons(
    List<String> suspiciousReasons,
  );

  JobModerationQueueItemResponseDto reports(List<JobReportResponseDto> reports);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobModerationQueueItemResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobModerationQueueItemResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobModerationQueueItemResponseDto call({
    String id,
    String companyId,
    String title,
    String description,
    String requirements,
    String area,
    Object? city,
    Object? state,
    JobModerationQueueItemResponseDtoWorkModeEnum workMode,
    int salaryMin,
    int salaryMax,
    List<String> benefits,
    JobModerationQueueItemResponseDtoSeniorityEnum seniority,
    JobModerationQueueItemResponseDtoContractTypeEnum contractType,
    JobModerationQueueItemResponseDtoStatusEnum status,
    int responseDeadlineDays,
    DateTime? publishedAt,
    DateTime? closedAt,
    DateTime createdAt,
    DateTime updatedAt,
    List<JobSkillResponseDto> jobSkills,
    CompanyJobSummaryResponseDto? company,
    bool isSuspicious,
    List<String> suspiciousReasons,
    List<JobReportResponseDto> reports,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobModerationQueueItemResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobModerationQueueItemResponseDto.copyWith.fieldName(...)`
class _$JobModerationQueueItemResponseDtoCWProxyImpl
    implements _$JobModerationQueueItemResponseDtoCWProxy {
  const _$JobModerationQueueItemResponseDtoCWProxyImpl(this._value);

  final JobModerationQueueItemResponseDto _value;

  @override
  JobModerationQueueItemResponseDto id(String id) => this(id: id);

  @override
  JobModerationQueueItemResponseDto companyId(String companyId) =>
      this(companyId: companyId);

  @override
  JobModerationQueueItemResponseDto title(String title) => this(title: title);

  @override
  JobModerationQueueItemResponseDto description(String description) =>
      this(description: description);

  @override
  JobModerationQueueItemResponseDto requirements(String requirements) =>
      this(requirements: requirements);

  @override
  JobModerationQueueItemResponseDto area(String area) => this(area: area);

  @override
  JobModerationQueueItemResponseDto city(Object? city) => this(city: city);

  @override
  JobModerationQueueItemResponseDto state(Object? state) => this(state: state);

  @override
  JobModerationQueueItemResponseDto workMode(
    JobModerationQueueItemResponseDtoWorkModeEnum workMode,
  ) => this(workMode: workMode);

  @override
  JobModerationQueueItemResponseDto salaryMin(int salaryMin) =>
      this(salaryMin: salaryMin);

  @override
  JobModerationQueueItemResponseDto salaryMax(int salaryMax) =>
      this(salaryMax: salaryMax);

  @override
  JobModerationQueueItemResponseDto benefits(List<String> benefits) =>
      this(benefits: benefits);

  @override
  JobModerationQueueItemResponseDto seniority(
    JobModerationQueueItemResponseDtoSeniorityEnum seniority,
  ) => this(seniority: seniority);

  @override
  JobModerationQueueItemResponseDto contractType(
    JobModerationQueueItemResponseDtoContractTypeEnum contractType,
  ) => this(contractType: contractType);

  @override
  JobModerationQueueItemResponseDto status(
    JobModerationQueueItemResponseDtoStatusEnum status,
  ) => this(status: status);

  @override
  JobModerationQueueItemResponseDto responseDeadlineDays(
    int responseDeadlineDays,
  ) => this(responseDeadlineDays: responseDeadlineDays);

  @override
  JobModerationQueueItemResponseDto publishedAt(DateTime? publishedAt) =>
      this(publishedAt: publishedAt);

  @override
  JobModerationQueueItemResponseDto closedAt(DateTime? closedAt) =>
      this(closedAt: closedAt);

  @override
  JobModerationQueueItemResponseDto createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  JobModerationQueueItemResponseDto updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  JobModerationQueueItemResponseDto jobSkills(
    List<JobSkillResponseDto> jobSkills,
  ) => this(jobSkills: jobSkills);

  @override
  JobModerationQueueItemResponseDto company(
    CompanyJobSummaryResponseDto? company,
  ) => this(company: company);

  @override
  JobModerationQueueItemResponseDto isSuspicious(bool isSuspicious) =>
      this(isSuspicious: isSuspicious);

  @override
  JobModerationQueueItemResponseDto suspiciousReasons(
    List<String> suspiciousReasons,
  ) => this(suspiciousReasons: suspiciousReasons);

  @override
  JobModerationQueueItemResponseDto reports(
    List<JobReportResponseDto> reports,
  ) => this(reports: reports);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobModerationQueueItemResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobModerationQueueItemResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobModerationQueueItemResponseDto call({
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
    Object? isSuspicious = const $CopyWithPlaceholder(),
    Object? suspiciousReasons = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
  }) {
    return JobModerationQueueItemResponseDto(
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
          : workMode as JobModerationQueueItemResponseDtoWorkModeEnum,
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
          : seniority as JobModerationQueueItemResponseDtoSeniorityEnum,
      contractType: contractType == const $CopyWithPlaceholder()
          ? _value.contractType
          // ignore: cast_nullable_to_non_nullable
          : contractType as JobModerationQueueItemResponseDtoContractTypeEnum,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as JobModerationQueueItemResponseDtoStatusEnum,
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
      isSuspicious: isSuspicious == const $CopyWithPlaceholder()
          ? _value.isSuspicious
          // ignore: cast_nullable_to_non_nullable
          : isSuspicious as bool,
      suspiciousReasons: suspiciousReasons == const $CopyWithPlaceholder()
          ? _value.suspiciousReasons
          // ignore: cast_nullable_to_non_nullable
          : suspiciousReasons as List<String>,
      reports: reports == const $CopyWithPlaceholder()
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<JobReportResponseDto>,
    );
  }
}

extension $JobModerationQueueItemResponseDtoCopyWith
    on JobModerationQueueItemResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobModerationQueueItemResponseDto.copyWith(...)` or like so:`instanceOfJobModerationQueueItemResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobModerationQueueItemResponseDtoCWProxy get copyWith =>
      _$JobModerationQueueItemResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModerationQueueItemResponseDto _$JobModerationQueueItemResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobModerationQueueItemResponseDto', json, (
  $checkedConvert,
) {
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
      'isSuspicious',
      'suspiciousReasons',
      'reports',
    ],
  );
  final val = JobModerationQueueItemResponseDto(
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
      (v) => $enumDecode(
        _$JobModerationQueueItemResponseDtoWorkModeEnumEnumMap,
        v,
      ),
    ),
    salaryMin: $checkedConvert('salaryMin', (v) => (v as num).toInt()),
    salaryMax: $checkedConvert('salaryMax', (v) => (v as num).toInt()),
    benefits: $checkedConvert(
      'benefits',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    seniority: $checkedConvert(
      'seniority',
      (v) => $enumDecode(
        _$JobModerationQueueItemResponseDtoSeniorityEnumEnumMap,
        v,
      ),
    ),
    contractType: $checkedConvert(
      'contractType',
      (v) => $enumDecode(
        _$JobModerationQueueItemResponseDtoContractTypeEnumEnumMap,
        v,
      ),
    ),
    status: $checkedConvert(
      'status',
      (v) =>
          $enumDecode(_$JobModerationQueueItemResponseDtoStatusEnumEnumMap, v),
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
    isSuspicious: $checkedConvert('isSuspicious', (v) => v as bool),
    suspiciousReasons: $checkedConvert(
      'suspiciousReasons',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    reports: $checkedConvert(
      'reports',
      (v) => (v as List<dynamic>)
          .map((e) => JobReportResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$JobModerationQueueItemResponseDtoToJson(
  JobModerationQueueItemResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'companyId': instance.companyId,
  'title': instance.title,
  'description': instance.description,
  'requirements': instance.requirements,
  'area': instance.area,
  'city': ?instance.city,
  'state': ?instance.state,
  'workMode':
      _$JobModerationQueueItemResponseDtoWorkModeEnumEnumMap[instance
          .workMode]!,
  'salaryMin': instance.salaryMin,
  'salaryMax': instance.salaryMax,
  'benefits': instance.benefits,
  'seniority':
      _$JobModerationQueueItemResponseDtoSeniorityEnumEnumMap[instance
          .seniority]!,
  'contractType':
      _$JobModerationQueueItemResponseDtoContractTypeEnumEnumMap[instance
          .contractType]!,
  'status':
      _$JobModerationQueueItemResponseDtoStatusEnumEnumMap[instance.status]!,
  'responseDeadlineDays': instance.responseDeadlineDays,
  'publishedAt': ?instance.publishedAt?.toIso8601String(),
  'closedAt': ?instance.closedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'jobSkills': instance.jobSkills.map((e) => e.toJson()).toList(),
  'company': ?instance.company?.toJson(),
  'isSuspicious': instance.isSuspicious,
  'suspiciousReasons': instance.suspiciousReasons,
  'reports': instance.reports.map((e) => e.toJson()).toList(),
};

const _$JobModerationQueueItemResponseDtoWorkModeEnumEnumMap = {
  JobModerationQueueItemResponseDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  JobModerationQueueItemResponseDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  JobModerationQueueItemResponseDtoWorkModeEnum.REMOTO: 'REMOTO',
};

const _$JobModerationQueueItemResponseDtoSeniorityEnumEnumMap = {
  JobModerationQueueItemResponseDtoSeniorityEnum.INTERN: 'INTERN',
  JobModerationQueueItemResponseDtoSeniorityEnum.JUNIOR: 'JUNIOR',
  JobModerationQueueItemResponseDtoSeniorityEnum.MID: 'MID',
  JobModerationQueueItemResponseDtoSeniorityEnum.SENIOR: 'SENIOR',
  JobModerationQueueItemResponseDtoSeniorityEnum.LEAD: 'LEAD',
  JobModerationQueueItemResponseDtoSeniorityEnum.SPECIALIST: 'SPECIALIST',
};

const _$JobModerationQueueItemResponseDtoContractTypeEnumEnumMap = {
  JobModerationQueueItemResponseDtoContractTypeEnum.CLT: 'CLT',
  JobModerationQueueItemResponseDtoContractTypeEnum.PJ: 'PJ',
  JobModerationQueueItemResponseDtoContractTypeEnum.INTERNSHIP: 'INTERNSHIP',
  JobModerationQueueItemResponseDtoContractTypeEnum.TEMPORARY: 'TEMPORARY',
  JobModerationQueueItemResponseDtoContractTypeEnum.FREELANCE: 'FREELANCE',
};

const _$JobModerationQueueItemResponseDtoStatusEnumEnumMap = {
  JobModerationQueueItemResponseDtoStatusEnum.DRAFT: 'DRAFT',
  JobModerationQueueItemResponseDtoStatusEnum.ACTIVE: 'ACTIVE',
  JobModerationQueueItemResponseDtoStatusEnum.PAUSED: 'PAUSED',
  JobModerationQueueItemResponseDtoStatusEnum.CLOSED: 'CLOSED',
};
