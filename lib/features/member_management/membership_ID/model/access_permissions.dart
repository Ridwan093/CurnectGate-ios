import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'access_permissions.freezed.dart';
part 'access_permissions.g.dart';

@freezed
class AccessPermissions with _$AccessPermissions {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory AccessPermissions({
    @JsonKey(name: 'gate_access') bool? gateAccess,
    @JsonKey(name: 'night_access') bool? nightAccess,
    @JsonKey(name: 'facility_access') bool? facilityAccess,
    @JsonKey(name: 'emergency_access') bool? emergencyAccess,
  }) = _AccessPermissions;

  factory AccessPermissions.fromJson(Map<String, dynamic> json) =>
      _$AccessPermissionsFromJson(json);

  factory AccessPermissions.safeFromJson(Map<String, dynamic>? json) {
    return AccessPermissions(
      gateAccess: NullSafetyHelper.safeBool(json?['gate_access']),
      nightAccess: NullSafetyHelper.safeBool(json?['night_access']),
      facilityAccess: NullSafetyHelper.safeBool(json?['facility_access']),
      emergencyAccess: NullSafetyHelper.safeBool(json?['emergency_access']),
    );
  }

  // Default instance with all values set to false
  factory AccessPermissions.defaults() => const AccessPermissions(
        gateAccess: false,
        nightAccess: false,
        facilityAccess: false,
        emergencyAccess: false,
      );
}