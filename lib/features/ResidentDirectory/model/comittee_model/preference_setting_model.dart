import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'preference_setting_model.freezed.dart';
part 'preference_setting_model.g.dart';

@freezed
class PreferenceSetting with _$PreferenceSetting {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PreferenceSetting({
    String? key,
    String? name,
    String? type,
    String? value,
    List<Map<String, dynamic>>? options,
    String? description,
  }) = _PreferenceSetting;

  factory PreferenceSetting.fromJson(Map<String, dynamic> json) =>
      _$PreferenceSettingFromJson(json);

  factory PreferenceSetting.fromSafeJson(Map<String, dynamic> json) {
    return PreferenceSetting(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
      type: NullSafetyHelper.safeString(json['type']),
      value: NullSafetyHelper.safeString(json['value']),
      options: json['options'] != null
          ? List<Map<String, dynamic>>.from(json['options'])
          : [],
      description: NullSafetyHelper.safeString(json['description']),
    );
  }

  factory PreferenceSetting.empty() => const PreferenceSetting(
        key: null,
        name: null,
        type: null,
        value: null,
        options: null,
        description: null,
      );
}
