import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'privacy_item.freezed.dart';
part 'privacy_item.g.dart';

@freezed
class PrivacyItem with _$PrivacyItem {
  @JsonSerializable(explicitToJson: true)
  const factory PrivacyItem({
    String? key,
    String? name,
    String? type,
    dynamic value,
    String? description,
  }) = _PrivacyItem;

  factory PrivacyItem.fromJson(Map<String, dynamic> json) =>
      _$PrivacyItemFromJson(json);

  factory PrivacyItem.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const PrivacyItem(
        key: '',
        name: '',
        type: '',
        value: null,
        description: '',
      );
    }

    return PrivacyItem(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
      type: NullSafetyHelper.safeString(json['type']),
      value: json['value'], // value can be bool/string/int
      description: NullSafetyHelper.safeString(json['description']),
    );
  }
}
