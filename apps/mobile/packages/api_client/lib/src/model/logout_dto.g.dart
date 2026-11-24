// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LogoutDtoCWProxy {
  LogoutDto refreshToken(String? refreshToken);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogoutDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogoutDto(...).copyWith(id: 12, name: "My name")
  /// ````
  LogoutDto call({String? refreshToken});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLogoutDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLogoutDto.copyWith.fieldName(...)`
class _$LogoutDtoCWProxyImpl implements _$LogoutDtoCWProxy {
  const _$LogoutDtoCWProxyImpl(this._value);

  final LogoutDto _value;

  @override
  LogoutDto refreshToken(String? refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogoutDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogoutDto(...).copyWith(id: 12, name: "My name")
  /// ````
  LogoutDto call({Object? refreshToken = const $CopyWithPlaceholder()}) {
    return LogoutDto(
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String?,
    );
  }
}

extension $LogoutDtoCopyWith on LogoutDto {
  /// Returns a callable class that can be used as follows: `instanceOfLogoutDto.copyWith(...)` or like so:`instanceOfLogoutDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LogoutDtoCWProxy get copyWith => _$LogoutDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutDto _$LogoutDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LogoutDto', json, ($checkedConvert) {
      final val = LogoutDto(
        refreshToken: $checkedConvert('refreshToken', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LogoutDtoToJson(LogoutDto instance) => <String, dynamic>{
  'refreshToken': ?instance.refreshToken,
};
