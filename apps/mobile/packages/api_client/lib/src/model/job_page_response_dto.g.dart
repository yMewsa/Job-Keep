// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_page_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobPageResponseDtoCWProxy {
  JobPageResponseDto items(List<JobResponseDto> items);

  JobPageResponseDto total(int total);

  JobPageResponseDto page(int page);

  JobPageResponseDto limit(int limit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobPageResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobPageResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobPageResponseDto call({
    List<JobResponseDto> items,
    int total,
    int page,
    int limit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobPageResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobPageResponseDto.copyWith.fieldName(...)`
class _$JobPageResponseDtoCWProxyImpl implements _$JobPageResponseDtoCWProxy {
  const _$JobPageResponseDtoCWProxyImpl(this._value);

  final JobPageResponseDto _value;

  @override
  JobPageResponseDto items(List<JobResponseDto> items) => this(items: items);

  @override
  JobPageResponseDto total(int total) => this(total: total);

  @override
  JobPageResponseDto page(int page) => this(page: page);

  @override
  JobPageResponseDto limit(int limit) => this(limit: limit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobPageResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobPageResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobPageResponseDto call({
    Object? items = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? limit = const $CopyWithPlaceholder(),
  }) {
    return JobPageResponseDto(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<JobResponseDto>,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      limit: limit == const $CopyWithPlaceholder()
          ? _value.limit
          // ignore: cast_nullable_to_non_nullable
          : limit as int,
    );
  }
}

extension $JobPageResponseDtoCopyWith on JobPageResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobPageResponseDto.copyWith(...)` or like so:`instanceOfJobPageResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobPageResponseDtoCWProxy get copyWith =>
      _$JobPageResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPageResponseDto _$JobPageResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JobPageResponseDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'total', 'page', 'limit']);
      final val = JobPageResponseDto(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => JobResponseDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$JobPageResponseDtoToJson(JobPageResponseDto instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
