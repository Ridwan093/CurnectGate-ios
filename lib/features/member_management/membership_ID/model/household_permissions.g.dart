// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdPermissionsImpl _$$HouseholdPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdPermissionsImpl(
      gateAccess: json['gate_access'] == null
          ? null
          : GateAccess.fromJson(json['gate_access'] as Map<String, dynamic>),
      nightAccess: json['night_access'] == null
          ? null
          : NightAccess.fromJson(json['night_access'] as Map<String, dynamic>),
      facilityAccess: json['facility_access'] == null
          ? null
          : FacilityAccess.fromJson(
              json['facility_access'] as Map<String, dynamic>),
      visitorInvitation: json['visitor_invitation'] == null
          ? null
          : VisitorInvitation.fromJson(
              json['visitor_invitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HouseholdPermissionsImplToJson(
        _$HouseholdPermissionsImpl instance) =>
    <String, dynamic>{
      'gate_access': instance.gateAccess?.toJson(),
      'night_access': instance.nightAccess?.toJson(),
      'facility_access': instance.facilityAccess?.toJson(),
      'visitor_invitation': instance.visitorInvitation?.toJson(),
    };
