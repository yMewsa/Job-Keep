//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accept_company_invitation_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AcceptCompanyInvitationDto {
  /// Returns a new [AcceptCompanyInvitationDto] instance.
  AcceptCompanyInvitationDto({

    required  this.token,
  });

      /// Token de convite recebido por e-mail.
  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AcceptCompanyInvitationDto &&
      other.token == token;

    @override
    int get hashCode =>
        token.hashCode;

  factory AcceptCompanyInvitationDto.fromJson(Map<String, dynamic> json) => _$AcceptCompanyInvitationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptCompanyInvitationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

