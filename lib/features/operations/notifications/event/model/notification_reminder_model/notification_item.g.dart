// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationItemImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      mediaUrl: json['media_url'] as String?,
      mediaKey: json['media_key'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      estate: json['estate'] == null
          ? null
          : Estate.fromJson(json['estate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationItemImplToJson(
        _$NotificationItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'estate_id': instance.estateId,
      'media_url': instance.mediaUrl,
      'media_key': instance.mediaKey,
      'type': instance.type,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'estate': instance.estate?.toJson(),
    };
