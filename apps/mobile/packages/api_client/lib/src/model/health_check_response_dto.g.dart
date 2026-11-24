// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_check_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HealthCheckResponseDtoCWProxy {
  HealthCheckResponseDto status(String status);

  HealthCheckResponseDto service(String service);

  HealthCheckResponseDto timestamp(String timestamp);

  HealthCheckResponseDto checks(Object checks);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HealthCheckResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HealthCheckResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  HealthCheckResponseDto call({
    String status,
    String service,
    String timestamp,
    Object checks,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHealthCheckResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHealthCheckResponseDto.copyWith.fieldName(...)`
class _$HealthCheckResponseDtoCWProxyImpl
    implements _$HealthCheckResponseDtoCWProxy {
  const _$HealthCheckResponseDtoCWProxyImpl(this._value);

  final HealthCheckResponseDto _value;

  @override
  HealthCheckResponseDto status(String status) => this(status: status);

  @override
  HealthCheckResponseDto service(String service) => this(service: service);

  @override
  HealthCheckResponseDto timestamp(String timestamp) =>
      this(timestamp: timestamp);

  @override
  HealthCheckResponseDto checks(Object checks) => this(checks: checks);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HealthCheckResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HealthCheckResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  HealthCheckResponseDto call({
    Object? status = const $CopyWithPlaceholder(),
    Object? service = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? checks = const $CopyWithPlaceholder(),
  }) {
    return HealthCheckResponseDto(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      service: service == const $CopyWithPlaceholder()
          ? _value.service
          // ignore: cast_nullable_to_non_nullable
          : service as String,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as String,
      checks: checks == const $CopyWithPlaceholder()
          ? _value.checks
          // ignore: cast_nullable_to_non_nullable
          : checks as Object,
    );
  }
}

extension $HealthCheckResponseDtoCopyWith on HealthCheckResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfHealthCheckResponseDto.copyWith(...)` or like so:`instanceOfHealthCheckResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HealthCheckResponseDtoCWProxy get copyWith =>
      _$HealthCheckResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthCheckResponseDto _$HealthCheckResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('HealthCheckResponseDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['status', 'service', 'timestamp', 'checks'],
  );
  final val = HealthCheckResponseDto(
    status: $checkedConvert('status', (v) => v as String),
    service: $checkedConvert('service', (v) => v as String),
    timestamp: $checkedConvert('timestamp', (v) => v as String),
    checks: $checkedConvert('checks', (v) => v as Object),
  );
  return val;
});

Map<String, dynamic> _$HealthCheckResponseDtoToJson(
  HealthCheckResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'service': instance.service,
  'timestamp': instance.timestamp,
  'checks': instance.checks,
};
