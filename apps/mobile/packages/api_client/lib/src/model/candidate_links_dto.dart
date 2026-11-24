//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate_links_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CandidateLinksDto {
  /// Returns a new [CandidateLinksDto] instance.
  CandidateLinksDto({

     this.linkedin,

     this.github,

     this.portfolio,
  });

  @JsonKey(
    
    name: r'linkedin',
    required: false,
    includeIfNull: false,
  )


  final String? linkedin;



  @JsonKey(
    
    name: r'github',
    required: false,
    includeIfNull: false,
  )


  final String? github;



  @JsonKey(
    
    name: r'portfolio',
    required: false,
    includeIfNull: false,
  )


  final String? portfolio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CandidateLinksDto &&
      other.linkedin == linkedin &&
      other.github == github &&
      other.portfolio == portfolio;

    @override
    int get hashCode =>
        linkedin.hashCode +
        github.hashCode +
        portfolio.hashCode;

  factory CandidateLinksDto.fromJson(Map<String, dynamic> json) => _$CandidateLinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateLinksDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

