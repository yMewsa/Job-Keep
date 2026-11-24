// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorResponseDtoCWProxy {
  ErrorResponseDto statusCode(num statusCode);

  ErrorResponseDto errorCode(String errorCode);

  ErrorResponseDto message(String message);

  ErrorResponseDto details(List<ErrorDetailDto>? details);

  ErrorResponseDto timestamp(String timestamp);

  ErrorResponseDto path(String path);

  ErrorResponseDto requestId(String requestId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorResponseDto call({
    num statusCode,
    String errorCode,
    String message,
    List<ErrorDetailDto>? details,
    String timestamp,
    String path,
    String requestId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorResponseDto.copyWith.fieldName(...)`
class _$ErrorResponseDtoCWProxyImpl implements _$ErrorResponseDtoCWProxy {
  const _$ErrorResponseDtoCWProxyImpl(this._value);

  final ErrorResponseDto _value;

  @override
  ErrorResponseDto statusCode(num statusCode) => this(statusCode: statusCode);

  @override
  ErrorResponseDto errorCode(String errorCode) => this(errorCode: errorCode);

  @override
  ErrorResponseDto message(String message) => this(message: message);

  @override
  ErrorResponseDto details(List<ErrorDetailDto>? details) =>
      this(details: details);

  @override
  ErrorResponseDto timestamp(String timestamp) => this(timestamp: timestamp);

  @override
  ErrorResponseDto path(String path) => this(path: path);

  @override
  ErrorResponseDto requestId(String requestId) => this(requestId: requestId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorResponseDto call({
    Object? statusCode = const $CopyWithPlaceholder(),
    Object? errorCode = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? requestId = const $CopyWithPlaceholder(),
  }) {
    return ErrorResponseDto(
      statusCode: statusCode == const $CopyWithPlaceholder()
          ? _value.statusCode
          // ignore: cast_nullable_to_non_nullable
          : statusCode as num,
      errorCode: errorCode == const $CopyWithPlaceholder()
          ? _value.errorCode
          // ignore: cast_nullable_to_non_nullable
          : errorCode as String,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as List<ErrorDetailDto>?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as String,
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String,
      requestId: requestId == const $CopyWithPlaceholder()
          ? _value.requestId
          // ignore: cast_nullable_to_non_nullable
          : requestId as String,
    );
  }
}

extension $ErrorResponseDtoCopyWith on ErrorResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfErrorResponseDto.copyWith(...)` or like so:`instanceOfErrorResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorResponseDtoCWProxy get copyWith => _$ErrorResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseDto _$ErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorResponseDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'statusCode',
          'errorCode',
          'message',
          'timestamp',
          'path',
          'requestId',
        ],
      );
      final val = ErrorResponseDto(
        statusCode: $checkedConvert('statusCode', (v) => v as num),
        errorCode: $checkedConvert('errorCode', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
        details: $checkedConvert(
          'details',
          (v) => (v as List<dynamic>?)
              ?.map((e) => ErrorDetailDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        timestamp: $checkedConvert('timestamp', (v) => v as String),
        path: $checkedConvert('path', (v) => v as String),
        requestId: $checkedConvert('requestId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ErrorResponseDtoToJson(ErrorResponseDto instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorCode': instance.errorCode,
      'message': instance.message,
      'details': ?instance.details?.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
      'path': instance.path,
      'requestId': instance.requestId,
    };
