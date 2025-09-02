// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_count_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationCountDataImpl _$$NotificationCountDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationCountDataImpl(
      count: (json['count'] as num?)?.toInt(),
      unreadOnly: json['unread_only'] as bool?,
      estateId: (json['estate_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationCountDataImplToJson(
        _$NotificationCountDataImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'unread_only': instance.unreadOnly,
      'estate_id': instance.estateId,
    };
