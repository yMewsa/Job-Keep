//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_deletion_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobDeletionResponseDto {
  /// Returns a new [JobDeletionResponseDto] instance.
  JobDeletionResponseDto({

    required  this.message,

    required  this.status,

     this.deletedAt,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final JobDeletionResponseDtoStatusEnum status;



  @JsonKey(
    
    name: r'deletedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? deletedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobDeletionResponseDto &&
      other.message == message &&
      other.status == status &&
      other.deletedAt == deletedAt;

    @override
    int get hashCode =>
        message.hashCode +
        status.hashCode +
        (deletedAt == null ? 0 : deletedAt.hashCode);

  factory JobDeletionResponseDto.fromJson(Map<String, dynamic> json) => _$JobDeletionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobDeletionResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JobDeletionResponseDtoStatusEnum {
@JsonValue(r'DRAFT')
DRAFT(r'DRAFT'),
@JsonValue(r'ACTIVE')
ACTIVE(r'ACTIVE'),
@JsonValue(r'PAUSED')
PAUSED(r'PAUSED'),
@JsonValue(r'CLOSED')
CLOSED(r'CLOSED');

const JobDeletionResponseDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


