import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/live_results_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'live_results_response.freezed.dart';
part 'live_results_response.g.dart';

@freezed
class LiveResultsResponse with _$LiveResultsResponse {
  const factory LiveResultsResponse({
    bool? status,
    String? message,
    int? code,
    LiveResultsData? data,
  }) = _LiveResultsResponse;

  factory LiveResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveResultsResponseFromJson(json);

  factory LiveResultsResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const LiveResultsResponse();
    return LiveResultsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: LiveResultsData.safeFromJson(json['data']),
    );
  }
}
