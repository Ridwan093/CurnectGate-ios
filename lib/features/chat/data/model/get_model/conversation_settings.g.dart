// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationSettingsImpl _$$ConversationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationSettingsImpl(
      id: (json['id'] as num?)?.toInt(),
      conversationId: (json['conversation_id'] as num?)?.toInt(),
      notificationsEnabled: json['notifications_enabled'] as bool?,
      doNotDisturb: json['do_not_disturb'] as bool?,
      dndUntil: json['dnd_until'] as String?,
      dndActive: json['dnd_active'] as bool?,
      archived: json['archived'] as bool?,
      pinned: json['pinned'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ConversationSettingsImplToJson(
        _$ConversationSettingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'notifications_enabled': instance.notificationsEnabled,
      'do_not_disturb': instance.doNotDisturb,
      'dnd_until': instance.dndUntil,
      'dnd_active': instance.dndActive,
      'archived': instance.archived,
      'pinned': instance.pinned,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
