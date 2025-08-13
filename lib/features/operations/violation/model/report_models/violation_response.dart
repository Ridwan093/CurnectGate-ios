import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'violation_data.dart';

part 'violation_response.freezed.dart';
part 'violation_response.g.dart';

@freezed
class ViolationResponse with _$ViolationResponse {
  const factory ViolationResponse({
    required bool status,
    required String message,
    required int code,
    required ViolationData data,
  }) = _ViolationResponse;

  factory ViolationResponse.fromJson(Map<String, dynamic> json) => _$ViolationResponseFromJson(json);

  factory ViolationResponse.safeFromJson(Map<String, dynamic>? json) => ViolationResponse(
    status: NullSafetyHelper.safeBool(json?['status']),
    message: NullSafetyHelper.safeString(json?['message']),
    code: NullSafetyHelper.safeInt(json ?['code']),
    data: ViolationData.safeFromJson(json?['data']),
  );
}
