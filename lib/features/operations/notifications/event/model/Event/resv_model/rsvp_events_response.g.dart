// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsvp_events_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsvpEventsResponseImpl _$$RsvpEventsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RsvpEventsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RsvpEventsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RsvpEventsResponseImplToJson(
        _$RsvpEventsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
