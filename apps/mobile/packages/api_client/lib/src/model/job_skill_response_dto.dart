//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/job_skill_catalog_response_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_skill_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobSkillResponseDto {
  /// Returns a new [JobSkillResponseDto] instance.
  JobSkillResponseDto({

    required  this.id,

    required  this.skillId,

    required  this.requirementType,

    required  this.weight,

     this.minimumLevel,

    required  this.skill,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'skillId',
    required: true,
    includeIfNull: false,
  )


  final String skillId;



  @JsonKey(
    
    name: r'requirementType',
    required: true,
    includeIfNull: false,
  )


  final JobSkillResponseDtoRequirementTypeEnum requirementType;



          // minimum: 1
          // maximum: 10
  @JsonKey(
    
    name: r'weight',
    required: true,
    includeIfNull: false,
  )


  final int weight;



  @JsonKey(
    
    name: r'minimumLevel',
    required: false,
    includeIfNull: false,
  )


  final JobSkillResponseDtoMinimumLevelEnum? minimumLevel;



  @JsonKey(
    
    name: r'skill',
    required: true,
    includeIfNull: false,
  )


  final JobSkillCatalogResponseDto skill;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobSkillResponseDto &&
      other.id == id &&
      other.skillId == skillId &&
      other.requirementType == requirementType &&
      other.weight == weight &&
      other.minimumLevel == minimumLevel &&
      other.skill == skill;

    @override
    int get hashCode =>
        id.hashCode +
        skillId.hashCode +
        requirementType.hashCode +
        weight.hashCode +
        (minimumLevel == null ? 0 : minimumLevel.hashCode) +
        skill.hashCode;

  factory JobSkillResponseDto.fromJson(Map<String, dynamic> json) => _$JobSkillResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobSkillResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JobSkillResponseDtoRequirementTypeEnum {
@JsonValue(r'REQUIRED')
REQUIRED(r'REQUIRED'),
@JsonValue(r'DESIRABLE')
DESIRABLE(r'DESIRABLE');

const JobSkillResponseDtoRequirementTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobSkillResponseDtoMinimumLevelEnum {
@JsonValue(r'BEGINNER')
BEGINNER(r'BEGINNER'),
@JsonValue(r'INTERMEDIATE')
INTERMEDIATE(r'INTERMEDIATE'),
@JsonValue(r'ADVANCED')
ADVANCED(r'ADVANCED'),
@JsonValue(r'EXPERT')
EXPERT(r'EXPERT');

const JobSkillResponseDtoMinimumLevelEnum(this.value);

final String value;

@override
String toString() => value;
}


