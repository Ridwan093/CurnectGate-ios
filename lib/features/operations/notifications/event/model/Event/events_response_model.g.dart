// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsResponseImpl _$$EventsResponseImplFromJson(Map<String, dynamic> json) =>
    _$EventsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventsResponseImplToJson(
        _$EventsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'events': instance.events?.map((e) => e.toJson()).toList(),
    };
