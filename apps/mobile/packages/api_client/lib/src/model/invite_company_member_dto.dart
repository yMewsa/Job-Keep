//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invite_company_member_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InviteCompanyMemberDto {
  /// Returns a new [InviteCompanyMemberDto] instance.
  InviteCompanyMemberDto({

    required  this.email,

     this.role,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final InviteCompanyMemberDtoRoleEnum? role;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InviteCompanyMemberDto &&
      other.email == email &&
      other.role == role;

    @override
    int get hashCode =>
        email.hashCode +
        role.hashCode;

  factory InviteCompanyMemberDto.fromJson(Map<String, dynamic> json) => _$InviteCompanyMemberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InviteCompanyMemberDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum InviteCompanyMemberDtoRoleEnum {
@JsonValue(r'OWNER')
OWNER(r'OWNER'),
@JsonValue(r'RECRUITER')
RECRUITER(r'RECRUITER');

const InviteCompanyMemberDtoRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


