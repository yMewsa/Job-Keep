//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_invitation_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyInvitationResponseDto {
  /// Returns a new [CompanyInvitationResponseDto] instance.
  CompanyInvitationResponseDto({

    required  this.id,

    required  this.email,

    required  this.role,

    required  this.expiresAt,
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


  final CompanyInvitationResponseDtoRoleEnum role;



  @JsonKey(
    
    name: r'expiresAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyInvitationResponseDto &&
      other.id == id &&
      other.email == email &&
      other.role == role &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        id.hashCode +
        email.hashCode +
        role.hashCode +
        expiresAt.hashCode;

  factory CompanyInvitationResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyInvitationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInvitationResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CompanyInvitationResponseDtoRoleEnum {
@JsonValue(r'OWNER')
OWNER(r'OWNER'),
@JsonValue(r'RECRUITER')
RECRUITER(r'RECRUITER');

const CompanyInvitationResponseDtoRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


