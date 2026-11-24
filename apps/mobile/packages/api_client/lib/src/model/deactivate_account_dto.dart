//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deactivate_account_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeactivateAccountDto {
  /// Returns a new [DeactivateAccountDto] instance.
  DeactivateAccountDto({

    required  this.password,

     this.reason,
  });

  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'reason',
    required: false,
    includeIfNull: false,
  )


  final String? reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeactivateAccountDto &&
      other.password == password &&
      other.reason == reason;

    @override
    int get hashCode =>
        password.hashCode +
        reason.hashCode;

  factory DeactivateAccountDto.fromJson(Map<String, dynamic> json) => _$DeactivateAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeactivateAccountDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

