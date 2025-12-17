import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'candidate_data.freezed.dart';
part 'candidate_data.g.dart';

@freezed
class CandidateData with _$CandidateData {
  const factory CandidateData({
    int? id,
    String? name,
    String? bio,
    String? partyAffiliation,
    String? mediaUrl,
    int? candidateOrder,
    int? voteCount,
    double? percentage,
    int? rank,
    bool? isLeading,
    bool? isWinner,
  }) = _CandidateData;

  factory CandidateData.fromJson(Map<String, dynamic> json) =>
      _$CandidateDataFromJson(json);

  factory CandidateData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const CandidateData();
    return CandidateData(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      bio: NullSafetyHelper.safeString(json['bio']),
      partyAffiliation: NullSafetyHelper.safeString(json['party_affiliation']),
      mediaUrl: NullSafetyHelper.safeString(json['media_url']),
      candidateOrder: NullSafetyHelper.safeInt(json['candidate_order']),
      voteCount: NullSafetyHelper.safeInt(json['vote_count']),
      percentage: NullSafetyHelper.safeDouble(json['percentage']),
      rank: NullSafetyHelper.safeInt(json['rank']),
      isLeading: NullSafetyHelper.safeBool(json['is_leading']),
      isWinner: NullSafetyHelper.safeBool(json['is_winner']),
    );
  }
}
