// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notification_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserNotificationSettingsImpl _$$GetUserNotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserNotificationSettingsImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserNotificationSettingsImplToJson(
        _$GetUserNotificationSettingsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
