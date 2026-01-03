import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'data.dart';

part 'get_user_notification_settings.freezed.dart';
part 'get_user_notification_settings.g.dart';

@freezed
class GetUserNotificationSettings with _$GetUserNotificationSettings {
    @JsonSerializable(explicitToJson: true)
  const factory GetUserNotificationSettings({
    required bool? status,
    required String? message,
    required int? code,
    required Data? data,
  }) = _GetUserNotificationSettings;

  factory GetUserNotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$GetUserNotificationSettingsFromJson(json);

  factory GetUserNotificationSettings.safeFromJson(Map<String, dynamic>? json) =>
      GetUserNotificationSettings(
        status: NullSafetyHelper.safeBool(json?['status']),
        message: NullSafetyHelper.safeString(json?['message']),
        code: NullSafetyHelper.safeInt(json?['code']),
        data: NullSafetyHelper.safeModel(json?['data'], Data.fromJson, null),
      );
}
