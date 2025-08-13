// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacySettingsImpl _$$PrivacySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacySettingsImpl(
      showEmail: json['show_email'] as bool? ?? false,
      showPhone: json['show_phone'] as bool? ?? false,
      profileVisibility: json['profile_visibility'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrivacySettingsImplToJson(
        _$PrivacySettingsImpl instance) =>
    <String, dynamic>{
      'show_email': instance.showEmail,
      'show_phone': instance.showPhone,
      'profile_visibility': instance.profileVisibility,
    };
