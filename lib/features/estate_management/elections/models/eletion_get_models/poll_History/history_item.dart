import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'vote_item.dart';


part 'history_item.freezed.dart';
part 'history_item.g.dart';

@freezed
class HistoryItem with _$HistoryItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory HistoryItem({
    int? pollId,
    String? pollTitle,
    String? pollType,
    String? pollStatus,
    String? votedAt,
    int? positionsVoted,
    List<VoteItem>? votes,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemFromJson(json);

  factory HistoryItem.safeFromJson(Map<String, dynamic>? json) {
    return HistoryItem(
      pollId: NullSafetyHelper.safeInt(json?['poll_id']),
      pollTitle: NullSafetyHelper.safeString(json?['poll_title']),
      pollType: NullSafetyHelper.safeString(json?['poll_type']),
      pollStatus: NullSafetyHelper.safeString(json?['poll_status']),
      votedAt: NullSafetyHelper.safeString(json?['voted_at']),
      positionsVoted: NullSafetyHelper.safeInt(json?['positions_voted']),
      votes: (NullSafetyHelper.safeList(json?['votes']))
          .map((e) => VoteItem.safeFromJson(e))
          .toList(),
    );
  }

  factory HistoryItem.empty() => const HistoryItem(
        pollId: 0,
        pollTitle: '',
        pollType: '',
        pollStatus: '',
        votedAt: '',
        positionsVoted: 0,
        votes: [],
      );
}
