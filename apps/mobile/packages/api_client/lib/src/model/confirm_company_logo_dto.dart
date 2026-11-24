//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_company_logo_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfirmCompanyLogoDto {
  /// Returns a new [ConfirmCompanyLogoDto] instance.
  ConfirmCompanyLogoDto({

    required  this.fileKey,
  });

  @JsonKey(
    
    name: r'fileKey',
    required: true,
    includeIfNull: false,
  )


  final String fileKey;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfirmCompanyLogoDto &&
      other.fileKey == fileKey;

    @override
    int get hashCode =>
        fileKey.hashCode;

  factory ConfirmCompanyLogoDto.fromJson(Map<String, dynamic> json) => _$ConfirmCompanyLogoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmCompanyLogoDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

