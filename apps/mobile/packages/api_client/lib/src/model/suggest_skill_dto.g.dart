// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_skill_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SuggestSkillDtoCWProxy {
  SuggestSkillDto name(String name);

  SuggestSkillDto category(String category);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestSkillDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestSkillDto(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestSkillDto call({String name, String category});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestSkillDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestSkillDto.copyWith.fieldName(...)`
class _$SuggestSkillDtoCWProxyImpl implements _$SuggestSkillDtoCWProxy {
  const _$SuggestSkillDtoCWProxyImpl(this._value);

  final SuggestSkillDto _value;

  @override
  SuggestSkillDto name(String name) => this(name: name);

  @override
  SuggestSkillDto category(String category) => this(category: category);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestSkillDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestSkillDto(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestSkillDto call({
    Object? name = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
  }) {
    return SuggestSkillDto(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
    );
  }
}

extension $SuggestSkillDtoCopyWith on SuggestSkillDto {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestSkillDto.copyWith(...)` or like so:`instanceOfSuggestSkillDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestSkillDtoCWProxy get copyWith => _$SuggestSkillDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestSkillDto _$SuggestSkillDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SuggestSkillDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'category']);
      final val = SuggestSkillDto(
        name: $checkedConvert('name', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SuggestSkillDtoToJson(SuggestSkillDto instance) =>
    <String, dynamic>{'name': instance.name, 'category': instance.category};
