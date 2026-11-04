import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gate_access.dart';
import 'night_access.dart';
import 'facility_access.dart';
import 'visitor_invitation.dart';

part 'household_permissions.freezed.dart';
part 'household_permissions.g.dart';

@freezed
class HouseholdPermissions with _$HouseholdPermissions {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory HouseholdPermissions({
    @JsonKey(name: 'gate_access') GateAccess? gateAccess,
    @JsonKey(name: 'night_access') NightAccess? nightAccess,
    @JsonKey(name: 'facility_access') FacilityAccess? facilityAccess,
    @JsonKey(name: 'visitor_invitation') VisitorInvitation? visitorInvitation,
  }) = _HouseholdPermissions;

  factory HouseholdPermissions.fromJson(Map<String, dynamic> json) =>
      _$HouseholdPermissionsFromJson(json);

  factory HouseholdPermissions.safeFromJson(Map<String, dynamic>? json) {
    return HouseholdPermissions(
      gateAccess: NullSafetyHelper.safeModel(
        json?['gate_access'],
        GateAccess.fromJson,
        GateAccess.empty(),
      ),
      nightAccess: NullSafetyHelper.safeModel(
        json?['night_access'],
        NightAccess.fromJson,
        NightAccess.empty(),
      ),
      facilityAccess: NullSafetyHelper.safeModel(
        json?['facility_access'],
        FacilityAccess.fromJson,
        FacilityAccess.empty(),
      ),
      visitorInvitation: NullSafetyHelper.safeModel(
        json?['visitor_invitation'],
        VisitorInvitation.fromJson,
        VisitorInvitation.empty(),
      ),
    );
  }

  factory HouseholdPermissions.empty() => const HouseholdPermissions(
        gateAccess: null,
        nightAccess: null,
        facilityAccess: null,
        visitorInvitation: null,
      );

  factory HouseholdPermissions.withDefaults() => HouseholdPermissions(
        gateAccess: GateAccess.empty(),
        nightAccess: NightAccess.empty(),
        facilityAccess: FacilityAccess.empty(),
        visitorInvitation: VisitorInvitation.empty(),
      );
}