import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'facility_access.dart';
import 'gateaccess.dart';
import 'nightaccess.dart';
import 'visitorinvitation.dart';
part 'household_permissions_model.freezed.dart';
part 'household_permissions_model.g.dart';

@freezed
class HouseholdPermissions with _$HouseholdPermissions {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory HouseholdPermissions({
    GateAccess? gateAccess,
    NightAccess? nightAccess,
    FacilityAccess? facilityAccess,
    VisitorInvitation? visitorInvitation,
  }) = _HouseholdPermissions;

  factory HouseholdPermissions.fromJson(Map<String, dynamic> json) =>
      _$HouseholdPermissionsFromJson(json);

  factory HouseholdPermissions.fromSafeJson(Map<String, dynamic> json) {
    return HouseholdPermissions(
      gateAccess: NullSafetyHelper.safeModel(
          json['gate_access'], GateAccess.fromSafeJson, GateAccess.empty()),
      nightAccess: NullSafetyHelper.safeModel(
          json['night_access'], NightAccess.fromSafeJson, NightAccess.empty()),
      facilityAccess: NullSafetyHelper.safeModel(
          json['facility_access'], FacilityAccess.fromSafeJson, FacilityAccess.empty()),
      visitorInvitation: NullSafetyHelper.safeModel(
          json['visitor_invitation'], VisitorInvitation.fromSafeJson, VisitorInvitation.empty()),
    );
  }

  factory HouseholdPermissions.empty() => const HouseholdPermissions(
        gateAccess: null,
        nightAccess: null,
        facilityAccess: null,
        visitorInvitation: null,
      );
}



