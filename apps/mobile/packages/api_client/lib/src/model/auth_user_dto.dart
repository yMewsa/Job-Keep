//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthUserDto {
  /// Returns a new [AuthUserDto] instance.
  AuthUserDto({

    required  this.id,

    required  this.email,

    required  this.role,

    required  this.status,

    required  this.emailVerified,
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


  final AuthUserDtoRoleEnum role;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AuthUserDtoStatusEnum status;



  @JsonKey(
    
    name: r'emailVerified',
    required: true,
    includeIfNull: false,
  )


  final bool emailVerified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthUserDto &&
      other.id == id &&
      other.email == email &&
      other.role == role &&
      other.status == status &&
      other.emailVerified == emailVerified;

    @override
    int get hashCode =>
        id.hashCode +
        email.hashCode +
        role.hashCode +
        status.hashCode +
        emailVerified.hashCode;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) => _$AuthUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum AuthUserDtoRoleEnum {
@JsonValue(r'CANDIDATE')
CANDIDATE(r'CANDIDATE'),
@JsonValue(r'COMPANY')
COMPANY(r'COMPANY'),
@JsonValue(r'ADMIN')
ADMIN(r'ADMIN');

const AuthUserDtoRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


enum AuthUserDtoStatusEnum {
@JsonValue(r'ACTIVE')
ACTIVE(r'ACTIVE'),
@JsonValue(r'DEACTIVATED')
DEACTIVATED(r'DEACTIVATED'),
@JsonValue(r'SUSPENDED')
SUSPENDED(r'SUSPENDED'),
@JsonValue(r'DELETED')
DELETED(r'DELETED');

const AuthUserDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


