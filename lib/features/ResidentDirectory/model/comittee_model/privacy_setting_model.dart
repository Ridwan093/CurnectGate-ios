import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'privacy_setting_model.freezed.dart';
part 'privacy_setting_model.g.dart';

@freezed
class PrivacySetting with _$PrivacySetting {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PrivacySetting({
    String? key,
    String? name,
    String? type,
    bool? value,
    String? description,
  }) = _PrivacySetting;

  factory PrivacySetting.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingFromJson(json);

  factory PrivacySetting.fromSafeJson(Map<String, dynamic> json) {
    return PrivacySetting(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
      type: NullSafetyHelper.safeString(json['type']),
      value: NullSafetyHelper.safeBool(json['value']),
      description: NullSafetyHelper.safeString(json['description']),
    );
  }

  factory PrivacySetting.empty() => const PrivacySetting(
        key: null,
        name: null,
        type: null,
        value: null,
        description: null,
      );
}
