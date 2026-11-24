//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_candidate_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterCandidateDto {
  /// Returns a new [RegisterCandidateDto] instance.
  RegisterCandidateDto({

    required  this.email,

    required  this.password,

    required  this.fullName,

    required  this.acceptTerms,

    required  this.acceptPrivacyPolicy,

     this.termsVersion = '1.0.0',

     this.privacyPolicyVersion = '1.0.0',
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'fullName',
    required: true,
    includeIfNull: false,
  )


  final String fullName;



      /// Aceite obrigatorio dos Termos de Uso.
  @JsonKey(
    
    name: r'acceptTerms',
    required: true,
    includeIfNull: false,
  )


  final bool acceptTerms;



      /// Aceite obrigatorio da Politica de Privacidade (LGPD).
  @JsonKey(
    
    name: r'acceptPrivacyPolicy',
    required: true,
    includeIfNull: false,
  )


  final bool acceptPrivacyPolicy;



  @JsonKey(
    defaultValue: '1.0.0',
    name: r'termsVersion',
    required: false,
    includeIfNull: false,
  )


  final String? termsVersion;



  @JsonKey(
    defaultValue: '1.0.0',
    name: r'privacyPolicyVersion',
    required: false,
    includeIfNull: false,
  )


  final String? privacyPolicyVersion;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RegisterCandidateDto &&
      other.email == email &&
      other.password == password &&
      other.fullName == fullName &&
      other.acceptTerms == acceptTerms &&
      other.acceptPrivacyPolicy == acceptPrivacyPolicy &&
      other.termsVersion == termsVersion &&
      other.privacyPolicyVersion == privacyPolicyVersion;

    @override
    int get hashCode =>
        email.hashCode +
        password.hashCode +
        fullName.hashCode +
        acceptTerms.hashCode +
        acceptPrivacyPolicy.hashCode +
        termsVersion.hashCode +
        privacyPolicyVersion.hashCode;

  factory RegisterCandidateDto.fromJson(Map<String, dynamic> json) => _$RegisterCandidateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCandidateDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

