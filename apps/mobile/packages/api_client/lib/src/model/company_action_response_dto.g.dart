// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_action_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyActionResponseDtoCWProxy {
  CompanyActionResponseDto message(String message);

  CompanyActionResponseDto closedJobsCount(int? closedJobsCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyActionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyActionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyActionResponseDto call({String message, int? closedJobsCount});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyActionResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyActionResponseDto.copyWith.fieldName(...)`
class _$CompanyActionResponseDtoCWProxyImpl
    implements _$CompanyActionResponseDtoCWProxy {
  const _$CompanyActionResponseDtoCWProxyImpl(this._value);

  final CompanyActionResponseDto _value;

  @override
  CompanyActionResponseDto message(String message) => this(message: message);

  @override
  CompanyActionResponseDto closedJobsCount(int? closedJobsCount) =>
      this(closedJobsCount: closedJobsCount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyActionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyActionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyActionResponseDto call({
    Object? message = const $CopyWithPlaceholder(),
    Object? closedJobsCount = const $CopyWithPlaceholder(),
  }) {
    return CompanyActionResponseDto(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      closedJobsCount: closedJobsCount == const $CopyWithPlaceholder()
          ? _value.closedJobsCount
          // ignore: cast_nullable_to_non_nullable
          : closedJobsCount as int?,
    );
  }
}

extension $CompanyActionResponseDtoCopyWith on CompanyActionResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyActionResponseDto.copyWith(...)` or like so:`instanceOfCompanyActionResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyActionResponseDtoCWProxy get copyWith =>
      _$CompanyActionResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyActionResponseDto _$CompanyActionResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompanyActionResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['message']);
  final val = CompanyActionResponseDto(
    message: $checkedConvert('message', (v) => v as String),
    closedJobsCount: $checkedConvert(
      'closedJobsCount',
      (v) => (v as num?)?.toInt(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyActionResponseDtoToJson(
  CompanyActionResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'closedJobsCount': ?instance.closedJobsCount,
};
