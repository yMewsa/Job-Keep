// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_company_invitation_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AcceptCompanyInvitationDtoCWProxy {
  AcceptCompanyInvitationDto token(String token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AcceptCompanyInvitationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AcceptCompanyInvitationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AcceptCompanyInvitationDto call({String token});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAcceptCompanyInvitationDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAcceptCompanyInvitationDto.copyWith.fieldName(...)`
class _$AcceptCompanyInvitationDtoCWProxyImpl
    implements _$AcceptCompanyInvitationDtoCWProxy {
  const _$AcceptCompanyInvitationDtoCWProxyImpl(this._value);

  final AcceptCompanyInvitationDto _value;

  @override
  AcceptCompanyInvitationDto token(String token) => this(token: token);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AcceptCompanyInvitationDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AcceptCompanyInvitationDto(...).copyWith(id: 12, name: "My name")
  /// ````
  AcceptCompanyInvitationDto call({
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return AcceptCompanyInvitationDto(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
    );
  }
}

extension $AcceptCompanyInvitationDtoCopyWith on AcceptCompanyInvitationDto {
  /// Returns a callable class that can be used as follows: `instanceOfAcceptCompanyInvitationDto.copyWith(...)` or like so:`instanceOfAcceptCompanyInvitationDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AcceptCompanyInvitationDtoCWProxy get copyWith =>
      _$AcceptCompanyInvitationDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptCompanyInvitationDto _$AcceptCompanyInvitationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AcceptCompanyInvitationDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['token']);
  final val = AcceptCompanyInvitationDto(
    token: $checkedConvert('token', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$AcceptCompanyInvitationDtoToJson(
  AcceptCompanyInvitationDto instance,
) => <String, dynamic>{'token': instance.token};
