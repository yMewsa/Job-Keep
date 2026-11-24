//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_education_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateEducationDto {
  /// Returns a new [UpdateEducationDto] instance.
  UpdateEducationDto({

     this.institution,

     this.degree,

     this.fieldOfStudy,

     this.status,

     this.startDate,

     this.endDate,

     this.isCurrent,
  });

  @JsonKey(
    
    name: r'institution',
    required: false,
    includeIfNull: false,
  )


  final String? institution;



  @JsonKey(
    
    name: r'degree',
    required: false,
    includeIfNull: false,
  )


  final String? degree;



  @JsonKey(
    
    name: r'fieldOfStudy',
    required: false,
    includeIfNull: false,
  )


  final String? fieldOfStudy;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final UpdateEducationDtoStatusEnum? status;



  @JsonKey(
    
    name: r'startDate',
    required: false,
    includeIfNull: false,
  )


  final String? startDate;



  @JsonKey(
    
    name: r'endDate',
    required: false,
    includeIfNull: false,
  )


  final String? endDate;



  @JsonKey(
    
    name: r'isCurrent',
    required: false,
    includeIfNull: false,
  )


  final bool? isCurrent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateEducationDto &&
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

  factory UpdateEducationDto.fromJson(Map<String, dynamic> json) => _$UpdateEducationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEducationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UpdateEducationDtoStatusEnum {
@JsonValue(r'IN_PROGRESS')
IN_PROGRESS(r'IN_PROGRESS'),
@JsonValue(r'COMPLETED')
COMPLETED(r'COMPLETED'),
@JsonValue(r'PAUSED')
PAUSED(r'PAUSED');

const UpdateEducationDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


