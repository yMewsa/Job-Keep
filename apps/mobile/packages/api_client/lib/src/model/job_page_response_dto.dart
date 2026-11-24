//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/job_response_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_page_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JobPageResponseDto {
  /// Returns a new [JobPageResponseDto] instance.
  JobPageResponseDto({

    required  this.items,

    required  this.total,

    required  this.page,

    required  this.limit,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<JobResponseDto> items;



  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;



  @JsonKey(
    
    name: r'page',
    required: true,
    includeIfNull: false,
  )


  final int page;



  @JsonKey(
    
    name: r'limit',
    required: true,
    includeIfNull: false,
  )


  final int limit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JobPageResponseDto &&
      other.items == items &&
      other.total == total &&
      other.page == page &&
      other.limit == limit;

    @override
    int get hashCode =>
        items.hashCode +
        total.hashCode +
        page.hashCode +
        limit.hashCode;

  factory JobPageResponseDto.fromJson(Map<String, dynamic> json) => _$JobPageResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobPageResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

