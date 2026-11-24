// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_deletion_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobDeletionResponseDtoCWProxy {
  JobDeletionResponseDto message(String message);

  JobDeletionResponseDto status(JobDeletionResponseDtoStatusEnum status);

  JobDeletionResponseDto deletedAt(DateTime? deletedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobDeletionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobDeletionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobDeletionResponseDto call({
    String message,
    JobDeletionResponseDtoStatusEnum status,
    DateTime? deletedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobDeletionResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobDeletionResponseDto.copyWith.fieldName(...)`
class _$JobDeletionResponseDtoCWProxyImpl
    implements _$JobDeletionResponseDtoCWProxy {
  const _$JobDeletionResponseDtoCWProxyImpl(this._value);

  final JobDeletionResponseDto _value;

  @override
  JobDeletionResponseDto message(String message) => this(message: message);

  @override
  JobDeletionResponseDto status(JobDeletionResponseDtoStatusEnum status) =>
      this(status: status);

  @override
  JobDeletionResponseDto deletedAt(DateTime? deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobDeletionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobDeletionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobDeletionResponseDto call({
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
  }) {
    return JobDeletionResponseDto(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as JobDeletionResponseDtoStatusEnum,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
    );
  }
}

extension $JobDeletionResponseDtoCopyWith on JobDeletionResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobDeletionResponseDto.copyWith(...)` or like so:`instanceOfJobDeletionResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobDeletionResponseDtoCWProxy get copyWith =>
      _$JobDeletionResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDeletionResponseDto _$JobDeletionResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobDeletionResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['message', 'status']);
  final val = JobDeletionResponseDto(
    message: $checkedConvert('message', (v) => v as String),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$JobDeletionResponseDtoStatusEnumEnumMap, v),
    ),
    deletedAt: $checkedConvert(
      'deletedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$JobDeletionResponseDtoToJson(
  JobDeletionResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': _$JobDeletionResponseDtoStatusEnumEnumMap[instance.status]!,
  'deletedAt': ?instance.deletedAt?.toIso8601String(),
};

const _$JobDeletionResponseDtoStatusEnumEnumMap = {
  JobDeletionResponseDtoStatusEnum.DRAFT: 'DRAFT',
  JobDeletionResponseDtoStatusEnum.ACTIVE: 'ACTIVE',
  JobDeletionResponseDtoStatusEnum.PAUSED: 'PAUSED',
  JobDeletionResponseDtoStatusEnum.CLOSED: 'CLOSED',
};
