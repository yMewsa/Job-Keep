//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_experience_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateExperienceDto {
  /// Returns a new [CreateExperienceDto] instance.
  CreateExperienceDto({

    required  this.companyName,

    required  this.title,

     this.description,

     this.workMode,

     this.location,

    required  this.startDate,

     this.endDate,

    required  this.isCurrent,
  });

  @JsonKey(
    
    name: r'companyName',
    required: true,
    includeIfNull: false,
  )


  final String companyName;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'workMode',
    required: false,
    includeIfNull: false,
  )


  final CreateExperienceDtoWorkModeEnum? workMode;



  @JsonKey(
    
    name: r'location',
    required: false,
    includeIfNull: false,
  )


  final String? location;



  @JsonKey(
    
    name: r'startDate',
    required: true,
    includeIfNull: false,
  )


  final String startDate;



  @JsonKey(
    
    name: r'endDate',
    required: false,
    includeIfNull: false,
  )


  final String? endDate;



  @JsonKey(
    
    name: r'isCurrent',
    required: true,
    includeIfNull: false,
  )


  final bool isCurrent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateExperienceDto &&
      other.companyName == companyName &&
      other.title == title &&
      other.description == description &&
      other.workMode == workMode &&
      other.location == location &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.isCurrent == isCurrent;

    @override
    int get hashCode =>
        companyName.hashCode +
        title.hashCode +
        description.hashCode +
        workMode.hashCode +
        location.hashCode +
        startDate.hashCode +
        endDate.hashCode +
        isCurrent.hashCode;

  factory CreateExperienceDto.fromJson(Map<String, dynamic> json) => _$CreateExperienceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExperienceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CreateExperienceDtoWorkModeEnum {
@JsonValue(r'PRESENCIAL')
PRESENCIAL(r'PRESENCIAL'),
@JsonValue(r'HIBRIDO')
HIBRIDO(r'HIBRIDO'),
@JsonValue(r'REMOTO')
REMOTO(r'REMOTO');

const CreateExperienceDtoWorkModeEnum(this.value);

final String value;

@override
String toString() => value;
}


