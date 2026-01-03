import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'privacy_data.dart';

part 'get_user_privacy_settings.freezed.dart';
part 'get_user_privacy_settings.g.dart';

@freezed
class GetUserPrivacySettings with _$GetUserPrivacySettings {
   @JsonSerializable(explicitToJson: true)
  const factory GetUserPrivacySettings({
    bool? status,
    String? message,
    int? code,
    Data? data,
  }) = _GetUserPrivacySettings;

  factory GetUserPrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$GetUserPrivacySettingsFromJson(json);

  factory GetUserPrivacySettings.safeFromJson(Map<String, dynamic>? json) =>
      GetUserPrivacySettings(
        status: NullSafetyHelper.safeBool(json?['status']),
        message: NullSafetyHelper.safeString(json?['message']),
        code: NullSafetyHelper.safeInt(json?['code']),
        data: Data.safeFromJson(json?['data']),
      );
}
