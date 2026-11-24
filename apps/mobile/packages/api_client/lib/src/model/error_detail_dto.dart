//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_detail_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorDetailDto {
  /// Returns a new [ErrorDetailDto] instance.
  ErrorDetailDto({

    required  this.field,

    required  this.code,

    required  this.message,
  });

  @JsonKey(
    
    name: r'field',
    required: true,
    includeIfNull: false,
  )


  final String field;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ErrorDetailDto &&
      other.field == field &&
      other.code == code &&
      other.message == message;

    @override
    int get hashCode =>
        field.hashCode +
        code.hashCode +
        message.hashCode;

  factory ErrorDetailDto.fromJson(Map<String, dynamic> json) => _$ErrorDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

