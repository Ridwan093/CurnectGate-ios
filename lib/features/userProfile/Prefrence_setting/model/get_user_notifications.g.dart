// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetuserNotificationsImpl _$$GetuserNotificationsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetuserNotificationsImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      data: PreferenceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetuserNotificationsImplToJson(
        _$GetuserNotificationsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data.toJson(),
    };
