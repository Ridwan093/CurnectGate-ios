// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesSettingsImpl _$$PreferencesSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferencesSettingsImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => PreferenceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PreferencesSettingsImplToJson(
        _$PreferencesSettingsImpl instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
