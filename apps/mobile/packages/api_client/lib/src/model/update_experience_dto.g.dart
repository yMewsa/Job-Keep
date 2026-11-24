// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_experience_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateExperienceDtoCWProxy {
  UpdateExperienceDto companyName(String? companyName);

  UpdateExperienceDto title(String? title);

  UpdateExperienceDto description(String? description);

  UpdateExperienceDto workMode(UpdateExperienceDtoWorkModeEnum? workMode);

  UpdateExperienceDto location(String? location);

  UpdateExperienceDto startDate(String? startDate);

  UpdateExperienceDto endDate(String? endDate);

  UpdateExperienceDto isCurrent(bool? isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateExperienceDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateExperienceDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateExperienceDto call({
    String? companyName,
    String? title,
    String? description,
    UpdateExperienceDtoWorkModeEnum? workMode,
    String? location,
    String? startDate,
    String? endDate,
    bool? isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateExperienceDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateExperienceDto.copyWith.fieldName(...)`
class _$UpdateExperienceDtoCWProxyImpl implements _$UpdateExperienceDtoCWProxy {
  const _$UpdateExperienceDtoCWProxyImpl(this._value);

  final UpdateExperienceDto _value;

  @override
  UpdateExperienceDto companyName(String? companyName) =>
      this(companyName: companyName);

  @override
  UpdateExperienceDto title(String? title) => this(title: title);

  @override
  UpdateExperienceDto description(String? description) =>
      this(description: description);

  @override
  UpdateExperienceDto workMode(UpdateExperienceDtoWorkModeEnum? workMode) =>
      this(workMode: workMode);

  @override
  UpdateExperienceDto location(String? location) => this(location: location);

  @override
  UpdateExperienceDto startDate(String? startDate) =>
      this(startDate: startDate);

  @override
  UpdateExperienceDto endDate(String? endDate) => this(endDate: endDate);

  @override
  UpdateExperienceDto isCurrent(bool? isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateExperienceDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateExperienceDto(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateExperienceDto call({
    Object? companyName = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? workMode = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return UpdateExperienceDto(
      companyName: companyName == const $CopyWithPlaceholder()
          ? _value.companyName
          // ignore: cast_nullable_to_non_nullable
          : companyName as String?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      workMode: workMode == const $CopyWithPlaceholder()
          ? _value.workMode
          // ignore: cast_nullable_to_non_nullable
          : workMode as UpdateExperienceDtoWorkModeEnum?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
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

extension $UpdateExperienceDtoCopyWith on UpdateExperienceDto {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateExperienceDto.copyWith(...)` or like so:`instanceOfUpdateExperienceDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateExperienceDtoCWProxy get copyWith =>
      _$UpdateExperienceDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExperienceDto _$UpdateExperienceDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateExperienceDto', json, ($checkedConvert) {
      final val = UpdateExperienceDto(
        companyName: $checkedConvert('companyName', (v) => v as String?),
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        workMode: $checkedConvert(
          'workMode',
          (v) =>
              $enumDecodeNullable(_$UpdateExperienceDtoWorkModeEnumEnumMap, v),
        ),
        location: $checkedConvert('location', (v) => v as String?),
        startDate: $checkedConvert('startDate', (v) => v as String?),
        endDate: $checkedConvert('endDate', (v) => v as String?),
        isCurrent: $checkedConvert('isCurrent', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$UpdateExperienceDtoToJson(
  UpdateExperienceDto instance,
) => <String, dynamic>{
  'companyName': ?instance.companyName,
  'title': ?instance.title,
  'description': ?instance.description,
  'workMode': ?_$UpdateExperienceDtoWorkModeEnumEnumMap[instance.workMode],
  'location': ?instance.location,
  'startDate': ?instance.startDate,
  'endDate': ?instance.endDate,
  'isCurrent': ?instance.isCurrent,
};

const _$UpdateExperienceDtoWorkModeEnumEnumMap = {
  UpdateExperienceDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  UpdateExperienceDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  UpdateExperienceDtoWorkModeEnum.REMOTO: 'REMOTO',
};
