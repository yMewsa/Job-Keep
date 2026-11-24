//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/auth_user_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_tokens_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthTokensResponseDto {
  /// Returns a new [AuthTokensResponseDto] instance.
  AuthTokensResponseDto({

    required  this.accessToken,

    required  this.refreshToken,

    required  this.expiresInSeconds,

    required  this.user,
  });

  @JsonKey(
    
    name: r'accessToken',
    required: true,
    includeIfNull: false,
  )


  final String accessToken;



  @JsonKey(
    
    name: r'refreshToken',
    required: true,
    includeIfNull: false,
  )


  final String refreshToken;



  @JsonKey(
    
    name: r'expiresInSeconds',
    required: true,
    includeIfNull: false,
  )


  final num expiresInSeconds;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final AuthUserDto user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthTokensResponseDto &&
      other.accessToken == accessToken &&
      other.refreshToken == refreshToken &&
      other.expiresInSeconds == expiresInSeconds &&
      other.user == user;

    @override
    int get hashCode =>
        accessToken.hashCode +
        refreshToken.hashCode +
        expiresInSeconds.hashCode +
        user.hashCode;

  factory AuthTokensResponseDto.fromJson(Map<String, dynamic> json) => _$AuthTokensResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokensResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

