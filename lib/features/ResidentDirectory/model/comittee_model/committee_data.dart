

import 'package:freezed_annotation/freezed_annotation.dart';
import 'committee_list_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'committee_data.freezed.dart';
part 'committee_data.g.dart';



@freezed
class CommitteesData with _$CommitteesData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteesData({
    CommitteeList? committees,
  }) = _CommitteesData;

  factory CommitteesData.fromJson(Map<String, dynamic> json) =>
      _$CommitteesDataFromJson(json);

  factory CommitteesData.fromSafeJson(Map<String, dynamic> json) {
    return CommitteesData(
      committees: NullSafetyHelper.safeModel(
        json['committees'],
        CommitteeList.fromSafeJson,
        CommitteeList.empty(),
      ),
    );
  }

  factory CommitteesData.empty() => const CommitteesData(
        committees: null,
      );
}