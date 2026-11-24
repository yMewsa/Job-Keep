// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_education_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateEducationDtoCWProxy {
  UpdateEducationDto institution(String? institution);

  UpdateEducationDto degree(String? degree);

  UpdateEducationDto fieldOfStudy(String? fieldOfStudy);

  UpdateEducationDto status(UpdateEducationDtoStatusEnum? status);

  UpdateEducationDto startDate(String? startDate);

  UpdateEducationDto endDate(String? endDate);

  UpdateEducationDto isCurrent(bool? isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateEducationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateEducationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateEducationDto call({
    String? institution,
    String? degree,
    String? fieldOfStudy,
    UpdateEducationDtoStatusEnum? status,
    String? startDate,
    String? endDate,
    bool? isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateEducationDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateEducationDto.copyWith.fieldName(...)`
class _$UpdateEducationDtoCWProxyImpl implements _$UpdateEducationDtoCWProxy {
  const _$UpdateEducationDtoCWProxyImpl(this._value);

  final UpdateEducationDto _value;

  @override
  UpdateEducationDto institution(String? institution) =>
      this(institution: institution);

  @override
  UpdateEducationDto degree(String? degree) => this(degree: degree);

  @override
  UpdateEducationDto fieldOfStudy(String? fieldOfStudy) =>
      this(fieldOfStudy: fieldOfStudy);

  @override
  UpdateEducationDto status(UpdateEducationDtoStatusEnum? status) =>
      this(status: status);

  @override
  UpdateEducationDto startDate(String? startDate) => this(startDate: startDate);

  @override
  UpdateEducationDto endDate(String? endDate) => this(endDate: endDate);

  @override
  UpdateEducationDto isCurrent(bool? isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateEducationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateEducationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateEducationDto call({
    Object? institution = const $CopyWithPlaceholder(),
    Object? degree = const $CopyWithPlaceholder(),
    Object? fieldOfStudy = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return UpdateEducationDto(
      institution: institution == const $CopyWithPlaceholder()
          ? _value.institution
          // ignore: cast_nullable_to_non_nullable
          : institution as String?,
      degree: degree == const $CopyWithPlaceholder()
          ? _value.degree
          // ignore: cast_nullable_to_non_nullable
          : degree as String?,
      fieldOfStudy: fieldOfStudy == const $CopyWithPlaceholder()
          ? _value.fieldOfStudy
          // ignore: cast_nullable_to_non_nullable
          : fieldOfStudy as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as UpdateEducationDtoStatusEnum?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as String?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as String?,
      isCurrent: isCurrent == const $CopyWithPlaceholder()
          ? _value.isCurrent
          // ignore: cast_nullable_to_non_nullable
          : isCurrent as bool?,
    );
  }
}

extension $UpdateEducationDtoCopyWith on UpdateEducationDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateEducationDto.copyWith(...)` or like so:`instanceOfUpdateEducationDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateEducationDtoCWProxy get copyWith =>
      _$UpdateEducationDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEducationDto _$UpdateEducationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateEducationDto', json, ($checkedConvert) {
      final val = UpdateEducationDto(
        institution: $checkedConvert('institution', (v) => v as String?),
        degree: $checkedConvert('degree', (v) => v as String?),
        fieldOfStudy: $checkedConvert('fieldOfStudy', (v) => v as String?),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$UpdateEducationDtoStatusEnumEnumMap, v),
        ),
        startDate: $checkedConvert('startDate', (v) => v as String?),
        endDate: $checkedConvert('endDate', (v) => v as String?),
        isCurrent: $checkedConvert('isCurrent', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$UpdateEducationDtoToJson(UpdateEducationDto instance) =>
    <String, dynamic>{
      'institution': ?instance.institution,
      'degree': ?instance.degree,
      'fieldOfStudy': ?instance.fieldOfStudy,
      'status': ?_$UpdateEducationDtoStatusEnumEnumMap[instance.status],
      'startDate': ?instance.startDate,
      'endDate': ?instance.endDate,
      'isCurrent': ?instance.isCurrent,
    };

const _$UpdateEducationDtoStatusEnumEnumMap = {
  UpdateEducationDtoStatusEnum.IN_PROGRESS: 'IN_PROGRESS',
  UpdateEducationDtoStatusEnum.COMPLETED: 'COMPLETED',
  UpdateEducationDtoStatusEnum.PAUSED: 'PAUSED',
};
