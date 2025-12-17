import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'candidate_item.dart';


part 'vote_item.freezed.dart';
part 'vote_item.g.dart';

@freezed
class VoteItem with _$VoteItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VoteItem({
    String? positionTitle,
    List<CandidateItem>? candidates,
  }) = _VoteItem;

  factory VoteItem.fromJson(Map<String, dynamic> json) =>
      _$VoteItemFromJson(json);

  factory VoteItem.safeFromJson(Map<String, dynamic>? json) {
    return VoteItem(
      positionTitle: NullSafetyHelper.safeString(json?['position_title']),
      candidates: (NullSafetyHelper.safeList(json?['candidates']) )
          .map((e) => CandidateItem.safeFromJson(e))
          .toList(),
    );
  }

  factory VoteItem.empty() =>
      const VoteItem(positionTitle: '', candidates: []);
}
