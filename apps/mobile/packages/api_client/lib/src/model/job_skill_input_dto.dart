//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_skill_input_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobSkillInputDto {
  /// Returns a new [JobSkillInputDto] instance.
  JobSkillInputDto({

    required  this.skillId,

    required  this.requirementType,

     this.weight = 5,

     this.minimumLevel,
  });

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


  final JobSkillInputDtoRequirementTypeEnum requirementType;



          // minimum: 1
          // maximum: 10
  @JsonKey(
    defaultValue: 5,
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


  final JobSkillInputDtoMinimumLevelEnum? minimumLevel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobSkillInputDto &&
      other.skillId == skillId &&
      other.requirementType == requirementType &&
      other.weight == weight &&
      other.minimumLevel == minimumLevel;

    @override
    int get hashCode =>
        skillId.hashCode +
        requirementType.hashCode +
        weight.hashCode +
        minimumLevel.hashCode;

  factory JobSkillInputDto.fromJson(Map<String, dynamic> json) => _$JobSkillInputDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobSkillInputDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JobSkillInputDtoRequirementTypeEnum {
@JsonValue(r'REQUIRED')
REQUIRED(r'REQUIRED'),
@JsonValue(r'DESIRABLE')
DESIRABLE(r'DESIRABLE');

const JobSkillInputDtoRequirementTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobSkillInputDtoMinimumLevelEnum {
@JsonValue(r'BEGINNER')
BEGINNER(r'BEGINNER'),
@JsonValue(r'INTERMEDIATE')
INTERMEDIATE(r'INTERMEDIATE'),
@JsonValue(r'ADVANCED')
ADVANCED(r'ADVANCED'),
@JsonValue(r'EXPERT')
EXPERT(r'EXPERT');

const JobSkillInputDtoMinimumLevelEnum(this.value);

final String value;

@override
String toString() => value;
}


