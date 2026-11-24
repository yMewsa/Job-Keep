// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_company_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VerifyCompanyDtoCWProxy {
  VerifyCompanyDto status(VerifyCompanyDtoStatusEnum status);

  VerifyCompanyDto notes(String? notes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyCompanyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyCompanyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyCompanyDto call({VerifyCompanyDtoStatusEnum status, String? notes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVerifyCompanyDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVerifyCompanyDto.copyWith.fieldName(...)`
class _$VerifyCompanyDtoCWProxyImpl implements _$VerifyCompanyDtoCWProxy {
  const _$VerifyCompanyDtoCWProxyImpl(this._value);

  final VerifyCompanyDto _value;

  @override
  VerifyCompanyDto status(VerifyCompanyDtoStatusEnum status) =>
      this(status: status);

  @override
  VerifyCompanyDto notes(String? notes) => this(notes: notes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyCompanyDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyCompanyDto(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyCompanyDto call({
    Object? status = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
  }) {
    return VerifyCompanyDto(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as VerifyCompanyDtoStatusEnum,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
    );
  }
}

extension $VerifyCompanyDtoCopyWith on VerifyCompanyDto {
  /// Returns a callable class that can be used as follows: `instanceOfVerifyCompanyDto.copyWith(...)` or like so:`instanceOfVerifyCompanyDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VerifyCompanyDtoCWProxy get copyWith => _$VerifyCompanyDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCompanyDto _$VerifyCompanyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VerifyCompanyDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = VerifyCompanyDto(
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$VerifyCompanyDtoStatusEnumEnumMap, v),
        ),
        notes: $checkedConvert('notes', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$VerifyCompanyDtoToJson(VerifyCompanyDto instance) =>
    <String, dynamic>{
      'status': _$VerifyCompanyDtoStatusEnumEnumMap[instance.status]!,
      'notes': ?instance.notes,
    };

const _$VerifyCompanyDtoStatusEnumEnumMap = {
  VerifyCompanyDtoStatusEnum.VERIFIED: 'VERIFIED',
  VerifyCompanyDtoStatusEnum.REJECTED: 'REJECTED',
};
