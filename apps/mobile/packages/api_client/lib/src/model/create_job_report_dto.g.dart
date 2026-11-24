// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_report_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateJobReportDtoCWProxy {
  CreateJobReportDto reason(CreateJobReportDtoReasonEnum reason);

  CreateJobReportDto description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateJobReportDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateJobReportDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateJobReportDto call({
    CreateJobReportDtoReasonEnum reason,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateJobReportDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateJobReportDto.copyWith.fieldName(...)`
class _$CreateJobReportDtoCWProxyImpl implements _$CreateJobReportDtoCWProxy {
  const _$CreateJobReportDtoCWProxyImpl(this._value);

  final CreateJobReportDto _value;

  @override
  CreateJobReportDto reason(CreateJobReportDtoReasonEnum reason) =>
      this(reason: reason);

  @override
  CreateJobReportDto description(String? description) =>
      this(description: description);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateJobReportDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateJobReportDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateJobReportDto call({
    Object? reason = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return CreateJobReportDto(
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as CreateJobReportDtoReasonEnum,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $CreateJobReportDtoCopyWith on CreateJobReportDto {
  /// Returns a callable class that can be used as follows: `instanceOfCreateJobReportDto.copyWith(...)` or like so:`instanceOfCreateJobReportDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateJobReportDtoCWProxy get copyWith =>
      _$CreateJobReportDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateJobReportDto _$CreateJobReportDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateJobReportDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = CreateJobReportDto(
        reason: $checkedConvert(
          'reason',
          (v) => $enumDecode(_$CreateJobReportDtoReasonEnumEnumMap, v),
        ),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CreateJobReportDtoToJson(CreateJobReportDto instance) =>
    <String, dynamic>{
      'reason': _$CreateJobReportDtoReasonEnumEnumMap[instance.reason]!,
      'description': ?instance.description,
    };

const _$CreateJobReportDtoReasonEnumEnumMap = {
  CreateJobReportDtoReasonEnum.FAKE_JOB: 'FAKE_JOB',
  CreateJobReportDtoReasonEnum.MISLEADING_SALARY: 'MISLEADING_SALARY',
  CreateJobReportDtoReasonEnum.DISCRIMINATION: 'DISCRIMINATION',
  CreateJobReportDtoReasonEnum.HARASSMENT: 'HARASSMENT',
  CreateJobReportDtoReasonEnum.SPAM: 'SPAM',
  CreateJobReportDtoReasonEnum.OTHER: 'OTHER',
};
