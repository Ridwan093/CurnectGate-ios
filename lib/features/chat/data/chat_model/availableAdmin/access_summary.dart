import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'access_summary.freezed.dart';
part 'access_summary.g.dart';

@freezed
class AccessSummary with _$AccessSummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory AccessSummary({
    String? lastGateAccess,
    int? totalAccessAttemptsToday,
    String? currentLocation,
    bool? isCurrentlyInEstate,
  }) = _AccessSummary;

  factory AccessSummary.fromJson(Map<String, dynamic> json) =>
      _$AccessSummaryFromJson(json);

  factory AccessSummary.safeFromJson(Map<String, dynamic>? json) {
    return AccessSummary(
      lastGateAccess:
          NullSafetyHelper.safeString(json?['last_gate_access']),
      totalAccessAttemptsToday:
          NullSafetyHelper.safeInt(json?['total_access_attempts_today']),
      currentLocation:
          NullSafetyHelper.safeString(json?['current_location']),
      isCurrentlyInEstate:
          NullSafetyHelper.safeBool(json?['is_currently_in_estate']),
    );
  }

  factory AccessSummary.empty() => const AccessSummary();
}
