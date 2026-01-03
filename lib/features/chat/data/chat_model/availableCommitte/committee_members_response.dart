import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'committee_members_data.dart';

part 'committee_members_response.freezed.dart';
part 'committee_members_response.g.dart';

@freezed
class CommitteeMembersResponse with _$CommitteeMembersResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeMembersResponse({
    bool? success,
    String? message,
    CommitteeMembersData? data,
  }) = _CommitteeMembersResponse;

  factory CommitteeMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$CommitteeMembersResponseFromJson(json);

  factory CommitteeMembersResponse.safeFromJson(Map<String, dynamic>? json) {
    return CommitteeMembersResponse(
      success: NullSafetyHelper.safeBool(json?['success']),
      message: NullSafetyHelper.safeString(json?['message']),
      data: NullSafetyHelper.safeModel(
        json?['data'],
        CommitteeMembersData.safeFromJson,
        CommitteeMembersData.empty(),
      ),
    );
  }

  factory CommitteeMembersResponse.empty() =>
      const CommitteeMembersResponse(success: false, message: '', data: null);
}
