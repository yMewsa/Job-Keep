// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_education_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateEducationDtoCWProxy {
  CreateEducationDto institution(String institution);

  CreateEducationDto degree(String degree);

  CreateEducationDto fieldOfStudy(String fieldOfStudy);

  CreateEducationDto status(CreateEducationDtoStatusEnum status);

  CreateEducationDto startDate(String startDate);

  CreateEducationDto endDate(String? endDate);

  CreateEducationDto isCurrent(bool isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateEducationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateEducationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateEducationDto call({
    String institution,
    String degree,
    String fieldOfStudy,
    CreateEducationDtoStatusEnum status,
    String startDate,
    String? endDate,
    bool isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateEducationDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateEducationDto.copyWith.fieldName(...)`
class _$CreateEducationDtoCWProxyImpl implements _$CreateEducationDtoCWProxy {
  const _$CreateEducationDtoCWProxyImpl(this._value);

  final CreateEducationDto _value;

  @override
  CreateEducationDto institution(String institution) =>
      this(institution: institution);

  @override
  CreateEducationDto degree(String degree) => this(degree: degree);

  @override
  CreateEducationDto fieldOfStudy(String fieldOfStudy) =>
      this(fieldOfStudy: fieldOfStudy);

  @override
  CreateEducationDto status(CreateEducationDtoStatusEnum status) =>
      this(status: status);

  @override
  CreateEducationDto startDate(String startDate) => this(startDate: startDate);

  @override
  CreateEducationDto endDate(String? endDate) => this(endDate: endDate);

  @override
  CreateEducationDto isCurrent(bool isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateEducationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateEducationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateEducationDto call({
    Object? institution = const $CopyWithPlaceholder(),
    Object? degree = const $CopyWithPlaceholder(),
    Object? fieldOfStudy = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return CreateEducationDto(
      institution: institution == const $CopyWithPlaceholder()
          ? _value.institution
          // ignore: cast_nullable_to_non_nullable
          : institution as String,
      degree: degree == const $CopyWithPlaceholder()
          ? _value.degree
          // ignore: cast_nullable_to_non_nullable
          : degree as String,
      fieldOfStudy: fieldOfStudy == const $CopyWithPlaceholder()
          ? _value.fieldOfStudy
          // ignore: cast_nullable_to_non_nullable
          : fieldOfStudy as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CreateEducationDtoStatusEnum,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as String,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as String?,
      isCurrent: isCurrent == const $CopyWithPlaceholder()
          ? _value.isCurrent
          // ignore: cast_nullable_to_non_nullable
          : isCurrent as bool,
    );
  }
}

extension $CreateEducationDtoCopyWith on CreateEducationDto {
  /// Returns a callable class that can be used as follows: `instanceOfCreateEducationDto.copyWith(...)` or like so:`instanceOfCreateEducationDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateEducationDtoCWProxy get copyWith =>
      _$CreateEducationDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEducationDto _$CreateEducationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateEducationDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'institution',
          'degree',
          'fieldOfStudy',
          'status',
          'startDate',
          'isCurrent',
        ],
      );
      final val = CreateEducationDto(
        institution: $checkedConvert('institution', (v) => v as String),
        degree: $checkedConvert('degree', (v) => v as String),
        fieldOfStudy: $checkedConvert('fieldOfStudy', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$CreateEducationDtoStatusEnumEnumMap, v),
        ),
        startDate: $checkedConvert('startDate', (v) => v as String),
        endDate: $checkedConvert('endDate', (v) => v as String?),
        isCurrent: $checkedConvert('isCurrent', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$CreateEducationDtoToJson(CreateEducationDto instance) =>
    <String, dynamic>{
      'institution': instance.institution,
      'degree': instance.degree,
      'fieldOfStudy': instance.fieldOfStudy,
      'status': _$CreateEducationDtoStatusEnumEnumMap[instance.status]!,
      'startDate': instance.startDate,
      'endDate': ?instance.endDate,
      'isCurrent': instance.isCurrent,
    };

const _$CreateEducationDtoStatusEnumEnumMap = {
  CreateEducationDtoStatusEnum.IN_PROGRESS: 'IN_PROGRESS',
  CreateEducationDtoStatusEnum.COMPLETED: 'COMPLETED',
  CreateEducationDtoStatusEnum.PAUSED: 'PAUSED',
};
