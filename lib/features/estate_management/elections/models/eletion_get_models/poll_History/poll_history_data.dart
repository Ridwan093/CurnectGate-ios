import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'history_item.dart';


part 'poll_history_data.freezed.dart';
part 'poll_history_data.g.dart';

@freezed
class PollHistoryData with _$PollHistoryData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollHistoryData({
    List<HistoryItem>? history,
    int? totalPollsVoted,
  }) = _PollHistoryData;

  factory PollHistoryData.fromJson(Map<String, dynamic> json) =>
      _$PollHistoryDataFromJson(json);

  factory PollHistoryData.safeFromJson(Map<String, dynamic>? json) {
    return PollHistoryData(
      history: (NullSafetyHelper.safeList(json?['history']))
          .map((e) => HistoryItem.safeFromJson(e))
          .toList(),
      totalPollsVoted: NullSafetyHelper.safeInt(json?['total_polls_voted']),
    );
  }

  factory PollHistoryData.empty() => const PollHistoryData(
        history: [],
        totalPollsVoted: 0,
      );
}
