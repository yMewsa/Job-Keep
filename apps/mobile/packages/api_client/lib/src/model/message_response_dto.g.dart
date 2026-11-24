// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageResponseDtoCWProxy {
  MessageResponseDto message(String message);

  MessageResponseDto devCode(String? devCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageResponseDto call({String message, String? devCode});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessageResponseDto.copyWith.fieldName(...)`
class _$MessageResponseDtoCWProxyImpl implements _$MessageResponseDtoCWProxy {
  const _$MessageResponseDtoCWProxyImpl(this._value);

  final MessageResponseDto _value;

  @override
  MessageResponseDto message(String message) => this(message: message);

  @override
  MessageResponseDto devCode(String? devCode) => this(devCode: devCode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageResponseDto call({
    Object? message = const $CopyWithPlaceholder(),
    Object? devCode = const $CopyWithPlaceholder(),
  }) {
    return MessageResponseDto(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      devCode: devCode == const $CopyWithPlaceholder()
          ? _value.devCode
          // ignore: cast_nullable_to_non_nullable
          : devCode as String?,
    );
  }
}

extension $MessageResponseDtoCopyWith on MessageResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfMessageResponseDto.copyWith(...)` or like so:`instanceOfMessageResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageResponseDtoCWProxy get copyWith =>
      _$MessageResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponseDto _$MessageResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MessageResponseDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['message']);
      final val = MessageResponseDto(
        message: $checkedConvert('message', (v) => v as String),
        devCode: $checkedConvert('devCode', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$MessageResponseDtoToJson(MessageResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'devCode': ?instance.devCode,
    };
