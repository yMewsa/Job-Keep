//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/company_job_summary_response_dto.dart';
import 'package:job_keep_api_client/src/model/job_skill_response_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobResponseDto {
  /// Returns a new [JobResponseDto] instance.
  JobResponseDto({

    required  this.id,

    required  this.companyId,

    required  this.title,

    required  this.description,

    required  this.requirements,

    required  this.area,

     this.city,

     this.state,

    required  this.workMode,

    required  this.salaryMin,

    required  this.salaryMax,

    required  this.benefits,

    required  this.seniority,

    required  this.contractType,

    required  this.status,

    required  this.responseDeadlineDays,

     this.publishedAt,

     this.closedAt,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.jobSkills,

     this.company,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'companyId',
    required: true,
    includeIfNull: false,
  )


  final String companyId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



  @JsonKey(
    
    name: r'requirements',
    required: true,
    includeIfNull: false,
  )


  final String requirements;



  @JsonKey(
    
    name: r'area',
    required: true,
    includeIfNull: false,
  )


  final String area;



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
    
    name: r'workMode',
    required: true,
    includeIfNull: false,
  )


  final JobResponseDtoWorkModeEnum workMode;



      /// Valor em centavos de real
  @JsonKey(
    
    name: r'salaryMin',
    required: true,
    includeIfNull: false,
  )


  final int salaryMin;



      /// Valor em centavos de real
  @JsonKey(
    
    name: r'salaryMax',
    required: true,
    includeIfNull: false,
  )


  final int salaryMax;



  @JsonKey(
    
    name: r'benefits',
    required: true,
    includeIfNull: false,
  )


  final List<String> benefits;



  @JsonKey(
    
    name: r'seniority',
    required: true,
    includeIfNull: false,
  )


  final JobResponseDtoSeniorityEnum seniority;



  @JsonKey(
    
    name: r'contractType',
    required: true,
    includeIfNull: false,
  )


  final JobResponseDtoContractTypeEnum contractType;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final JobResponseDtoStatusEnum status;



  @JsonKey(
    
    name: r'responseDeadlineDays',
    required: true,
    includeIfNull: false,
  )


  final int responseDeadlineDays;



  @JsonKey(
    
    name: r'publishedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? publishedAt;



  @JsonKey(
    
    name: r'closedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? closedAt;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updatedAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'jobSkills',
    required: true,
    includeIfNull: false,
  )


  final List<JobSkillResponseDto> jobSkills;



  @JsonKey(
    
    name: r'company',
    required: false,
    includeIfNull: false,
  )


  final CompanyJobSummaryResponseDto? company;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobResponseDto &&
      other.id == id &&
      other.companyId == companyId &&
      other.title == title &&
      other.description == description &&
      other.requirements == requirements &&
      other.area == area &&
      other.city == city &&
      other.state == state &&
      other.workMode == workMode &&
      other.salaryMin == salaryMin &&
      other.salaryMax == salaryMax &&
      other.benefits == benefits &&
      other.seniority == seniority &&
      other.contractType == contractType &&
      other.status == status &&
      other.responseDeadlineDays == responseDeadlineDays &&
      other.publishedAt == publishedAt &&
      other.closedAt == closedAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.jobSkills == jobSkills &&
      other.company == company;

    @override
    int get hashCode =>
        id.hashCode +
        companyId.hashCode +
        title.hashCode +
        description.hashCode +
        requirements.hashCode +
        area.hashCode +
        (city == null ? 0 : city.hashCode) +
        (state == null ? 0 : state.hashCode) +
        workMode.hashCode +
        salaryMin.hashCode +
        salaryMax.hashCode +
        benefits.hashCode +
        seniority.hashCode +
        contractType.hashCode +
        status.hashCode +
        responseDeadlineDays.hashCode +
        (publishedAt == null ? 0 : publishedAt.hashCode) +
        (closedAt == null ? 0 : closedAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        jobSkills.hashCode +
        company.hashCode;

  factory JobResponseDto.fromJson(Map<String, dynamic> json) => _$JobResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JobResponseDtoWorkModeEnum {
@JsonValue(r'PRESENCIAL')
PRESENCIAL(r'PRESENCIAL'),
@JsonValue(r'HIBRIDO')
HIBRIDO(r'HIBRIDO'),
@JsonValue(r'REMOTO')
REMOTO(r'REMOTO');

const JobResponseDtoWorkModeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobResponseDtoSeniorityEnum {
@JsonValue(r'INTERN')
INTERN(r'INTERN'),
@JsonValue(r'JUNIOR')
JUNIOR(r'JUNIOR'),
@JsonValue(r'MID')
MID(r'MID'),
@JsonValue(r'SENIOR')
SENIOR(r'SENIOR'),
@JsonValue(r'LEAD')
LEAD(r'LEAD'),
@JsonValue(r'SPECIALIST')
SPECIALIST(r'SPECIALIST');

const JobResponseDtoSeniorityEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobResponseDtoContractTypeEnum {
@JsonValue(r'CLT')
CLT(r'CLT'),
@JsonValue(r'PJ')
PJ(r'PJ'),
@JsonValue(r'INTERNSHIP')
INTERNSHIP(r'INTERNSHIP'),
@JsonValue(r'TEMPORARY')
TEMPORARY(r'TEMPORARY'),
@JsonValue(r'FREELANCE')
FREELANCE(r'FREELANCE');

const JobResponseDtoContractTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobResponseDtoStatusEnum {
@JsonValue(r'DRAFT')
DRAFT(r'DRAFT'),
@JsonValue(r'ACTIVE')
ACTIVE(r'ACTIVE'),
@JsonValue(r'PAUSED')
PAUSED(r'PAUSED'),
@JsonValue(r'CLOSED')
CLOSED(r'CLOSED');

const JobResponseDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


