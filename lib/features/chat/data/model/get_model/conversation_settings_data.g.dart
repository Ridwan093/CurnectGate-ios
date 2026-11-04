// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_settings_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationSettingsDataImpl _$$ConversationSettingsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationSettingsDataImpl(
      settings: json['settings'] == null
          ? null
          : ConversationSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConversationSettingsDataImplToJson(
        _$ConversationSettingsDataImpl instance) =>
    <String, dynamic>{
      'settings': instance.settings?.toJson(),
    };
