//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MessageResponseDto {
  /// Returns a new [MessageResponseDto] instance.
  MessageResponseDto({

    required  this.message,

     this.devCode,
  });

  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



      /// Retornado apenas em ambiente de desenvolvimento/testes quando MAIL_PROVIDER=console.
  @JsonKey(
    
    name: r'devCode',
    required: false,
    includeIfNull: false,
  )


  final String? devCode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MessageResponseDto &&
      other.message == message &&
      other.devCode == devCode;

    @override
    int get hashCode =>
        message.hashCode +
        devCode.hashCode;

  factory MessageResponseDto.fromJson(Map<String, dynamic> json) => _$MessageResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

