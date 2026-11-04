import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'active_otp_data.dart';

part 'active_otp_response.freezed.dart';
part 'active_otp_response.g.dart';

@freezed
class ActiveOtpResponse with _$ActiveOtpResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ActiveOtpResponse({
    bool? status,
    String? message,
    int? code,
    ActiveOtpData? data,
  }) = _ActiveOtpResponse;

  factory ActiveOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveOtpResponseFromJson(json);

  factory ActiveOtpResponse.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return ActiveOtpResponse.empty();

    return ActiveOtpResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        ActiveOtpData.fromSafeJson,
        ActiveOtpData.empty(),
      ),
    );
  }

  factory ActiveOtpResponse.empty() => const ActiveOtpResponse(
    status: null,
    message: null,
    code: null,
    data: null,
  );
}
