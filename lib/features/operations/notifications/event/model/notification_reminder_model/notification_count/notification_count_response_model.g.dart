// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_count_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationCountResponseImpl _$$NotificationCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationCountResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : NotificationCountData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationCountResponseImplToJson(
        _$NotificationCountResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
