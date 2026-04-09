import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_slider_items.freezed.dart';
part 'onboarding_slider_items.g.dart';

@freezed
class SliderItem with _$SliderItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SliderItem({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    int? order,
  }) = _SliderItem;

  factory SliderItem.fromJson(Map<String, dynamic> json) =>
      _$SliderItemFromJson(json);

  factory SliderItem.fromSafeJson(Map<String, dynamic> json) {
    return SliderItem.fromJson({
      "id": NullSafetyHelper.safeInt(json["id"]),
      "title": NullSafetyHelper.safeString(json["title"]),
      "description": NullSafetyHelper.safeString(json["description"]),
      "image_url": NullSafetyHelper.safeString(json["image_url"]),
      "order": NullSafetyHelper.safeInt(json["order"]),
    });
  }
}
