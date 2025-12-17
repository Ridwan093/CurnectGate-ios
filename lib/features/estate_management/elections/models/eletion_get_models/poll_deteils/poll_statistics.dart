import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_statistics.freezed.dart';
part 'poll_statistics.g.dart';

@freezed
class PollStatistics with _$PollStatistics {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollStatistics({
    int? totalVoters,
    int? totalVoted,
    double? turnoutPercentage,
    int? timeRemainingHours,
  }) = _PollStatistics;

  factory PollStatistics.fromJson(Map<String, dynamic> json) =>
      _$PollStatisticsFromJson(json);

  factory PollStatistics.safeFromJson(Map<String, dynamic>? json) {
    return PollStatistics(
      totalVoters: NullSafetyHelper.safeInt(json?['total_voters']),
      totalVoted: NullSafetyHelper.safeInt(json?['total_voted']),
      turnoutPercentage: NullSafetyHelper.safeDouble(
        json?['turnout_percentage'],
      ),
      timeRemainingHours: NullSafetyHelper.safeInt(
        json?['time_remaining_hours'],
      ),
    );
  }

  factory PollStatistics.empty() => const PollStatistics(
    totalVoters: 0,
    totalVoted: 0,
    turnoutPercentage: 0.0,
    timeRemainingHours: 0,
  );
}
