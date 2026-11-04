// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chairperson_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChairpersonSettingsImpl _$$ChairpersonSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChairpersonSettingsImpl(
      privacy: (json['privacy'] as List<dynamic>?)
          ?.map((e) => PrivacySetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferences: (json['preferences'] as List<dynamic>?)
          ?.map((e) => PreferenceSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankName: json['bank_name'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      householdPermissions: json['household_permissions'] == null
          ? null
          : HouseholdPermissions.fromJson(
              json['household_permissions'] as Map<String, dynamic>),
      preferredPaymentMethod: json['preferred_payment_method'] as String?,
    );

Map<String, dynamic> _$$ChairpersonSettingsImplToJson(
        _$ChairpersonSettingsImpl instance) =>
    <String, dynamic>{
      'privacy': instance.privacy?.map((e) => e.toJson()).toList(),
      'preferences': instance.preferences?.map((e) => e.toJson()).toList(),
      'notifications': instance.notifications?.map((e) => e.toJson()).toList(),
      'bank_name': instance.bankName,
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'household_permissions': instance.householdPermissions?.toJson(),
      'preferred_payment_method': instance.preferredPaymentMethod,
    };
