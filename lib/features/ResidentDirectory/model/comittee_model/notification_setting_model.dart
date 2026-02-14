import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'notification_setting_model.freezed.dart';
part 'notification_setting_model.g.dart';

@freezed
class NotificationSetting with _$NotificationSetting {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory NotificationSetting({
    String? key,
    String? name,
    String? type,
    bool? value,
    String? description,
  }) = _NotificationSetting;

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  factory NotificationSetting.fromSafeJson(Map<String, dynamic> json) {
    return NotificationSetting(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
      type: NullSafetyHelper.safeString(json['type']),
      value: NullSafetyHelper.safeBool(json['value']),
      description: NullSafetyHelper.safeString(json['description']),
    );
  }

  factory NotificationSetting.empty() => const NotificationSetting(
        key: null,
        name: null,
        type: null,
        value: null,
        description: null,
      );
}
