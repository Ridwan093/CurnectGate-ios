import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'poll_info.dart';
import 'position_item.dart';


part 'candidates_data.freezed.dart';
part 'candidates_data.g.dart';

@freezed
class CandidatesData with _$CandidatesData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CandidatesData({
    PollInfo? poll,
    List<PositionItem>? positions,
  }) = _CandidatesData;

  factory CandidatesData.fromJson(Map<String, dynamic> json) =>
      _$CandidatesDataFromJson(json);

  factory CandidatesData.safeFromJson(Map<String, dynamic>? json) {
    return CandidatesData(
      poll: PollInfo.safeFromJson(NullSafetyHelper.safeMap(json?['poll'])),
      positions: (NullSafetyHelper.safeList(json?['positions']))
          .map((e) => PositionItem.safeFromJson(e))
          .toList(),
    );
  }

  factory CandidatesData.empty() => const CandidatesData(poll: null, positions: []);
}
