//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:job_keep_api_client/src/model/candidate_links_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_candidate_profile_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCandidateProfileDto {
  /// Returns a new [UpdateCandidateProfileDto] instance.
  UpdateCandidateProfileDto({

     this.fullName,

     this.headline,

     this.bio,

     this.city,

     this.state,

     this.professionalArea,

     this.links,
  });

  @JsonKey(
    
    name: r'fullName',
    required: false,
    includeIfNull: false,
  )


  final String? fullName;



  @JsonKey(
    
    name: r'headline',
    required: false,
    includeIfNull: false,
  )


  final String? headline;



  @JsonKey(
    
    name: r'bio',
    required: false,
    includeIfNull: false,
  )


  final String? bio;



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



  @JsonKey(
    
    name: r'professionalArea',
    required: false,
    includeIfNull: false,
  )


  final String? professionalArea;



  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final CandidateLinksDto? links;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCandidateProfileDto &&
      other.fullName == fullName &&
      other.headline == headline &&
      other.bio == bio &&
      other.city == city &&
      other.state == state &&
      other.professionalArea == professionalArea &&
      other.links == links;

    @override
    int get hashCode =>
        fullName.hashCode +
        headline.hashCode +
        bio.hashCode +
        city.hashCode +
        state.hashCode +
        professionalArea.hashCode +
        links.hashCode;

  factory UpdateCandidateProfileDto.fromJson(Map<String, dynamic> json) => _$UpdateCandidateProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCandidateProfileDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

