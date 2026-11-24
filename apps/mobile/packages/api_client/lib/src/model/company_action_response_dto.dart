//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_action_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyActionResponseDto {
  /// Returns a new [CompanyActionResponseDto] instance.
  CompanyActionResponseDto({

    required  this.message,

     this.closedJobsCount,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'closedJobsCount',
    required: false,
    includeIfNull: false,
  )


  final int? closedJobsCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyActionResponseDto &&
      other.message == message &&
      other.closedJobsCount == closedJobsCount;

    @override
    int get hashCode =>
        message.hashCode +
        closedJobsCount.hashCode;

  factory CompanyActionResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyActionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyActionResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

