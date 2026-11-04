import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'committee_member.freezed.dart';
part 'committee_member.g.dart';

@freezed
class CommitteeMember with _$CommitteeMember {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeMember({
    int? id,
    String? firstname,
    String? lastname,
    String? fullName,
    String? avatarUrl,
    String? role,
    String? roleBadge,
    String? committeeName,
    String? committeeRole,
    String? position,
    String? onlineStatus,
  }) = _CommitteeMember;

  factory CommitteeMember.fromJson(Map<String, dynamic> json) =>
      _$CommitteeMemberFromJson(json);

  factory CommitteeMember.safeFromJson(Map<String, dynamic>? json) {
    return CommitteeMember(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      avatarUrl: NullSafetyHelper.safeString(json?['avatar_url']),
      role: NullSafetyHelper.safeString(json?['role']),
      roleBadge: NullSafetyHelper.safeString(json?['role_badge']),
      committeeName:
          NullSafetyHelper.safeString(json?['committee_name']),
      committeeRole:
          NullSafetyHelper.safeString(json?['committee_role']),
      position: NullSafetyHelper.safeString(json?['position']),
      onlineStatus:
          NullSafetyHelper.safeString(json?['online_status']),
    );
  }

  factory CommitteeMember.empty() => const CommitteeMember();
}
