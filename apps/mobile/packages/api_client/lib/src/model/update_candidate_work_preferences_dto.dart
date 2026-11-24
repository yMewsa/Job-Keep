//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_candidate_work_preferences_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCandidateWorkPreferencesDto {
  /// Returns a new [UpdateCandidateWorkPreferencesDto] instance.
  UpdateCandidateWorkPreferencesDto({

     this.acceptedWorkModes,

     this.acceptedContractTypes,

     this.acceptedCities,

     this.acceptedStates,

     this.areasOfInterest,

     this.salaryExpectationMin,

     this.salaryExpectationMax,

     this.availability,
  });

  @JsonKey(
    
    name: r'acceptedWorkModes',
    required: false,
    includeIfNull: false,
  )


  final List<UpdateCandidateWorkPreferencesDtoAcceptedWorkModesEnum>? acceptedWorkModes;



  @JsonKey(
    
    name: r'acceptedContractTypes',
    required: false,
    includeIfNull: false,
  )


  final List<UpdateCandidateWorkPreferencesDtoAcceptedContractTypesEnum>? acceptedContractTypes;



  @JsonKey(
    
    name: r'acceptedCities',
    required: false,
    includeIfNull: false,
  )


  final List<String>? acceptedCities;



  @JsonKey(
    
    name: r'acceptedStates',
    required: false,
    includeIfNull: false,
  )


  final List<String>? acceptedStates;



  @JsonKey(
    
    name: r'areasOfInterest',
    required: false,
    includeIfNull: false,
  )


  final List<String>? areasOfInterest;



      /// Pretensao salarial minima em centavos BRL.
  @JsonKey(
    
    name: r'salaryExpectationMin',
    required: false,
    includeIfNull: false,
  )


  final num? salaryExpectationMin;



      /// Pretensao salarial maxima em centavos BRL.
  @JsonKey(
    
    name: r'salaryExpectationMax',
    required: false,
    includeIfNull: false,
  )


  final num? salaryExpectationMax;



  @JsonKey(
    
    name: r'availability',
    required: false,
    includeIfNull: false,
  )


  final UpdateCandidateWorkPreferencesDtoAvailabilityEnum? availability;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCandidateWorkPreferencesDto &&
      other.acceptedWorkModes == acceptedWorkModes &&
      other.acceptedContractTypes == acceptedContractTypes &&
      other.acceptedCities == acceptedCities &&
      other.acceptedStates == acceptedStates &&
      other.areasOfInterest == areasOfInterest &&
      other.salaryExpectationMin == salaryExpectationMin &&
      other.salaryExpectationMax == salaryExpectationMax &&
      other.availability == availability;

    @override
    int get hashCode =>
        acceptedWorkModes.hashCode +
        acceptedContractTypes.hashCode +
        acceptedCities.hashCode +
        acceptedStates.hashCode +
        areasOfInterest.hashCode +
        salaryExpectationMin.hashCode +
        salaryExpectationMax.hashCode +
        availability.hashCode;

  factory UpdateCandidateWorkPreferencesDto.fromJson(Map<String, dynamic> json) => _$UpdateCandidateWorkPreferencesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCandidateWorkPreferencesDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UpdateCandidateWorkPreferencesDtoAcceptedWorkModesEnum {
@JsonValue(r'PRESENCIAL')
PRESENCIAL(r'PRESENCIAL'),
@JsonValue(r'HIBRIDO')
HIBRIDO(r'HIBRIDO'),
@JsonValue(r'REMOTO')
REMOTO(r'REMOTO');

const UpdateCandidateWorkPreferencesDtoAcceptedWorkModesEnum(this.value);

final String value;

@override
String toString() => value;
}


enum UpdateCandidateWorkPreferencesDtoAcceptedContractTypesEnum {
@JsonValue(r'CLT')
CLT(r'CLT'),
@JsonValue(r'PJ')
PJ(r'PJ'),
@JsonValue(r'INTERNSHIP')
INTERNSHIP(r'INTERNSHIP'),
@JsonValue(r'TEMPORARY')
TEMPORARY(r'TEMPORARY'),
@JsonValue(r'FREELANCE')
FREELANCE(r'FREELANCE');

const UpdateCandidateWorkPreferencesDtoAcceptedContractTypesEnum(this.value);

final String value;

@override
String toString() => value;
}


enum UpdateCandidateWorkPreferencesDtoAvailabilityEnum {
@JsonValue(r'IMMEDIATE')
IMMEDIATE(r'IMMEDIATE'),
@JsonValue(r'WITHIN_15_DAYS')
WITHIN_15_DAYS(r'WITHIN_15_DAYS'),
@JsonValue(r'WITHIN_30_DAYS')
WITHIN_30_DAYS(r'WITHIN_30_DAYS'),
@JsonValue(r'NEGOTIABLE')
NEGOTIABLE(r'NEGOTIABLE');

const UpdateCandidateWorkPreferencesDtoAvailabilityEnum(this.value);

final String value;

@override
String toString() => value;
}


