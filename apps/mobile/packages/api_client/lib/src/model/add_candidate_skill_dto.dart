//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_candidate_skill_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddCandidateSkillDto {
  /// Returns a new [AddCandidateSkillDto] instance.
  AddCandidateSkillDto({

    required  this.skillId,

    required  this.level,

    required  this.yearsOfExperience,
  });

  @JsonKey(
    
    name: r'skillId',
    required: true,
    includeIfNull: false,
  )


  final String skillId;



  @JsonKey(
    
    name: r'level',
    required: true,
    includeIfNull: false,
  )


  final AddCandidateSkillDtoLevelEnum level;



  @JsonKey(
    
    name: r'yearsOfExperience',
    required: true,
    includeIfNull: false,
  )


  final num yearsOfExperience;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddCandidateSkillDto &&
      other.skillId == skillId &&
      other.level == level &&
      other.yearsOfExperience == yearsOfExperience;

    @override
    int get hashCode =>
        skillId.hashCode +
        level.hashCode +
        yearsOfExperience.hashCode;

  factory AddCandidateSkillDto.fromJson(Map<String, dynamic> json) => _$AddCandidateSkillDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddCandidateSkillDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum AddCandidateSkillDtoLevelEnum {
@JsonValue(r'BEGINNER')
BEGINNER(r'BEGINNER'),
@JsonValue(r'INTERMEDIATE')
INTERMEDIATE(r'INTERMEDIATE'),
@JsonValue(r'ADVANCED')
ADVANCED(r'ADVANCED'),
@JsonValue(r'EXPERT')
EXPERT(r'EXPERT');

const AddCandidateSkillDtoLevelEnum(this.value);

final String value;

@override
String toString() => value;
}


