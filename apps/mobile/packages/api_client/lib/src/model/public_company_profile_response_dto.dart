//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_company_profile_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublicCompanyProfileResponseDto {
  /// Returns a new [PublicCompanyProfileResponseDto] instance.
  PublicCompanyProfileResponseDto({

    required  this.id,

    required  this.tradeName,

    required  this.sector,

    required  this.size,

     this.description,

     this.logoUrl,

     this.websiteUrl,

     this.city,

     this.state,

    required  this.verificationStatus,

     this.themeSettings,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'tradeName',
    required: true,
    includeIfNull: false,
  )


  final String tradeName;



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


  final PublicCompanyProfileResponseDtoSizeEnum size;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final Object? description;



  @JsonKey(
    
    name: r'logoUrl',
    required: false,
    includeIfNull: false,
  )


  final Object? logoUrl;



  @JsonKey(
    
    name: r'websiteUrl',
    required: false,
    includeIfNull: false,
  )


  final Object? websiteUrl;



  @JsonKey(
    
    name: r'city',
    required: false,
    includeIfNull: false,
  )


  final Object? city;



  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final Object? state;



  @JsonKey(
    
    name: r'verificationStatus',
    required: true,
    includeIfNull: false,
  )


  final PublicCompanyProfileResponseDtoVerificationStatusEnum verificationStatus;



  @JsonKey(
    
    name: r'themeSettings',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? themeSettings;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublicCompanyProfileResponseDto &&
      other.id == id &&
      other.tradeName == tradeName &&
      other.sector == sector &&
      other.size == size &&
      other.description == description &&
      other.logoUrl == logoUrl &&
      other.websiteUrl == websiteUrl &&
      other.city == city &&
      other.state == state &&
      other.verificationStatus == verificationStatus &&
      other.themeSettings == themeSettings;

    @override
    int get hashCode =>
        id.hashCode +
        tradeName.hashCode +
        sector.hashCode +
        size.hashCode +
        (description == null ? 0 : description.hashCode) +
        (logoUrl == null ? 0 : logoUrl.hashCode) +
        (websiteUrl == null ? 0 : websiteUrl.hashCode) +
        (city == null ? 0 : city.hashCode) +
        (state == null ? 0 : state.hashCode) +
        verificationStatus.hashCode +
        (themeSettings == null ? 0 : themeSettings.hashCode);

  factory PublicCompanyProfileResponseDto.fromJson(Map<String, dynamic> json) => _$PublicCompanyProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PublicCompanyProfileResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum PublicCompanyProfileResponseDtoSizeEnum {
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

const PublicCompanyProfileResponseDtoSizeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum PublicCompanyProfileResponseDtoVerificationStatusEnum {
@JsonValue(r'PENDING')
PENDING(r'PENDING'),
@JsonValue(r'VERIFIED')
VERIFIED(r'VERIFIED'),
@JsonValue(r'REJECTED')
REJECTED(r'REJECTED');

const PublicCompanyProfileResponseDtoVerificationStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


