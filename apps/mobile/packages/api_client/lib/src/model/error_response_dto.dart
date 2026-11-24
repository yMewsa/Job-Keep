//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/error_detail_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorResponseDto {
  /// Returns a new [ErrorResponseDto] instance.
  ErrorResponseDto({

    required  this.statusCode,

    required  this.errorCode,

    required  this.message,

     this.details,

    required  this.timestamp,

    required  this.path,

    required  this.requestId,
  });

  @JsonKey(
    
    name: r'statusCode',
    required: true,
    includeIfNull: false,
  )


  final num statusCode;



  @JsonKey(
    
    name: r'errorCode',
    required: true,
    includeIfNull: false,
  )


  final String errorCode;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'details',
    required: false,
    includeIfNull: false,
  )


  final List<ErrorDetailDto>? details;



  @JsonKey(
    
    name: r'timestamp',
    required: true,
    includeIfNull: false,
  )


  final String timestamp;



  @JsonKey(
    
    name: r'path',
    required: true,
    includeIfNull: false,
  )


  final String path;



  @JsonKey(
    
    name: r'requestId',
    required: true,
    includeIfNull: false,
  )


  final String requestId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ErrorResponseDto &&
      other.statusCode == statusCode &&
      other.errorCode == errorCode &&
      other.message == message &&
      other.details == details &&
      other.timestamp == timestamp &&
      other.path == path &&
      other.requestId == requestId;

    @override
    int get hashCode =>
        statusCode.hashCode +
        errorCode.hashCode +
        message.hashCode +
        details.hashCode +
        timestamp.hashCode +
        path.hashCode +
        requestId.hashCode;

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) => _$ErrorResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

