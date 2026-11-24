//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggest_skill_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuggestSkillDto {
  /// Returns a new [SuggestSkillDto] instance.
  SuggestSkillDto({

    required  this.name,

    required  this.category,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final String category;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SuggestSkillDto &&
      other.name == name &&
      other.category == category;

    @override
    int get hashCode =>
        name.hashCode +
        category.hashCode;

  factory SuggestSkillDto.fromJson(Map<String, dynamic> json) => _$SuggestSkillDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestSkillDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

