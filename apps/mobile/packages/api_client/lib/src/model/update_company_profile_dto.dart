//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_company_profile_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCompanyProfileDto {
  /// Returns a new [UpdateCompanyProfileDto] instance.
  UpdateCompanyProfileDto({

     this.tradeName,

     this.sector,

     this.size,

     this.description,

     this.websiteUrl,

     this.city,

     this.state,
  });

  @JsonKey(
    
    name: r'tradeName',
    required: false,
    includeIfNull: false,
  )


  final String? tradeName;



  @JsonKey(
    
    name: r'sector',
    required: false,
    includeIfNull: false,
  )


  final String? sector;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final UpdateCompanyProfileDtoSizeEnum? size;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'websiteUrl',
    required: false,
    includeIfNull: false,
  )


  final String? websiteUrl;



  @JsonKey(
    
    name: r'city',
    required: false,
    includeIfNull: false,
  )


  final String? city;



  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final String? state;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCompanyProfileDto &&
      other.tradeName == tradeName &&
      other.sector == sector &&
      other.size == size &&
      other.description == description &&
      other.websiteUrl == websiteUrl &&
      other.city == city &&
      other.state == state;

    @override
    int get hashCode =>
        tradeName.hashCode +
        sector.hashCode +
        size.hashCode +
        description.hashCode +
        websiteUrl.hashCode +
        city.hashCode +
        state.hashCode;

  factory UpdateCompanyProfileDto.fromJson(Map<String, dynamic> json) => _$UpdateCompanyProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCompanyProfileDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UpdateCompanyProfileDtoSizeEnum {
@JsonValue(r'MICRO')
MICRO(r'MICRO'),
@JsonValue(r'SMALL')
SMALL(r'SMALL'),
@JsonValue(r'MEDIUM')
MEDIUM(r'MEDIUM'),
@JsonValue(r'LARGE')
LARGE(r'LARGE'),
@JsonValue(r'ENTERPRISE')
ENTERPRISE(r'ENTERPRISE');

const UpdateCompanyProfileDtoSizeEnum(this.value);

final String value;

@override
String toString() => value;
}


