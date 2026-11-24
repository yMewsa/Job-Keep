//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_education_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateEducationDto {
  /// Returns a new [CreateEducationDto] instance.
  CreateEducationDto({

    required  this.institution,

    required  this.degree,

    required  this.fieldOfStudy,

    required  this.status,

    required  this.startDate,

     this.endDate,

    required  this.isCurrent,
  });

  @JsonKey(
    
    name: r'institution',
    required: true,
    includeIfNull: false,
  )


  final String institution;



  @JsonKey(
    
    name: r'degree',
    required: true,
    includeIfNull: false,
  )


  final String degree;



  @JsonKey(
    
    name: r'fieldOfStudy',
    required: true,
    includeIfNull: false,
  )


  final String fieldOfStudy;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final CreateEducationDtoStatusEnum status;



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
    bool operator ==(Object other) => identical(this, other) || other is CreateEducationDto &&
      other.institution == institution &&
      other.degree == degree &&
      other.fieldOfStudy == fieldOfStudy &&
      other.status == status &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.isCurrent == isCurrent;

    @override
    int get hashCode =>
        institution.hashCode +
        degree.hashCode +
        fieldOfStudy.hashCode +
        status.hashCode +
        startDate.hashCode +
        endDate.hashCode +
        isCurrent.hashCode;

  factory CreateEducationDto.fromJson(Map<String, dynamic> json) => _$CreateEducationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEducationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CreateEducationDtoStatusEnum {
@JsonValue(r'IN_PROGRESS')
IN_PROGRESS(r'IN_PROGRESS'),
@JsonValue(r'COMPLETED')
COMPLETED(r'COMPLETED'),
@JsonValue(r'PAUSED')
PAUSED(r'PAUSED');

const CreateEducationDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


