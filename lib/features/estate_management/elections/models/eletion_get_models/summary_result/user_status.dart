import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'user_status.freezed.dart';
part 'user_status.g.dart';

@freezed
class UserStatus with _$UserStatus {
  const factory UserStatus({
    bool? hasVoted,
  }) = _UserStatus;

  factory UserStatus.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFromJson(json);

  factory UserStatus.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const UserStatus();
    return UserStatus(
      hasVoted: NullSafetyHelper.safeBool(json['has_voted']),
    );
  }
}
