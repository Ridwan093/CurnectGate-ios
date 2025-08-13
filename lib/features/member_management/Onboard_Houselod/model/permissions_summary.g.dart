// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionsSummaryImpl _$$PermissionsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionsSummaryImpl(
      totalPermissions: (json['total_permissions'] as num?)?.toInt(),
      activePermissions: json['active_permissions'] as List<dynamic>?,
      detailedPermissions: json['detailed_permissions'] as List<dynamic>?,
      hasGateAccess: json['has_gate_access'] as bool?,
      hasFacilityAccess: json['has_facility_access'] as bool?,
      hasParkingAccess: json['has_parking_access'] as bool?,
      hasVisitorInvitation: json['has_visitor_invitation'] as bool?,
      hasNightAccess: json['has_night_access'] as bool?,
      hasMaintenanceRequest: json['has_maintenance_request'] as bool?,
    );

Map<String, dynamic> _$$PermissionsSummaryImplToJson(
        _$PermissionsSummaryImpl instance) =>
    <String, dynamic>{
      'total_permissions': instance.totalPermissions,
      'active_permissions': instance.activePermissions,
      'detailed_permissions': instance.detailedPermissions,
      'has_gate_access': instance.hasGateAccess,
      'has_facility_access': instance.hasFacilityAccess,
      'has_parking_access': instance.hasParkingAccess,
      'has_visitor_invitation': instance.hasVisitorInvitation,
      'has_night_access': instance.hasNightAccess,
      'has_maintenance_request': instance.hasMaintenanceRequest,
    };
