//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_only_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EmailOnlyDto {
  /// Returns a new [EmailOnlyDto] instance.
  EmailOnlyDto({

    required  this.email,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EmailOnlyDto &&
      other.email == email;

    @override
    int get hashCode =>
        email.hashCode;

  factory EmailOnlyDto.fromJson(Map<String, dynamic> json) => _$EmailOnlyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmailOnlyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

