//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_report_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobReportResponseDto {
  /// Returns a new [JobReportResponseDto] instance.
  JobReportResponseDto({

    required  this.id,

    required  this.reason,

     this.description,

    required  this.status,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final JobReportResponseDtoReasonEnum reason;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final Object? description;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final JobReportResponseDtoStatusEnum status;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobReportResponseDto &&
      other.id == id &&
      other.reason == reason &&
      other.description == description &&
      other.status == status &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        reason.hashCode +
        (description == null ? 0 : description.hashCode) +
        status.hashCode +
        createdAt.hashCode;

  factory JobReportResponseDto.fromJson(Map<String, dynamic> json) => _$JobReportResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobReportResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JobReportResponseDtoReasonEnum {
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

const JobReportResponseDtoReasonEnum(this.value);

final String value;

@override
String toString() => value;
}


enum JobReportResponseDtoStatusEnum {
@JsonValue(r'OPEN')
OPEN(r'OPEN'),
@JsonValue(r'UNDER_REVIEW')
UNDER_REVIEW(r'UNDER_REVIEW'),
@JsonValue(r'RESOLVED')
RESOLVED(r'RESOLVED'),
@JsonValue(r'DISMISSED')
DISMISSED(r'DISMISSED');

const JobReportResponseDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


