import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'live_statistics.freezed.dart';
part 'live_statistics.g.dart';

@freezed
class LiveStatistics with _$LiveStatistics {
  const factory LiveStatistics({
    int? totalVoters,
    int? totalVoted,
    double? turnoutPercentage,
    int? timeRemainingHours,
    bool? isLive,
  }) = _LiveStatistics;

  factory LiveStatistics.fromJson(Map<String, dynamic> json) =>
      _$LiveStatisticsFromJson(json);

  factory LiveStatistics.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const LiveStatistics();
    return LiveStatistics(
      totalVoters: NullSafetyHelper.safeInt(json['total_voters']),
      totalVoted: NullSafetyHelper.safeInt(json['total_voted']),
      turnoutPercentage:
          NullSafetyHelper.safeDouble(json['turnout_percentage']),
      timeRemainingHours:
          NullSafetyHelper.safeInt(json['time_remaining_hours']),
      isLive: NullSafetyHelper.safeBool(json['is_live']),
    );
  }
}
