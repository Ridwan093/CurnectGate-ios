import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'candidate_item.freezed.dart';
part 'candidate_item.g.dart';

@freezed
class CandidateItem with _$CandidateItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CandidateItem({
    int? id,
    String? name,
    String? bio,
    String? partyAffiliation,
    String? mediaUrl,
  }) = _CandidateItem;

  factory CandidateItem.fromJson(Map<String, dynamic> json) =>
      _$CandidateItemFromJson(json);

  factory CandidateItem.safeFromJson(Map<String, dynamic>? json) {
    return CandidateItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      bio: NullSafetyHelper.safeString(json?['bio']),
      partyAffiliation: NullSafetyHelper.safeString(json?['party_affiliation']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
    );
  }

  factory CandidateItem.empty() =>
      const CandidateItem(id: 0, name: '', bio: '', partyAffiliation: '', mediaUrl: '');
}
