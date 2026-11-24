//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_candidate_visibility_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCandidateVisibilityDto {
  /// Returns a new [UpdateCandidateVisibilityDto] instance.
  UpdateCandidateVisibilityDto({

    required  this.hideFullNameBeforeMatch,

    required  this.hidePhotoBeforeMatch,

    required  this.hideResumeBeforeMatch,

    required  this.hideLinksBeforeMatch,
  });

  @JsonKey(
    
    name: r'hideFullNameBeforeMatch',
    required: true,
    includeIfNull: false,
  )


  final bool hideFullNameBeforeMatch;



  @JsonKey(
    
    name: r'hidePhotoBeforeMatch',
    required: true,
    includeIfNull: false,
  )


  final bool hidePhotoBeforeMatch;



  @JsonKey(
    
    name: r'hideResumeBeforeMatch',
    required: true,
    includeIfNull: false,
  )


  final bool hideResumeBeforeMatch;



  @JsonKey(
    
    name: r'hideLinksBeforeMatch',
    required: true,
    includeIfNull: false,
  )


  final bool hideLinksBeforeMatch;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCandidateVisibilityDto &&
      other.hideFullNameBeforeMatch == hideFullNameBeforeMatch &&
      other.hidePhotoBeforeMatch == hidePhotoBeforeMatch &&
      other.hideResumeBeforeMatch == hideResumeBeforeMatch &&
      other.hideLinksBeforeMatch == hideLinksBeforeMatch;

    @override
    int get hashCode =>
        hideFullNameBeforeMatch.hashCode +
        hidePhotoBeforeMatch.hashCode +
        hideResumeBeforeMatch.hashCode +
        hideLinksBeforeMatch.hashCode;

  factory UpdateCandidateVisibilityDto.fromJson(Map<String, dynamic> json) => _$UpdateCandidateVisibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCandidateVisibilityDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

