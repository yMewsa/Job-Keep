//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_email_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VerifyEmailDto {
  /// Returns a new [VerifyEmailDto] instance.
  VerifyEmailDto({

     this.email,

     this.code,

     this.token,
  });

  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



      /// Token de verificacao recebido por link.
  @JsonKey(
    
    name: r'token',
    required: false,
    includeIfNull: false,
  )


  final String? token;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VerifyEmailDto &&
      other.email == email &&
      other.code == code &&
      other.token == token;

    @override
    int get hashCode =>
        email.hashCode +
        code.hashCode +
        token.hashCode;

  factory VerifyEmailDto.fromJson(Map<String, dynamic> json) => _$VerifyEmailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

