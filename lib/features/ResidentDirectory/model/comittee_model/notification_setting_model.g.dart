// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingImpl _$$NotificationSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$NotificationSettingImplToJson(
        _$NotificationSettingImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'description': instance.description,
    };
