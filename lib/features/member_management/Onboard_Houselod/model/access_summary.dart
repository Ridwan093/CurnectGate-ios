import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'access_summary.freezed.dart';
part 'access_summary.g.dart';

@freezed
class AccessSummary with _$AccessSummary {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory AccessSummary({
    @JsonKey(name: 'last_gate_access') dynamic lastGateAccess,
    @JsonKey(name: 'total_access_attempts_today') int? totalAccessAttemptsToday,
    @JsonKey(name: 'current_location') dynamic currentLocation,
    @JsonKey(name: 'is_currently_in_estate') bool? isCurrentlyInEstate,
  }) = _AccessSummary;

  factory AccessSummary.fromJson(Map<String, dynamic> json) =>
      _$AccessSummaryFromJson(json);

  factory AccessSummary.safeFromJson(Map<String, dynamic>? json) {
    return AccessSummary(
      lastGateAccess: json?['last_gate_access'],
      totalAccessAttemptsToday: NullSafetyHelper.safeInt(json?['total_access_attempts_today']),
      currentLocation: json?['current_location'],
      isCurrentlyInEstate: NullSafetyHelper.safeBool(json?['is_currently_in_estate']),
    );
  }

  factory AccessSummary.empty() => const AccessSummary(
    lastGateAccess: null,
    totalAccessAttemptsToday: null,
    currentLocation: null,
    isCurrentlyInEstate: null,
  );
}