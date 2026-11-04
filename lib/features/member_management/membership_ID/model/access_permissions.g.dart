// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessPermissionsImpl _$$AccessPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$AccessPermissionsImpl(
      gateAccess: json['gate_access'] as bool?,
      nightAccess: json['night_access'] as bool?,
      facilityAccess: json['facility_access'] as bool?,
      emergencyAccess: json['emergency_access'] as bool?,
    );

Map<String, dynamic> _$$AccessPermissionsImplToJson(
        _$AccessPermissionsImpl instance) =>
    <String, dynamic>{
      'gate_access': instance.gateAccess,
      'night_access': instance.nightAccess,
      'facility_access': instance.facilityAccess,
      'emergency_access': instance.emergencyAccess,
    };
