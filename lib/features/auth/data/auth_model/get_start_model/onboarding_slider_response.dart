
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'onboarding_slider_data.dart';

part 'onboarding_slider_response.freezed.dart';
part 'onboarding_slider_response.g.dart';

@freezed
class OnboardingSliderResponse with _$OnboardingSliderResponse {
  @JsonSerializable(explicitToJson: true)
  const factory OnboardingSliderResponse({
    bool? status,
    String? message,
    int? code,
    SliderData? data,
  }) = _OnboardingSliderResponse;

  factory OnboardingSliderResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingSliderResponseFromJson(json);

  factory OnboardingSliderResponse.fromSafeJson(Map<String, dynamic> json) {
    return OnboardingSliderResponse.fromJson({
      ...json,
      "status": NullSafetyHelper.safeBool(json["status"]),
      "message": NullSafetyHelper.safeString(json["message"]),
      "code": NullSafetyHelper.safeInt(json["code"]),
      "data": NullSafetyHelper.safeMap(json["data"]),
    });
  }
}
