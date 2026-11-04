import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'expired_count_data.dart';

part 'expired_count_response.freezed.dart';
part 'expired_count_response.g.dart';

@freezed
class ExpiredCountResponse with _$ExpiredCountResponse {
  const factory ExpiredCountResponse({
    bool? status,
    String? message,
    int? code,
    ExpiredCountData? data,
  }) = _ExpiredCountResponse;

  factory ExpiredCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpiredCountResponseFromJson(json);

  factory ExpiredCountResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ExpiredCountResponse();
    return ExpiredCountResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: ExpiredCountData.safeFromJson(json['data']),
    );
  }
}
