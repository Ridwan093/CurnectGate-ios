import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'polls_summary.freezed.dart';
part 'polls_summary.g.dart';

@freezed
class PollsSummary with _$PollsSummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollsSummary({
    int? activePolls,
    int? pollsVoted,
    int? pendingPolls,
  }) = _PollsSummary;

  factory PollsSummary.fromJson(Map<String, dynamic> json) =>
      _$PollsSummaryFromJson(json);

  factory PollsSummary.safeFromJson(Map<String, dynamic>? json) {
    return PollsSummary(
      activePolls: NullSafetyHelper.safeInt(json?['active_polls']),
      pollsVoted: NullSafetyHelper.safeInt(json?['polls_voted']),
      pendingPolls: NullSafetyHelper.safeInt(json?['pending_polls']),
    );
  }

  factory PollsSummary.empty() => const PollsSummary(
        activePolls: 0,
        pollsVoted: 0,
        pendingPolls: 0,
      );
}
