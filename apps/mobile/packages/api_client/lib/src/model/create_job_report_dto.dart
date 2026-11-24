//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_job_report_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateJobReportDto {
  /// Returns a new [CreateJobReportDto] instance.
  CreateJobReportDto({

    required  this.reason,

     this.description,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final CreateJobReportDtoReasonEnum reason;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateJobReportDto &&
      other.reason == reason &&
      other.description == description;

    @override
    int get hashCode =>
        reason.hashCode +
        description.hashCode;

  factory CreateJobReportDto.fromJson(Map<String, dynamic> json) => _$CreateJobReportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateJobReportDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum CreateJobReportDtoReasonEnum {
@JsonValue(r'FAKE_JOB')
FAKE_JOB(r'FAKE_JOB'),
@JsonValue(r'MISLEADING_SALARY')
MISLEADING_SALARY(r'MISLEADING_SALARY'),
@JsonValue(r'DISCRIMINATION')
DISCRIMINATION(r'DISCRIMINATION'),
@JsonValue(r'HARASSMENT')
HARASSMENT(r'HARASSMENT'),
@JsonValue(r'SPAM')
SPAM(r'SPAM'),
@JsonValue(r'OTHER')
OTHER(r'OTHER');

const CreateJobReportDtoReasonEnum(this.value);

final String value;

@override
String toString() => value;
}


