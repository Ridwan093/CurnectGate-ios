import 'package:curnectgate/features/member_management/membership_ID/model/preferences_settings.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'privacy_settings.dart';
import 'notifications.dart';
import 'household_permissions.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory UserSettings({
    @JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty) 
     PrivacySettings? privacy,
    
    @JsonKey(name: 'bank_name') 
    String? bankName,
    
    @JsonKey(name: 'preferences', defaultValue: PreferencesSettings.empty) 
    PreferencesSettings? preferences,
    
    @JsonKey(name: 'notifications', defaultValue: Notifications.empty) 
     Notifications? notifications,
    
    @JsonKey(name: 'bank_account_name') 
    String? bankAccountName,
    
    @JsonKey(name: 'bank_account_number') 
    String? bankAccountNumber,
    
    @JsonKey(name: 'household_permissions', defaultValue: HouseholdPermissions.empty) 
    required HouseholdPermissions householdPermissions,
    
    @JsonKey(name: 'preferred_payment_method', defaultValue: '') 
    required String preferredPaymentMethod,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  factory UserSettings.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return UserSettings.empty();
    
    return UserSettings(
      privacy: PrivacySettings.safeFromJson(json['privacy']),
      bankName: NullSafetyHelper.safeString(json['bank_name']),
      preferences: PreferencesSettings.safeFromJson(json['preferences']),
      notifications: Notifications.safeFromJson(json['notifications']),
      bankAccountName: NullSafetyHelper.safeString(json['bank_account_name']),
      bankAccountNumber: NullSafetyHelper.safeString(json['bank_account_number']),
      householdPermissions: HouseholdPermissions.safeFromJson(
        json['household_permissions'],
      ),
      preferredPaymentMethod: NullSafetyHelper.safeString(
        json['preferred_payment_method'],
      ),
    );
  }

  factory UserSettings.empty() =>  UserSettings(
        privacy: PrivacySettings.empty(),
        bankName: null,
        preferences: PreferencesSettings.empty(),
        notifications: Notifications.empty(),
        bankAccountName: null,
        bankAccountNumber: null,
        householdPermissions: HouseholdPermissions.empty(),
        preferredPaymentMethod: '',
      );
}