import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
class Statistics with _$Statistics {
  const factory Statistics({
    int? totalVoters,
    int? totalVoted,
    num? turnoutPercentage,
    int? timeRemainingHours,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  factory Statistics.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Statistics();
    return Statistics(
      totalVoters: NullSafetyHelper.safeInt(json['total_voters']),
      totalVoted: NullSafetyHelper.safeInt(json['total_voted']),
      turnoutPercentage: NullSafetyHelper.safeDouble(json['turnout_percentage']),
      timeRemainingHours: NullSafetyHelper.safeInt(json['time_remaining_hours']),
    );
  }
}
