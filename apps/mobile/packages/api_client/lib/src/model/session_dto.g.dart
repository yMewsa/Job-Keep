// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionDtoCWProxy {
  SessionDto id(String id);

  SessionDto deviceName(Object? deviceName);

  SessionDto platform(Object? platform);

  SessionDto ipAddress(Object? ipAddress);

  SessionDto lastUsedAt(Object? lastUsedAt);

  SessionDto createdAt(DateTime createdAt);

  SessionDto expiresAt(DateTime expiresAt);

  SessionDto isCurrent(bool isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionDto(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionDto call({
    String id,
    Object? deviceName,
    Object? platform,
    Object? ipAddress,
    Object? lastUsedAt,
    DateTime createdAt,
    DateTime expiresAt,
    bool isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionDto.copyWith.fieldName(...)`
class _$SessionDtoCWProxyImpl implements _$SessionDtoCWProxy {
  const _$SessionDtoCWProxyImpl(this._value);

  final SessionDto _value;

  @override
  SessionDto id(String id) => this(id: id);

  @override
  SessionDto deviceName(Object? deviceName) => this(deviceName: deviceName);

  @override
  SessionDto platform(Object? platform) => this(platform: platform);

  @override
  SessionDto ipAddress(Object? ipAddress) => this(ipAddress: ipAddress);

  @override
  SessionDto lastUsedAt(Object? lastUsedAt) => this(lastUsedAt: lastUsedAt);

  @override
  SessionDto createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  SessionDto expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  SessionDto isCurrent(bool isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionDto(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? ipAddress = const $CopyWithPlaceholder(),
    Object? lastUsedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return SessionDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as Object?,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as Object?,
      ipAddress: ipAddress == const $CopyWithPlaceholder()
          ? _value.ipAddress
          // ignore: cast_nullable_to_non_nullable
          : ipAddress as Object?,
      lastUsedAt: lastUsedAt == const $CopyWithPlaceholder()
          ? _value.lastUsedAt
          // ignore: cast_nullable_to_non_nullable
          : lastUsedAt as Object?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      isCurrent: isCurrent == const $CopyWithPlaceholder()
          ? _value.isCurrent
          // ignore: cast_nullable_to_non_nullable
          : isCurrent as bool,
    );
  }
}

extension $SessionDtoCopyWith on SessionDto {
  /// Returns a callable class that can be used as follows: `instanceOfSessionDto.copyWith(...)` or like so:`instanceOfSessionDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionDtoCWProxy get copyWith => _$SessionDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDto _$SessionDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SessionDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'createdAt', 'expiresAt', 'isCurrent'],
  );
  final val = SessionDto(
    id: $checkedConvert('id', (v) => v as String),
    deviceName: $checkedConvert('deviceName', (v) => v),
    platform: $checkedConvert('platform', (v) => v),
    ipAddress: $checkedConvert('ipAddress', (v) => v),
    lastUsedAt: $checkedConvert('lastUsedAt', (v) => v),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    expiresAt: $checkedConvert('expiresAt', (v) => DateTime.parse(v as String)),
    isCurrent: $checkedConvert('isCurrent', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$SessionDtoToJson(SessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceName': ?instance.deviceName,
      'platform': ?instance.platform,
      'ipAddress': ?instance.ipAddress,
      'lastUsedAt': ?instance.lastUsedAt,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'isCurrent': instance.isCurrent,
    };
