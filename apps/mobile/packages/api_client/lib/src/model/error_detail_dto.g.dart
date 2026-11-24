// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorDetailDtoCWProxy {
  ErrorDetailDto field(String field);

  ErrorDetailDto code(String code);

  ErrorDetailDto message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorDetailDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorDetailDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorDetailDto call({String field, String code, String message});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorDetailDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorDetailDto.copyWith.fieldName(...)`
class _$ErrorDetailDtoCWProxyImpl implements _$ErrorDetailDtoCWProxy {
  const _$ErrorDetailDtoCWProxyImpl(this._value);

  final ErrorDetailDto _value;

  @override
  ErrorDetailDto field(String field) => this(field: field);

  @override
  ErrorDetailDto code(String code) => this(code: code);

  @override
  ErrorDetailDto message(String message) => this(message: message);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorDetailDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorDetailDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorDetailDto call({
    Object? field = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ErrorDetailDto(
      field: field == const $CopyWithPlaceholder()
          ? _value.field
          // ignore: cast_nullable_to_non_nullable
          : field as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $ErrorDetailDtoCopyWith on ErrorDetailDto {
  /// Returns a callable class that can be used as follows: `instanceOfErrorDetailDto.copyWith(...)` or like so:`instanceOfErrorDetailDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorDetailDtoCWProxy get copyWith => _$ErrorDetailDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetailDto _$ErrorDetailDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorDetailDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['field', 'code', 'message']);
      final val = ErrorDetailDto(
        field: $checkedConvert('field', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ErrorDetailDtoToJson(ErrorDetailDto instance) =>
    <String, dynamic>{
      'field': instance.field,
      'code': instance.code,
      'message': instance.message,
    };
