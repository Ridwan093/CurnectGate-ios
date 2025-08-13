// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_permissions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdPermissionsImpl _$$HouseholdPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdPermissionsImpl(
      gateAccess: json['gateAccess'] == null
          ? null
          : FacilityAccess.fromJson(json['gateAccess'] as Map<String, dynamic>),
      nightAccess: json['nightAccess'] == null
          ? null
          : NightAccess.fromJson(json['nightAccess'] as Map<String, dynamic>),
      facilityAccess: json['facilityAccess'] == null
          ? null
          : FacilityAccess.fromJson(
              json['facilityAccess'] as Map<String, dynamic>),
      visitorInvitation: json['visitorInvitation'] == null
          ? null
          : FacilityAccess.fromJson(
              json['visitorInvitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HouseholdPermissionsImplToJson(
        _$HouseholdPermissionsImpl instance) =>
    <String, dynamic>{
      'gateAccess': instance.gateAccess,
      'nightAccess': instance.nightAccess,
      'facilityAccess': instance.facilityAccess,
      'visitorInvitation': instance.visitorInvitation,
    };
