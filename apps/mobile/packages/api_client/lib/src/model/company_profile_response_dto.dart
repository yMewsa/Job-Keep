//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/company_member_response_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_profile_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyProfileResponseDto {
  /// Returns a new [CompanyProfileResponseDto] instance.
  CompanyProfileResponseDto({

    required  this.id,

    required  this.legalName,

    required  this.tradeName,

    required  this.cnpj,

    required  this.sector,

    required  this.size,

     this.description,

     this.logoUrl,

     this.websiteUrl,

     this.city,

     this.state,

    required  this.verificationStatus,

     this.verifiedAt,

     this.verificationNotes,

     this.maxActiveJobs,

     this.members,

     this.myRole,

     this.themeSettings,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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


  final CompanyProfileResponseDtoSizeEnum size;



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


  final CompanyProfileResponseDtoVerificationStatusEnum verificationStatus;



  @JsonKey(
    
    name: r'verifiedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? verifiedAt;



  @JsonKey(
    
    name: r'verificationNotes',
    required: false,
    includeIfNull: false,
  )


  final Object? verificationNotes;



  @JsonKey(
    
    name: r'maxActiveJobs',
    required: false,
    includeIfNull: false,
  )


  final int? maxActiveJobs;



  @JsonKey(
    
    name: r'members',
    required: false,
    includeIfNull: false,
  )


  final List<CompanyMemberResponseDto>? members;



  @JsonKey(
    
    name: r'myRole',
    required: false,
    includeIfNull: false,
  )


  final CompanyProfileResponseDtoMyRoleEnum? myRole;



  @JsonKey(
    
    name: r'themeSettings',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? themeSettings;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyProfileResponseDto &&
      other.id == id &&
      other.legalName == legalName &&
      other.tradeName == tradeName &&
      other.cnpj == cnpj &&
      other.sector == sector &&
      other.size == size &&
      other.description == description &&
      other.logoUrl == logoUrl &&
      other.websiteUrl == websiteUrl &&
      other.city == city &&
      other.state == state &&
      other.verificationStatus == verificationStatus &&
      other.verifiedAt == verifiedAt &&
      other.verificationNotes == verificationNotes &&
      other.maxActiveJobs == maxActiveJobs &&
      other.members == members &&
      other.myRole == myRole &&
      other.themeSettings == themeSettings;

    @override
    int get hashCode =>
        id.hashCode +
        legalName.hashCode +
        tradeName.hashCode +
        cnpj.hashCode +
        sector.hashCode +
        size.hashCode +
        (description == null ? 0 : description.hashCode) +
        (logoUrl == null ? 0 : logoUrl.hashCode) +
        (websiteUrl == null ? 0 : websiteUrl.hashCode) +
        (city == null ? 0 : city.hashCode) +
        (state == null ? 0 : state.hashCode) +
        verificationStatus.hashCode +
        (verifiedAt == null ? 0 : verifiedAt.hashCode) +
        (verificationNotes == null ? 0 : verificationNotes.hashCode) +
        (maxActiveJobs == null ? 0 : maxActiveJobs.hashCode) +
        members.hashCode +
        myRole.hashCode +
        (themeSettings == null ? 0 : themeSettings.hashCode);

  factory CompanyProfileResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyProfileResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CompanyProfileResponseDtoSizeEnum {
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

const CompanyProfileResponseDtoSizeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum CompanyProfileResponseDtoVerificationStatusEnum {
@JsonValue(r'PENDING')
PENDING(r'PENDING'),
@JsonValue(r'VERIFIED')
VERIFIED(r'VERIFIED'),
@JsonValue(r'REJECTED')
REJECTED(r'REJECTED');

const CompanyProfileResponseDtoVerificationStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


enum CompanyProfileResponseDtoMyRoleEnum {
@JsonValue(r'OWNER')
OWNER(r'OWNER'),
@JsonValue(r'RECRUITER')
RECRUITER(r'RECRUITER');

const CompanyProfileResponseDtoMyRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


