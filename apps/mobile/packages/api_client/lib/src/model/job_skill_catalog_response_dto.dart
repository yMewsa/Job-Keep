//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_skill_catalog_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobSkillCatalogResponseDto {
  /// Returns a new [JobSkillCatalogResponseDto] instance.
  JobSkillCatalogResponseDto({

    required  this.id,

    required  this.name,

    required  this.slug,

    required  this.category,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'slug',
    required: true,
    includeIfNull: false,
  )


  final String slug;



  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final String category;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobSkillCatalogResponseDto &&
      other.id == id &&
      other.name == name &&
      other.slug == slug &&
      other.category == category;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        slug.hashCode +
        category.hashCode;

  factory JobSkillCatalogResponseDto.fromJson(Map<String, dynamic> json) => _$JobSkillCatalogResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobSkillCatalogResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

