//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presign_company_logo_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PresignCompanyLogoDto {
  /// Returns a new [PresignCompanyLogoDto] instance.
  PresignCompanyLogoDto({

    required  this.fileName,

    required  this.mimeType,

    required  this.sizeBytes,
  });

  @JsonKey(
    
    name: r'fileName',
    required: true,
    includeIfNull: false,
  )


  final String fileName;



  @JsonKey(
    
    name: r'mimeType',
    required: true,
    includeIfNull: false,
  )


  final String mimeType;



  @JsonKey(
    
    name: r'sizeBytes',
    required: true,
    includeIfNull: false,
  )


  final num sizeBytes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PresignCompanyLogoDto &&
      other.fileName == fileName &&
      other.mimeType == mimeType &&
      other.sizeBytes == sizeBytes;

    @override
    int get hashCode =>
        fileName.hashCode +
        mimeType.hashCode +
        sizeBytes.hashCode;

  factory PresignCompanyLogoDto.fromJson(Map<String, dynamic> json) => _$PresignCompanyLogoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PresignCompanyLogoDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

