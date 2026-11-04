import 'package:freezed_annotation/freezed_annotation.dart';
import 'history_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'status_history_response.freezed.dart';
part 'status_history_response.g.dart';

@freezed
class StatusHistoryResponse with _$StatusHistoryResponse {
  const factory StatusHistoryResponse({
    bool? status,
    String? message,
    int? code,
    HistoryData? data,
  }) = _StatusHistoryResponse;

  factory StatusHistoryResponse.safeFromJson(Map<String, dynamic>? json) {
    return StatusHistoryResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: json?['data'] == null
          ? null
          : HistoryData.safeFromJson(json?['data']),
    );
  }

  factory StatusHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryResponseFromJson(json);
}
