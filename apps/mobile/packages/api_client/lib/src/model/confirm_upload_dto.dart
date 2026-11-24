//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_upload_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfirmUploadDto {
  /// Returns a new [ConfirmUploadDto] instance.
  ConfirmUploadDto({

    required  this.fileKey,

    required  this.originalFileName,
  });

  @JsonKey(
    
    name: r'fileKey',
    required: true,
    includeIfNull: false,
  )


  final String fileKey;



  @JsonKey(
    
    name: r'originalFileName',
    required: true,
    includeIfNull: false,
  )


  final String originalFileName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfirmUploadDto &&
      other.fileKey == fileKey &&
      other.originalFileName == originalFileName;

    @override
    int get hashCode =>
        fileKey.hashCode +
        originalFileName.hashCode;

  factory ConfirmUploadDto.fromJson(Map<String, dynamic> json) => _$ConfirmUploadDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmUploadDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

