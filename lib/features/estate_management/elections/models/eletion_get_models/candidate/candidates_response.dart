import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'candidates_data.dart';


part 'candidates_response.freezed.dart';
part 'candidates_response.g.dart';

@freezed
class CandidatesResponse with _$CandidatesResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CandidatesResponse({
    bool? status,
    String? message,
    int? code,
    CandidatesData? data,
  }) = _CandidatesResponse;

  factory CandidatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidatesResponseFromJson(json);

  factory CandidatesResponse.safeFromJson(Map<String, dynamic>? json) {
    return CandidatesResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: CandidatesData.safeFromJson(json?['data']),
    );
  }

  factory CandidatesResponse.empty() =>
      CandidatesResponse(status: false, message: '', code: 0, data: CandidatesData.empty());
}
