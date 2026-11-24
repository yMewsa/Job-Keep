//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/auth_user_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterResponseDto {
  /// Returns a new [RegisterResponseDto] instance.
  RegisterResponseDto({

    required  this.message,

    required  this.user,

     this.devVerificationCode,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final AuthUserDto user;



      /// Retornado apenas em ambiente de desenvolvimento/testes quando MAIL_PROVIDER=console.
  @JsonKey(
    
    name: r'devVerificationCode',
    required: false,
    includeIfNull: false,
  )


  final String? devVerificationCode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RegisterResponseDto &&
      other.message == message &&
      other.user == user &&
      other.devVerificationCode == devVerificationCode;

    @override
    int get hashCode =>
        message.hashCode +
        user.hashCode +
        devVerificationCode.hashCode;

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) => _$RegisterResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

