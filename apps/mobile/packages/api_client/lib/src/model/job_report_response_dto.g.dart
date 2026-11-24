// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_report_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobReportResponseDtoCWProxy {
  JobReportResponseDto id(String id);

  JobReportResponseDto reason(JobReportResponseDtoReasonEnum reason);

  JobReportResponseDto description(Object? description);

  JobReportResponseDto status(JobReportResponseDtoStatusEnum status);

  JobReportResponseDto createdAt(DateTime createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobReportResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobReportResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobReportResponseDto call({
    String id,
    JobReportResponseDtoReasonEnum reason,
    Object? description,
    JobReportResponseDtoStatusEnum status,
    DateTime createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobReportResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobReportResponseDto.copyWith.fieldName(...)`
class _$JobReportResponseDtoCWProxyImpl
    implements _$JobReportResponseDtoCWProxy {
  const _$JobReportResponseDtoCWProxyImpl(this._value);

  final JobReportResponseDto _value;

  @override
  JobReportResponseDto id(String id) => this(id: id);

  @override
  JobReportResponseDto reason(JobReportResponseDtoReasonEnum reason) =>
      this(reason: reason);

  @override
  JobReportResponseDto description(Object? description) =>
      this(description: description);

  @override
  JobReportResponseDto status(JobReportResponseDtoStatusEnum status) =>
      this(status: status);

  @override
  JobReportResponseDto createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobReportResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobReportResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobReportResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return JobReportResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as JobReportResponseDtoReasonEnum,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as Object?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as JobReportResponseDtoStatusEnum,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $JobReportResponseDtoCopyWith on JobReportResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobReportResponseDto.copyWith(...)` or like so:`instanceOfJobReportResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobReportResponseDtoCWProxy get copyWith =>
      _$JobReportResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobReportResponseDto _$JobReportResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobReportResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'reason', 'status', 'createdAt']);
  final val = JobReportResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    reason: $checkedConvert(
      'reason',
      (v) => $enumDecode(_$JobReportResponseDtoReasonEnumEnumMap, v),
    ),
    description: $checkedConvert('description', (v) => v),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$JobReportResponseDtoStatusEnumEnumMap, v),
    ),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
  );
  return val;
});

Map<String, dynamic> _$JobReportResponseDtoToJson(
  JobReportResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'reason': _$JobReportResponseDtoReasonEnumEnumMap[instance.reason]!,
  'description': ?instance.description,
  'status': _$JobReportResponseDtoStatusEnumEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$JobReportResponseDtoReasonEnumEnumMap = {
  JobReportResponseDtoReasonEnum.FAKE_JOB: 'FAKE_JOB',
  JobReportResponseDtoReasonEnum.MISLEADING_SALARY: 'MISLEADING_SALARY',
  JobReportResponseDtoReasonEnum.DISCRIMINATION: 'DISCRIMINATION',
  JobReportResponseDtoReasonEnum.HARASSMENT: 'HARASSMENT',
  JobReportResponseDtoReasonEnum.SPAM: 'SPAM',
  JobReportResponseDtoReasonEnum.OTHER: 'OTHER',
};

const _$JobReportResponseDtoStatusEnumEnumMap = {
  JobReportResponseDtoStatusEnum.OPEN: 'OPEN',
  JobReportResponseDtoStatusEnum.UNDER_REVIEW: 'UNDER_REVIEW',
  JobReportResponseDtoStatusEnum.RESOLVED: 'RESOLVED',
  JobReportResponseDtoStatusEnum.DISMISSED: 'DISMISSED',
};
