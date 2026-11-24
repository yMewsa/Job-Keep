//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_member_user_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyMemberUserResponseDto {
  /// Returns a new [CompanyMemberUserResponseDto] instance.
  CompanyMemberUserResponseDto({

    required  this.id,

    required  this.email,

    required  this.role,

    required  this.status,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: false,
  )


  final CompanyMemberUserResponseDtoRoleEnum role;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final CompanyMemberUserResponseDtoStatusEnum status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyMemberUserResponseDto &&
      other.id == id &&
      other.email == email &&
      other.role == role &&
      other.status == status;

    @override
    int get hashCode =>
        id.hashCode +
        email.hashCode +
        role.hashCode +
        status.hashCode;

  factory CompanyMemberUserResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyMemberUserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyMemberUserResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CompanyMemberUserResponseDtoRoleEnum {
@JsonValue(r'CANDIDATE')
CANDIDATE(r'CANDIDATE'),
@JsonValue(r'COMPANY')
COMPANY(r'COMPANY'),
@JsonValue(r'ADMIN')
ADMIN(r'ADMIN');

const CompanyMemberUserResponseDtoRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


enum CompanyMemberUserResponseDtoStatusEnum {
@JsonValue(r'ACTIVE')
ACTIVE(r'ACTIVE'),
@JsonValue(r'DEACTIVATED')
DEACTIVATED(r'DEACTIVATED'),
@JsonValue(r'SUSPENDED')
SUSPENDED(r'SUSPENDED'),
@JsonValue(r'DELETED')
DELETED(r'DELETED');

const CompanyMemberUserResponseDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


