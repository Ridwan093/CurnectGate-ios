import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_access_model.dart';
import 'night_access_model.dart';

part 'household_permissions_model.freezed.dart';
part 'household_permissions_model.g.dart';

@freezed
class HouseholdPermissions with _$HouseholdPermissions {
   @JsonSerializable(explicitToJson: true)
  const factory HouseholdPermissions({
    FacilityAccess? gateAccess,
    NightAccess? nightAccess,
    FacilityAccess? facilityAccess,
    FacilityAccess? visitorInvitation,
  }) = _HouseholdPermissions;

  factory HouseholdPermissions.fromJson(Map<String, dynamic> json) =>
      _$HouseholdPermissionsFromJson(json);

  factory HouseholdPermissions.fromSafeJson(Map<String, dynamic> json) {
    return HouseholdPermissions.fromJson({
      ...json,
      'gate_access':
          NullSafetyHelper.safeModel(
            json['gate_access'],
            FacilityAccess.fromJson,
            null,
          )?.toJson(),
      'night_access':
          NullSafetyHelper.safeModel(
            json['night_access'],
            NightAccess.fromJson,
            null,
          )?.toJson(),
      'facility_access':
          NullSafetyHelper.safeModel(
            json['facility_access'],
            FacilityAccess.fromJson,
            null,
          )?.toJson(),
      'visitor_invitation':
          NullSafetyHelper.safeModel(
            json['visitor_invitation'],
            FacilityAccess.fromJson,
            null,
          )?.toJson(),
    });
  }
}
