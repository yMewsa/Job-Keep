// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_job_status_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChangeJobStatusDtoCWProxy {
  ChangeJobStatusDto status(ChangeJobStatusDtoStatusEnum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangeJobStatusDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangeJobStatusDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangeJobStatusDto call({ChangeJobStatusDtoStatusEnum status});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChangeJobStatusDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChangeJobStatusDto.copyWith.fieldName(...)`
class _$ChangeJobStatusDtoCWProxyImpl implements _$ChangeJobStatusDtoCWProxy {
  const _$ChangeJobStatusDtoCWProxyImpl(this._value);

  final ChangeJobStatusDto _value;

  @override
  ChangeJobStatusDto status(ChangeJobStatusDtoStatusEnum status) =>
      this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangeJobStatusDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangeJobStatusDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangeJobStatusDto call({Object? status = const $CopyWithPlaceholder()}) {
    return ChangeJobStatusDto(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ChangeJobStatusDtoStatusEnum,
    );
  }
}

extension $ChangeJobStatusDtoCopyWith on ChangeJobStatusDto {
  /// Returns a callable class that can be used as follows: `instanceOfChangeJobStatusDto.copyWith(...)` or like so:`instanceOfChangeJobStatusDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangeJobStatusDtoCWProxy get copyWith =>
      _$ChangeJobStatusDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeJobStatusDto _$ChangeJobStatusDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChangeJobStatusDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = ChangeJobStatusDto(
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$ChangeJobStatusDtoStatusEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChangeJobStatusDtoToJson(ChangeJobStatusDto instance) =>
    <String, dynamic>{
      'status': _$ChangeJobStatusDtoStatusEnumEnumMap[instance.status]!,
    };

const _$ChangeJobStatusDtoStatusEnumEnumMap = {
  ChangeJobStatusDtoStatusEnum.DRAFT: 'DRAFT',
  ChangeJobStatusDtoStatusEnum.ACTIVE: 'ACTIVE',
  ChangeJobStatusDtoStatusEnum.PAUSED: 'PAUSED',
  ChangeJobStatusDtoStatusEnum.CLOSED: 'CLOSED',
};
