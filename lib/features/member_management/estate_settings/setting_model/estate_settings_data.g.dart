// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_settings_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateSettingsDataImpl _$$EstateSettingsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateSettingsDataImpl(
      settings: (json['settings'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, EmergencyContacts.fromJson(e as Map<String, dynamic>)),
      ),
      type: json['type'] as String?,
      estate: json['estate'] == null
          ? null
          : EstateInfo.fromJson(json['estate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EstateSettingsDataImplToJson(
        _$EstateSettingsDataImpl instance) =>
    <String, dynamic>{
      'settings': instance.settings?.map((k, e) => MapEntry(k, e.toJson())),
      'type': instance.type,
      'estate': instance.estate?.toJson(),
    };
