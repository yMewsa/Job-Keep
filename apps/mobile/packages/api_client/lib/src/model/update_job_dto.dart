//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/job_skill_input_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_job_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateJobDto {
  /// Returns a new [UpdateJobDto] instance.
  UpdateJobDto({

     this.title,

     this.description,

     this.requirements,

     this.area,

     this.city,

     this.state,

     this.workMode,

     this.salaryMin,

     this.salaryMax,

     this.benefits,

     this.seniority,

     this.contractType,

     this.responseDeadlineDays = 14,

     this.skills,
  });

  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'requirements',
    required: false,
    includeIfNull: false,
  )


  final String? requirements;



  @JsonKey(
    
    name: r'area',
    required: false,
    includeIfNull: false,
  )


  final String? area;



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
    required: false,
    includeIfNull: false,
  )


  final UpdateJobDtoWorkModeEnum? workMode;



      /// Valor em centavos de real
  @JsonKey(
    
    name: r'salaryMin',
    required: false,
    includeIfNull: false,
  )


  final int? salaryMin;



      /// Valor em centavos de real
  @JsonKey(
    
    name: r'salaryMax',
    required: false,
    includeIfNull: false,
  )


  final int? salaryMax;



  @JsonKey(
    
    name: r'benefits',
    required: false,
    includeIfNull: false,
  )


  final List<String>? benefits;



  @JsonKey(
    
    name: r'seniority',
    required: false,
    includeIfNull: false,
  )


  final UpdateJobDtoSeniorityEnum? seniority;



  @JsonKey(
    
    name: r'contractType',
    required: false,
    includeIfNull: false,
  )


  final UpdateJobDtoContractTypeEnum? contractType;



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
    bool operator ==(Object other) => identical(this, other) || other is UpdateJobDto &&
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

  factory UpdateJobDto.fromJson(Map<String, dynamic> json) => _$UpdateJobDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateJobDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UpdateJobDtoWorkModeEnum {
@JsonValue(r'PRESENCIAL')
PRESENCIAL(r'PRESENCIAL'),
@JsonValue(r'HIBRIDO')
HIBRIDO(r'HIBRIDO'),
@JsonValue(r'REMOTO')
REMOTO(r'REMOTO');

const UpdateJobDtoWorkModeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum UpdateJobDtoSeniorityEnum {
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

const UpdateJobDtoSeniorityEnum(this.value);

final String value;

@override
String toString() => value;
}


enum UpdateJobDtoContractTypeEnum {
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

const UpdateJobDtoContractTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


