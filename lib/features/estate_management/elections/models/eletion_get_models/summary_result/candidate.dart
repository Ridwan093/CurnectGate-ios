import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'candidate.freezed.dart';
part 'candidate.g.dart';

@freezed
class Candidate with _$Candidate {
  const factory Candidate({
    int? candidateId,
    String? candidateName,
    int? votes,
    num? percentage,
    bool? isWinner,
  }) = _Candidate;

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  factory Candidate.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Candidate();
    return Candidate(
      candidateId: NullSafetyHelper.safeInt(json['candidate_id']),
      candidateName: NullSafetyHelper.safeString(json['candidate_name']),
      votes: NullSafetyHelper.safeInt(json['votes']),
      percentage: NullSafetyHelper.safeDouble(json['percentage']),
      isWinner: NullSafetyHelper.safeBool(json['is_winner']),
    );
  }
}
