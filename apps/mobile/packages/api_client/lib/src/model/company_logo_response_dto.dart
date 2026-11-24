//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_logo_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyLogoResponseDto {
  /// Returns a new [CompanyLogoResponseDto] instance.
  CompanyLogoResponseDto({

    required  this.logoUrl,
  });

  @JsonKey(
    
    name: r'logoUrl',
    required: true,
    includeIfNull: false,
  )


  final String logoUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyLogoResponseDto &&
      other.logoUrl == logoUrl;

    @override
    int get hashCode =>
        logoUrl.hashCode;

  factory CompanyLogoResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyLogoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyLogoResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

