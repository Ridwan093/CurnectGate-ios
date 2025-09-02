// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_events_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventsResponseImpl _$$CalendarEventsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarEventsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CalendarEventsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CalendarEventsResponseImplToJson(
        _$CalendarEventsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
