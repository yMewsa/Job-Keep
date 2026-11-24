//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_job_status_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChangeJobStatusDto {
  /// Returns a new [ChangeJobStatusDto] instance.
  ChangeJobStatusDto({

    required  this.status,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final ChangeJobStatusDtoStatusEnum status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChangeJobStatusDto &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory ChangeJobStatusDto.fromJson(Map<String, dynamic> json) => _$ChangeJobStatusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeJobStatusDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum ChangeJobStatusDtoStatusEnum {
@JsonValue(r'DRAFT')
DRAFT(r'DRAFT'),
@JsonValue(r'ACTIVE')
ACTIVE(r'ACTIVE'),
@JsonValue(r'PAUSED')
PAUSED(r'PAUSED'),
@JsonValue(r'CLOSED')
CLOSED(r'CLOSED');

const ChangeJobStatusDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


