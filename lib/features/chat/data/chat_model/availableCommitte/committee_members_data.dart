import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'committee_member.dart';

part 'committee_members_data.freezed.dart';
part 'committee_members_data.g.dart';

@freezed
class CommitteeMembersData with _$CommitteeMembersData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeMembersData({
    List<CommitteeMember>? members,
    int? committeeCount,
    int? boardCount,
    int? totalCount,
  }) = _CommitteeMembersData;

  factory CommitteeMembersData.fromJson(Map<String, dynamic> json) =>
      _$CommitteeMembersDataFromJson(json);

  factory CommitteeMembersData.safeFromJson(Map<String, dynamic>? json) {
    return CommitteeMembersData(
      members: NullSafetyHelper.safeMapList(json?['members'])
          .map((e) => CommitteeMember.safeFromJson(e))
          .toList(),
      committeeCount:
          NullSafetyHelper.safeInt(json?['committee_count']),
      boardCount: NullSafetyHelper.safeInt(json?['board_count']),
      totalCount: NullSafetyHelper.safeInt(json?['total_count']),
    );
  }

  factory CommitteeMembersData.empty() =>
      const CommitteeMembersData(
        members: [],
        committeeCount: 0,
        boardCount: 0,
        totalCount: 0,
      );
}
