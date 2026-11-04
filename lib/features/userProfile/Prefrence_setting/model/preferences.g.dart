// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesImpl _$$PreferencesImplFromJson(Map<String, dynamic> json) =>
    _$PreferencesImpl(
      currency: json['currency'] == null
          ? null
          : Preference.fromJson(json['currency'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Preference.fromJson(json['language'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Preference.fromJson(json['timezone'] as Map<String, dynamic>),
      dateFormat: json['date_format'] == null
          ? null
          : Preference.fromJson(json['date_format'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PreferencesImplToJson(_$PreferencesImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'language': instance.language,
      'timezone': instance.timezone,
      'date_format': instance.dateFormat,
    };
