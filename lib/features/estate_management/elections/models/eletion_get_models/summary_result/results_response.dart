import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'results_data.dart';

part 'results_response.freezed.dart';
part 'results_response.g.dart';

@freezed
class ResultsResponse with _$ResultsResponse {
  const factory ResultsResponse({
    bool? status,
    String? message,
    int? code,
    ResultsData? data,
  }) = _ResultsResponse;

  factory ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);

  factory ResultsResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ResultsResponse();
    return ResultsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: ResultsData.safeFromJson(json['data']),
    );
  }
}
