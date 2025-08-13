// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      privacy: json['privacy'] == null
          ? PrivacySettings.empty()
          : PrivacySettings.fromJson(json['privacy'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String?,
      preferences: json['preferences'] == null
          ? PrivacySettings.empty()
          : PrivacySettings.fromJson(
              json['preferences'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? Notifications.empty()
          : Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
      bankAccountName: json['bank_account_name'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      householdPermissions: json['household_permissions'] == null
          ? HouseholdPermissions.empty()
          : HouseholdPermissions.fromJson(
              json['household_permissions'] as Map<String, dynamic>),
      preferredPaymentMethod: json['preferred_payment_method'] as String? ?? '',
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'privacy': instance.privacy.toJson(),
      'bank_name': instance.bankName,
      'preferences': instance.preferences.toJson(),
      'notifications': instance.notifications.toJson(),
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'household_permissions': instance.householdPermissions.toJson(),
      'preferred_payment_method': instance.preferredPaymentMethod,
    };
