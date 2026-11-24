//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_company_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VerifyCompanyDto {
  /// Returns a new [VerifyCompanyDto] instance.
  VerifyCompanyDto({

    required  this.status,

     this.notes,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final VerifyCompanyDtoStatusEnum status;



  @JsonKey(
    
    name: r'notes',
    required: false,
    includeIfNull: false,
  )


  final String? notes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VerifyCompanyDto &&
      other.status == status &&
      other.notes == notes;

    @override
    int get hashCode =>
        status.hashCode +
        notes.hashCode;

  factory VerifyCompanyDto.fromJson(Map<String, dynamic> json) => _$VerifyCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCompanyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum VerifyCompanyDtoStatusEnum {
@JsonValue(r'VERIFIED')
VERIFIED(r'VERIFIED'),
@JsonValue(r'REJECTED')
REJECTED(r'REJECTED');

const VerifyCompanyDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


