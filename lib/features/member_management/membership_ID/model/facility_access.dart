import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'facility_access.freezed.dart';
part 'facility_access.g.dart';

@freezed
class FacilityAccess with _$FacilityAccess {
  @JsonSerializable()
  const factory FacilityAccess({
    required bool enabled,
  }) = _FacilityAccess;

  factory FacilityAccess.fromJson(Map<String, dynamic> json) =>
      _$FacilityAccessFromJson(json);

  factory FacilityAccess.safeFromJson(Map<String, dynamic>? json) =>
      FacilityAccess(
        enabled: NullSafetyHelper.safeBool(json?['enabled']),
      );
       factory FacilityAccess.empty() {
    return FacilityAccess(enabled: false);
  }
}
