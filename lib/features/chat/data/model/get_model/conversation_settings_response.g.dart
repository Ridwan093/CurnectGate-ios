// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationSettingsResponseImpl _$$ConversationSettingsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationSettingsResponseImpl(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ConversationSettingsData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConversationSettingsResponseImplToJson(
        _$ConversationSettingsResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
