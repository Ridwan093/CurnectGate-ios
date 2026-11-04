import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'permissions_summary.freezed.dart';
part 'permissions_summary.g.dart';

@freezed
class PermissionsSummary with _$PermissionsSummary {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory PermissionsSummary({
    @JsonKey(name: 'total_permissions') int? totalPermissions,
    @JsonKey(name: 'active_permissions') List<dynamic>? activePermissions,
    @JsonKey(name: 'detailed_permissions') List<dynamic>? detailedPermissions,
    @JsonKey(name: 'has_gate_access') bool? hasGateAccess,
    @JsonKey(name: 'has_facility_access') bool? hasFacilityAccess,
    @JsonKey(name: 'has_parking_access') bool? hasParkingAccess,
    @JsonKey(name: 'has_visitor_invitation') bool? hasVisitorInvitation,
    @JsonKey(name: 'has_night_access') bool? hasNightAccess,
    @JsonKey(name: 'has_maintenance_request') bool? hasMaintenanceRequest,
  }) = _PermissionsSummary;

  factory PermissionsSummary.fromJson(Map<String, dynamic> json) =>
      _$PermissionsSummaryFromJson(json);

  factory PermissionsSummary.safeFromJson(Map<String, dynamic>? json) {
    return PermissionsSummary(
      totalPermissions: NullSafetyHelper.safeInt(json?['total_permissions']),
      activePermissions: json?['active_permissions'] as List<dynamic>?,
      detailedPermissions: json?['detailed_permissions'] as List<dynamic>?,
      hasGateAccess: NullSafetyHelper.safeBool(json?['has_gate_access']),
      hasFacilityAccess: NullSafetyHelper.safeBool(json?['has_facility_access']),
      hasParkingAccess: NullSafetyHelper.safeBool(json?['has_parking_access']),
      hasVisitorInvitation: NullSafetyHelper.safeBool(json?['has_visitor_invitation']),
      hasNightAccess: NullSafetyHelper.safeBool(json?['has_night_access']),
      hasMaintenanceRequest: NullSafetyHelper.safeBool(json?['has_maintenance_request']),
    );
  }

  factory PermissionsSummary.empty() => const PermissionsSummary(
    totalPermissions: 0,
    activePermissions: [],
    detailedPermissions: [],
    hasGateAccess: false,
    hasFacilityAccess: false,
    hasParkingAccess: false,
    hasVisitorInvitation: false,
    hasNightAccess: false,
    hasMaintenanceRequest: false,
  );
}