import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_summary.freezed.dart';
part 'violation_summary.g.dart';

@freezed
class PriorityDistribution with _$PriorityDistribution {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PriorityDistribution({
    @Default(0) int low,
    @Default(0) int medium,
    @Default(0) int high,
    @Default(0) int urgent,
  }) = _PriorityDistribution;

  factory PriorityDistribution.fromJson(Map<String, dynamic> json) =>
      _$PriorityDistributionFromJson(json);

  factory PriorityDistribution.safeFromJson(Map<String, dynamic>? json) {
    return PriorityDistribution(
      low: NullSafetyHelper.safeInt(json?['low']),
      medium: NullSafetyHelper.safeInt(json?['medium']),
      high: NullSafetyHelper.safeInt(json?['high']),
      urgent: NullSafetyHelper.safeInt(json?['urgent']),
    );
  }

  factory PriorityDistribution.empty() => const PriorityDistribution(
        low: 0,
        medium: 0,
        high: 0,
        urgent: 0,
      );
}

@freezed
class ViolationSummary with _$ViolationSummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ViolationSummary({
    @Default(0) int total,
    @Default(0) int pending,
    @Default(0) int investigating,
    @Default(0) int resolved,
    @Default(0) int dismissed,
    PriorityDistribution? byPriority,
  }) = _ViolationSummary;

  factory ViolationSummary.fromJson(Map<String, dynamic> json) =>
      _$ViolationSummaryFromJson(json);

  factory ViolationSummary.safeFromJson(Map<String, dynamic>? json) {
    return ViolationSummary(
      total: NullSafetyHelper.safeInt(json?['total']),
      pending: NullSafetyHelper.safeInt(json?['pending']),
      investigating: NullSafetyHelper.safeInt(json?['investigating']),
      resolved: NullSafetyHelper.safeInt(json?['resolved']),
      dismissed: NullSafetyHelper.safeInt(json?['dismissed']),
      byPriority: json?['by_priority'] != null ? PriorityDistribution.safeFromJson(json?['by_priority']) : null,
    );
  }

  factory ViolationSummary.empty() => const ViolationSummary(
        total: 0,
        pending: 0,
        investigating: 0,
        resolved: 0,
        dismissed: 0,
      );
}
