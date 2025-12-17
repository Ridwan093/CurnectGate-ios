import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_status.freezed.dart';
part 'user_status.g.dart';

@freezed
class UserStatus with _$UserStatus {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UserStatus({
    bool? canVote,
    bool? hasVoted,
    int? votingProgress,
    int? positionsVoted,
    int? totalPositions,
  }) = _UserStatus;

  factory UserStatus.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFromJson(json);

  factory UserStatus.safeFromJson(Map<String, dynamic>? json) {
    return UserStatus(
      canVote: NullSafetyHelper.safeBool(json?['can_vote']),
      hasVoted: NullSafetyHelper.safeBool(json?['has_voted']),
      votingProgress: NullSafetyHelper.safeInt(json?['voting_progress']),
      positionsVoted: NullSafetyHelper.safeInt(json?['positions_voted']),
      totalPositions: NullSafetyHelper.safeInt(json?['total_positions']),
    );
  }

  factory UserStatus.empty() => const UserStatus(
    canVote: false,
    hasVoted: false,
    votingProgress: 0,
    positionsVoted: 0,
    totalPositions: 0,
  );
}
