import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_details.freezed.dart';
part 'candidate_details.g.dart';

@freezed
class CandidateDetails with _$CandidateDetails {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CandidateDetails({
    int? id,
    String? name,
    String? bio,
    String? partyAffiliation,
    String? mediaUrl,
    int? candidateOrder,
  }) = _CandidateDetails;

  factory CandidateDetails.fromJson(Map<String, dynamic> json) =>
      _$CandidateDetailsFromJson(json);

  factory CandidateDetails.safeFromJson(Map<String, dynamic>? json) {
    return CandidateDetails(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      bio: NullSafetyHelper.safeString(json?['bio']),
      partyAffiliation: NullSafetyHelper.safeString(json?['party_affiliation']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
      candidateOrder: NullSafetyHelper.safeInt(json?['candidate_order']),
    );
  }

  factory CandidateDetails.empty() => const CandidateDetails(
    id: 0,
    name: '',
    bio: '',
    partyAffiliation: '',
    mediaUrl: '',
    candidateOrder: 0,
  );
}
