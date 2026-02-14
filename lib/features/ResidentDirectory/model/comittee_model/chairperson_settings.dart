


import 'package:freezed_annotation/freezed_annotation.dart';
import 'preference_setting_model.dart';
import 'privacy_setting_model.dart';

import 'notification_setting_model.dart';
import 'household_permissions_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'chairperson_settings.freezed.dart';
part 'chairperson_settings.g.dart';





@freezed
class ChairpersonSettings with _$ChairpersonSettings {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ChairpersonSettings({
    List<PrivacySetting>? privacy,
    List<PreferenceSetting>? preferences,
    List<NotificationSetting>? notifications,
    String? bankName,
    String? bankAccountName,
    String? bankAccountNumber,
    HouseholdPermissions? householdPermissions,
    String? preferredPaymentMethod,
  }) = _ChairpersonSettings;

  factory ChairpersonSettings.fromJson(Map<String, dynamic> json) =>
      _$ChairpersonSettingsFromJson(json);

  factory ChairpersonSettings.fromSafeJson(Map<String, dynamic> json) {
    return ChairpersonSettings(
      privacy: _privacySettingFromJson(json['privacy'],),
      preferences: _preferenceSettingFromJson(json['preferences']),
      notifications:_notificationSettingFromJson(json['notifications']),
      bankName: NullSafetyHelper.safeString(json['bank_name']),
      bankAccountName: NullSafetyHelper.safeString(json['bank_account_name']),
      bankAccountNumber: NullSafetyHelper.safeString(json['bank_account_number']),
      householdPermissions: NullSafetyHelper.safeModel(
          json['household_permissions'], HouseholdPermissions.fromSafeJson, HouseholdPermissions.empty()),
      preferredPaymentMethod:
          NullSafetyHelper.safeString(json['preferred_payment_method']),
    );
  }

  static List<PrivacySetting>? _privacySettingFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              PrivacySetting.fromSafeJson,
              PrivacySetting.empty(),
            ))
        .whereType<PrivacySetting>()
        .toList();
  }


  static List<PreferenceSetting>? _preferenceSettingFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              PreferenceSetting.fromSafeJson,
              PreferenceSetting.empty(),
            ))
        .whereType<PreferenceSetting>()
        .toList();
  }

  static List<NotificationSetting>? _notificationSettingFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              NotificationSetting.fromSafeJson,
              NotificationSetting.empty(),
            ))
        .whereType<NotificationSetting>()
        .toList();
  }

  factory ChairpersonSettings.empty() => const ChairpersonSettings(
        privacy: null,
        preferences: null,
        notifications: null,
        bankName: null,
        bankAccountName: null,
        bankAccountNumber: null,
        householdPermissions: null,
        preferredPaymentMethod: null,
      );
}
