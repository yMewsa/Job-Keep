//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_dto.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionDto {
  /// Returns a new [SessionDto] instance.
  SessionDto({

    required  this.id,

     this.deviceName,

     this.platform,

     this.ipAddress,

     this.lastUsedAt,

    required  this.createdAt,

    required  this.expiresAt,

    required  this.isCurrent,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'deviceName',
    required: false,
    includeIfNull: false,
  )


  final Object? deviceName;



  @JsonKey(
    
    name: r'platform',
    required: false,
    includeIfNull: false,
  )


  final Object? platform;



  @JsonKey(
    
    name: r'ipAddress',
    required: false,
    includeIfNull: false,
  )


  final Object? ipAddress;



  @JsonKey(
    
    name: r'lastUsedAt',
    required: false,
    includeIfNull: false,
  )


  final Object? lastUsedAt;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'expiresAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'isCurrent',
    required: true,
    includeIfNull: false,
  )


  final bool isCurrent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionDto &&
      other.id == id &&
      other.deviceName == deviceName &&
      other.platform == platform &&
      other.ipAddress == ipAddress &&
      other.lastUsedAt == lastUsedAt &&
      other.createdAt == createdAt &&
      other.expiresAt == expiresAt &&
      other.isCurrent == isCurrent;

    @override
    int get hashCode =>
        id.hashCode +
        (deviceName == null ? 0 : deviceName.hashCode) +
        (platform == null ? 0 : platform.hashCode) +
        (ipAddress == null ? 0 : ipAddress.hashCode) +
        (lastUsedAt == null ? 0 : lastUsedAt.hashCode) +
        createdAt.hashCode +
        expiresAt.hashCode +
        isCurrent.hashCode;

  factory SessionDto.fromJson(Map<String, dynamic> json) => _$SessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

