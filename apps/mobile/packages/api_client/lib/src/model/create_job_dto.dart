//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/job_skill_input_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_job_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateJobDto {
  /// Returns a new [CreateJobDto] instance.
  CreateJobDto({

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

     this.responseDeadlineDays = 14,

     this.skills,
  });

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


  final String? city;



  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final String? state;



  @JsonKey(
    
    name: r'workMode',
    required: true,
    includeIfNull: false,
  )


  final CreateJobDtoWorkModeEnum workMode;



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


  final CreateJobDtoSeniorityEnum seniority;



  @JsonKey(
    
    name: r'contractType',
    required: true,
    includeIfNull: false,
  )


  final CreateJobDtoContractTypeEnum contractType;



          // minimum: 1
          // maximum: 90
  @JsonKey(
    defaultValue: 14,
    name: r'responseDeadlineDays',
    required: false,
    includeIfNull: false,
  )


  final int? responseDeadlineDays;



  @JsonKey(
    
    name: r'skills',
    required: false,
    includeIfNull: false,
  )


  final List<JobSkillInputDto>? skills;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateJobDto &&
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
      other.responseDeadlineDays == responseDeadlineDays &&
      other.skills == skills;

    @override
    int get hashCode =>
        title.hashCode +
        description.hashCode +
        requirements.hashCode +
        area.hashCode +
        city.hashCode +
        state.hashCode +
        workMode.hashCode +
        salaryMin.hashCode +
        salaryMax.hashCode +
        benefits.hashCode +
        seniority.hashCode +
        contractType.hashCode +
        responseDeadlineDays.hashCode +
        skills.hashCode;

  factory CreateJobDto.fromJson(Map<String, dynamic> json) => _$CreateJobDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateJobDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CreateJobDtoWorkModeEnum {
@JsonValue(r'PRESENCIAL')
PRESENCIAL(r'PRESENCIAL'),
@JsonValue(r'HIBRIDO')
HIBRIDO(r'HIBRIDO'),
@JsonValue(r'REMOTO')
REMOTO(r'REMOTO');

const CreateJobDtoWorkModeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum CreateJobDtoSeniorityEnum {
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

const CreateJobDtoSeniorityEnum(this.value);

final String value;

@override
String toString() => value;
}


enum CreateJobDtoContractTypeEnum {
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

const CreateJobDtoContractTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


