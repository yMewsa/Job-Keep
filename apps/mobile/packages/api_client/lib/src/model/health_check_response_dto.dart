//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'health_check_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HealthCheckResponseDto {
  /// Returns a new [HealthCheckResponseDto] instance.
  HealthCheckResponseDto({

    required  this.status,

    required  this.service,

    required  this.timestamp,

    required  this.checks,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final String status;



  @JsonKey(
    
    name: r'service',
    required: true,
    includeIfNull: false,
  )


  final String service;



  @JsonKey(
    
    name: r'timestamp',
    required: true,
    includeIfNull: false,
  )


  final String timestamp;



  @JsonKey(
    
    name: r'checks',
    required: true,
    includeIfNull: false,
  )


  final Object checks;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HealthCheckResponseDto &&
      other.status == status &&
      other.service == service &&
      other.timestamp == timestamp &&
      other.checks == checks;

    @override
    int get hashCode =>
        status.hashCode +
        service.hashCode +
        timestamp.hashCode +
        checks.hashCode;

  factory HealthCheckResponseDto.fromJson(Map<String, dynamic> json) => _$HealthCheckResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

