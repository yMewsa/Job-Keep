//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_job_summary_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyJobSummaryResponseDto {
  /// Returns a new [CompanyJobSummaryResponseDto] instance.
  CompanyJobSummaryResponseDto({

    required  this.id,

    required  this.tradeName,

    required  this.sector,

     this.logoUrl,

    required  this.verificationStatus,
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
    
    name: r'logoUrl',
    required: false,
    includeIfNull: false,
  )


  final Object? logoUrl;



  @JsonKey(
    
    name: r'verificationStatus',
    required: true,
    includeIfNull: false,
  )


  final CompanyJobSummaryResponseDtoVerificationStatusEnum verificationStatus;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyJobSummaryResponseDto &&
      other.id == id &&
      other.tradeName == tradeName &&
      other.sector == sector &&
      other.logoUrl == logoUrl &&
      other.verificationStatus == verificationStatus;

    @override
    int get hashCode =>
        id.hashCode +
        tradeName.hashCode +
        sector.hashCode +
        (logoUrl == null ? 0 : logoUrl.hashCode) +
        verificationStatus.hashCode;

  factory CompanyJobSummaryResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyJobSummaryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyJobSummaryResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CompanyJobSummaryResponseDtoVerificationStatusEnum {
@JsonValue(r'PENDING')
PENDING(r'PENDING'),
@JsonValue(r'VERIFIED')
VERIFIED(r'VERIFIED'),
@JsonValue(r'REJECTED')
REJECTED(r'REJECTED');

const CompanyJobSummaryResponseDtoVerificationStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


