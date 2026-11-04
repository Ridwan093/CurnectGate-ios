// committee_member_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'committee_category_model.dart';


part 'committee_member_model.freezed.dart';
part 'committee_member_model.g.dart';

@freezed
class CommitteeMember with _$CommitteeMember {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeMember({
     int? id,
     String? name,
     String? role,
     String? roleDisplayName,
     CommitteeCategory? category,
     bool? isLeadership,
  }) = _CommitteeMember;

  factory CommitteeMember.fromJson(Map<String, dynamic> json) =>
      _$CommitteeMemberFromJson(json);

  factory CommitteeMember.fromSafeJson(Map<String, dynamic> json) {
    return CommitteeMember(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      role: NullSafetyHelper.safeString(json['role']),
      roleDisplayName: NullSafetyHelper.safeString(json['role_display_name']),
      category: NullSafetyHelper.safeModel(
        json['category'],
        CommitteeCategory.fromSafeJson,
        CommitteeCategory.empty(),
      )!,
      isLeadership: NullSafetyHelper.safeBool(json['is_leadership']),
    );
  }

  factory CommitteeMember.empty() =>  CommitteeMember(
        id: 0,
        name: '',
        role: '',
        roleDisplayName: '',
        category: CommitteeCategory.empty(),
        isLeadership: false,
      );
}