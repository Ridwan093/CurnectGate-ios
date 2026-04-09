import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'violation_data.dart';

part 'violation_response.freezed.dart';
part 'violation_response.g.dart';

@freezed
class ViolationResponse with _$ViolationResponse {
   @JsonSerializable(explicitToJson: true)
  const factory ViolationResponse({
    @Default(false) bool status,
    @Default('') String message,
    @Default(0) int code,
    ViolationData? data,
  }) = _ViolationResponse;

  factory ViolationResponse.fromJson(Map<String, dynamic> json) => _$ViolationResponseFromJson(json);

  factory ViolationResponse.safeFromJson(Map<String, dynamic>? json) => ViolationResponse(
    status: NullSafetyHelper.safeBool(json?['status']),
    message: NullSafetyHelper.safeString(json?['message']),
    code: NullSafetyHelper.safeInt(json?['code']),
    data: json?['data'] != null ? ViolationData.safeFromJson(json?['data']) : null,
  );
}
