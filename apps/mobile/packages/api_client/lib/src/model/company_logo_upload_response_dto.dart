//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_logo_upload_response_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CompanyLogoUploadResponseDto {
  /// Returns a new [CompanyLogoUploadResponseDto] instance.
  CompanyLogoUploadResponseDto({

    required  this.uploadUrl,

    required  this.fileKey,

    required  this.publicUrl,

    required  this.expiresInSeconds,
  });

  @JsonKey(
    
    name: r'uploadUrl',
    required: true,
    includeIfNull: false,
  )


  final String uploadUrl;



  @JsonKey(
    
    name: r'fileKey',
    required: true,
    includeIfNull: false,
  )


  final String fileKey;



  @JsonKey(
    
    name: r'publicUrl',
    required: true,
    includeIfNull: false,
  )


  final String publicUrl;



  @JsonKey(
    
    name: r'expiresInSeconds',
    required: true,
    includeIfNull: false,
  )


  final int expiresInSeconds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CompanyLogoUploadResponseDto &&
      other.uploadUrl == uploadUrl &&
      other.fileKey == fileKey &&
      other.publicUrl == publicUrl &&
      other.expiresInSeconds == expiresInSeconds;

    @override
    int get hashCode =>
        uploadUrl.hashCode +
        fileKey.hashCode +
        publicUrl.hashCode +
        expiresInSeconds.hashCode;

  factory CompanyLogoUploadResponseDto.fromJson(Map<String, dynamic> json) => _$CompanyLogoUploadResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyLogoUploadResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

