import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'poll_item_summary.dart';
import 'polls_summary.dart';


part 'polls_data.freezed.dart';
part 'polls_data.g.dart';

@freezed
class PollsData with _$PollsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollsData({
    List<PollItemSummary>? polls,
    PollsSummary? summary,
  }) = _PollsData;

  factory PollsData.fromJson(Map<String, dynamic> json) =>
      _$PollsDataFromJson(json);

  factory PollsData.safeFromJson(Map<String, dynamic>? json) {
    return PollsData(
      polls: (NullSafetyHelper.safeList(json?['polls']))
          .map((e) => PollItemSummary.safeFromJson(e))
          .toList(),
      summary: PollsSummary.safeFromJson(NullSafetyHelper.safeMap(json?['summary'])),
    );
  }

  factory PollsData.empty() => const PollsData(polls: [], summary: null);
}
