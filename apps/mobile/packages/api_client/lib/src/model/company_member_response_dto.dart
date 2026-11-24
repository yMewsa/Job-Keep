//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/company_member_user_response_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_member_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyMemberResponseDto {
  /// Returns a new [CompanyMemberResponseDto] instance.
  CompanyMemberResponseDto({

    required  this.id,

    required  this.userId,

    required  this.companyId,

    required  this.role,

    required  this.createdAt,

     this.user,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'userId',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'companyId',
    required: true,
    includeIfNull: false,
  )


  final String companyId;



  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: false,
  )


  final CompanyMemberResponseDtoRoleEnum role;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'user',
    required: false,
    includeIfNull: false,
  )


  final CompanyMemberUserResponseDto? user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyMemberResponseDto &&
      other.id == id &&
      other.userId == userId &&
      other.companyId == companyId &&
      other.role == role &&
      other.createdAt == createdAt &&
      other.user == user;

    @override
    int get hashCode =>
        id.hashCode +
        userId.hashCode +
        companyId.hashCode +
        role.hashCode +
        createdAt.hashCode +
        user.hashCode;

  factory CompanyMemberResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyMemberResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyMemberResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CompanyMemberResponseDtoRoleEnum {
@JsonValue(r'OWNER')
OWNER(r'OWNER'),
@JsonValue(r'RECRUITER')
RECRUITER(r'RECRUITER');

const CompanyMemberResponseDtoRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


