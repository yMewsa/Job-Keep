//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_company_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterCompanyDto {
  /// Returns a new [RegisterCompanyDto] instance.
  RegisterCompanyDto({

    required  this.email,

    required  this.password,

    required  this.legalName,

    required  this.tradeName,

    required  this.cnpj,

    required  this.sector,

    required  this.size,

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
    
    name: r'legalName',
    required: true,
    includeIfNull: false,
  )


  final String legalName;



  @JsonKey(
    
    name: r'tradeName',
    required: true,
    includeIfNull: false,
  )


  final String tradeName;



      /// CNPJ com 14 digitos ou formatado.
  @JsonKey(
    
    name: r'cnpj',
    required: true,
    includeIfNull: false,
  )


  final String cnpj;



  @JsonKey(
    
    name: r'sector',
    required: true,
    includeIfNull: false,
  )


  final String sector;



  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final RegisterCompanyDtoSizeEnum size;



  @JsonKey(
    
    name: r'acceptTerms',
    required: true,
    includeIfNull: false,
  )


  final bool acceptTerms;



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
    bool operator ==(Object other) => identical(this, other) || other is RegisterCompanyDto &&
      other.email == email &&
      other.password == password &&
      other.legalName == legalName &&
      other.tradeName == tradeName &&
      other.cnpj == cnpj &&
      other.sector == sector &&
      other.size == size &&
      other.acceptTerms == acceptTerms &&
      other.acceptPrivacyPolicy == acceptPrivacyPolicy &&
      other.termsVersion == termsVersion &&
      other.privacyPolicyVersion == privacyPolicyVersion;

    @override
    int get hashCode =>
        email.hashCode +
        password.hashCode +
        legalName.hashCode +
        tradeName.hashCode +
        cnpj.hashCode +
        sector.hashCode +
        size.hashCode +
        acceptTerms.hashCode +
        acceptPrivacyPolicy.hashCode +
        termsVersion.hashCode +
        privacyPolicyVersion.hashCode;

  factory RegisterCompanyDto.fromJson(Map<String, dynamic> json) => _$RegisterCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCompanyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum RegisterCompanyDtoSizeEnum {
@JsonValue(r'MICRO')
MICRO(r'MICRO'),
@JsonValue(r'SMALL')
SMALL(r'SMALL'),
@JsonValue(r'MEDIUM')
MEDIUM(r'MEDIUM'),
@JsonValue(r'LARGE')
LARGE(r'LARGE'),
@JsonValue(r'ENTERPRISE')
ENTERPRISE(r'ENTERPRISE');

const RegisterCompanyDtoSizeEnum(this.value);

final String value;

@override
String toString() => value;
}


