// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_experience_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateExperienceDtoCWProxy {
  CreateExperienceDto companyName(String companyName);

  CreateExperienceDto title(String title);

  CreateExperienceDto description(String? description);

  CreateExperienceDto workMode(CreateExperienceDtoWorkModeEnum? workMode);

  CreateExperienceDto location(String? location);

  CreateExperienceDto startDate(String startDate);

  CreateExperienceDto endDate(String? endDate);

  CreateExperienceDto isCurrent(bool isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateExperienceDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateExperienceDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateExperienceDto call({
    String companyName,
    String title,
    String? description,
    CreateExperienceDtoWorkModeEnum? workMode,
    String? location,
    String startDate,
    String? endDate,
    bool isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateExperienceDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateExperienceDto.copyWith.fieldName(...)`
class _$CreateExperienceDtoCWProxyImpl implements _$CreateExperienceDtoCWProxy {
  const _$CreateExperienceDtoCWProxyImpl(this._value);

  final CreateExperienceDto _value;

  @override
  CreateExperienceDto companyName(String companyName) =>
      this(companyName: companyName);

  @override
  CreateExperienceDto title(String title) => this(title: title);

  @override
  CreateExperienceDto description(String? description) =>
      this(description: description);

  @override
  CreateExperienceDto workMode(CreateExperienceDtoWorkModeEnum? workMode) =>
      this(workMode: workMode);

  @override
  CreateExperienceDto location(String? location) => this(location: location);

  @override
  CreateExperienceDto startDate(String startDate) => this(startDate: startDate);

  @override
  CreateExperienceDto endDate(String? endDate) => this(endDate: endDate);

  @override
  CreateExperienceDto isCurrent(bool isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateExperienceDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateExperienceDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateExperienceDto call({
    Object? companyName = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? workMode = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return CreateExperienceDto(
      companyName: companyName == const $CopyWithPlaceholder()
          ? _value.companyName
          // ignore: cast_nullable_to_non_nullable
          : companyName as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      workMode: workMode == const $CopyWithPlaceholder()
          ? _value.workMode
          // ignore: cast_nullable_to_non_nullable
          : workMode as CreateExperienceDtoWorkModeEnum?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
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

extension $CreateExperienceDtoCopyWith on CreateExperienceDto {
  /// Returns a callable class that can be used as follows: `instanceOfCreateExperienceDto.copyWith(...)` or like so:`instanceOfCreateExperienceDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateExperienceDtoCWProxy get copyWith =>
      _$CreateExperienceDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExperienceDto _$CreateExperienceDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateExperienceDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['companyName', 'title', 'startDate', 'isCurrent'],
      );
      final val = CreateExperienceDto(
        companyName: $checkedConvert('companyName', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        workMode: $checkedConvert(
          'workMode',
          (v) =>
              $enumDecodeNullable(_$CreateExperienceDtoWorkModeEnumEnumMap, v),
        ),
        location: $checkedConvert('location', (v) => v as String?),
        startDate: $checkedConvert('startDate', (v) => v as String),
        endDate: $checkedConvert('endDate', (v) => v as String?),
        isCurrent: $checkedConvert('isCurrent', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$CreateExperienceDtoToJson(
  CreateExperienceDto instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'title': instance.title,
  'description': ?instance.description,
  'workMode': ?_$CreateExperienceDtoWorkModeEnumEnumMap[instance.workMode],
  'location': ?instance.location,
  'startDate': instance.startDate,
  'endDate': ?instance.endDate,
  'isCurrent': instance.isCurrent,
};

const _$CreateExperienceDtoWorkModeEnumEnumMap = {
  CreateExperienceDtoWorkModeEnum.PRESENCIAL: 'PRESENCIAL',
  CreateExperienceDtoWorkModeEnum.HIBRIDO: 'HIBRIDO',
  CreateExperienceDtoWorkModeEnum.REMOTO: 'REMOTO',
};
