import 'package:freezed_annotation/freezed_annotation.dart';
import 'nullSafty_model.dart';
import 'otp_data.dart';

part 'otp_response_model.freezed.dart';
part 'otp_response_model.g.dart';

@freezed
class OtpResponseModel with _$OtpResponseModel {
  const factory OtpResponseModel({
    @JsonKey(name: 'status') @Default(false) bool status,
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'code') @Default(0) int code,
    @JsonKey(name: 'data') OtpData? data,
  }) = _OtpResponseModel;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelFromJson(json);

  static OtpResponseModel fromSafeJson(Map<String, dynamic>? json) {
    return OtpResponseModel(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: NullSafetyHelper.safeModel(json?['data'], OtpData.fromJson, null),
    );
  }
}
