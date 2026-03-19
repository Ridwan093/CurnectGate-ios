
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'onboarding_slider_items.dart';

part 'onboarding_slider_data.freezed.dart';
part 'onboarding_slider_data.g.dart';





@freezed
class SliderData with _$SliderData {
  @JsonSerializable(explicitToJson: true)
  const factory SliderData({
    @Default([]) List<SliderItem> sliders,
  }) = _SliderData;

  factory SliderData.fromJson(Map<String, dynamic> json) =>
      _$SliderDataFromJson(json);

  factory SliderData.fromSafeJson(Map<String, dynamic> json) {
    return SliderData.fromJson({
      ...json,
      "sliders": NullSafetyHelper.safeList(json["sliders"])
          .map((e) => SliderItem.fromSafeJson(e))
          .toList(),
    });
  }
}