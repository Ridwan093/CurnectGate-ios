// committees_response_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'committee_list_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'committees_response_model.freezed.dart';
part 'committees_response_model.g.dart';

@freezed
class CommitteesResponse with _$CommitteesResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteesResponse({
    bool? status,
    String? message,
    int? code,
    CommitteesData? data,
  }) = _CommitteesResponse;

  factory CommitteesResponse.fromJson(Map<String, dynamic> json) =>
      _$CommitteesResponseFromJson(json);

  factory CommitteesResponse.fromSafeJson(Map<String, dynamic> json) {
    return CommitteesResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        CommitteesData.fromSafeJson,
        CommitteesData.empty(),
      ),
    );
  }

  factory CommitteesResponse.empty() => const CommitteesResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}

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