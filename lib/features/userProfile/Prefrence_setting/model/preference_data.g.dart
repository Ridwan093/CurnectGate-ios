// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceDataImpl _$$PreferenceDataImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceDataImpl(
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PreferenceDataImplToJson(
        _$PreferenceDataImpl instance) =>
    <String, dynamic>{
      'preferences': instance.preferences,
    };
