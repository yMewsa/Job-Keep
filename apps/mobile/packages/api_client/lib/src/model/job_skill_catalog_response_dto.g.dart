// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_skill_catalog_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobSkillCatalogResponseDtoCWProxy {
  JobSkillCatalogResponseDto id(String id);

  JobSkillCatalogResponseDto name(String name);

  JobSkillCatalogResponseDto slug(String slug);

  JobSkillCatalogResponseDto category(String category);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillCatalogResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillCatalogResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillCatalogResponseDto call({
    String id,
    String name,
    String slug,
    String category,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJobSkillCatalogResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJobSkillCatalogResponseDto.copyWith.fieldName(...)`
class _$JobSkillCatalogResponseDtoCWProxyImpl
    implements _$JobSkillCatalogResponseDtoCWProxy {
  const _$JobSkillCatalogResponseDtoCWProxyImpl(this._value);

  final JobSkillCatalogResponseDto _value;

  @override
  JobSkillCatalogResponseDto id(String id) => this(id: id);

  @override
  JobSkillCatalogResponseDto name(String name) => this(name: name);

  @override
  JobSkillCatalogResponseDto slug(String slug) => this(slug: slug);

  @override
  JobSkillCatalogResponseDto category(String category) =>
      this(category: category);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JobSkillCatalogResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JobSkillCatalogResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  JobSkillCatalogResponseDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? slug = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
  }) {
    return JobSkillCatalogResponseDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      slug: slug == const $CopyWithPlaceholder()
          ? _value.slug
          // ignore: cast_nullable_to_non_nullable
          : slug as String,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
    );
  }
}

extension $JobSkillCatalogResponseDtoCopyWith on JobSkillCatalogResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfJobSkillCatalogResponseDto.copyWith(...)` or like so:`instanceOfJobSkillCatalogResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobSkillCatalogResponseDtoCWProxy get copyWith =>
      _$JobSkillCatalogResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobSkillCatalogResponseDto _$JobSkillCatalogResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('JobSkillCatalogResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'slug', 'category']);
  final val = JobSkillCatalogResponseDto(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    slug: $checkedConvert('slug', (v) => v as String),
    category: $checkedConvert('category', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$JobSkillCatalogResponseDtoToJson(
  JobSkillCatalogResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'category': instance.category,
};
