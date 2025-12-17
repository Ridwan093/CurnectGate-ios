// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsvp_events_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsvpEventsDataImpl _$$RsvpEventsDataImplFromJson(Map<String, dynamic> json) =>
    _$RsvpEventsDataImpl(
      responseType: json['response_type'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => RsvpEventHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RsvpEventsDataImplToJson(
        _$RsvpEventsDataImpl instance) =>
    <String, dynamic>{
      'response_type': instance.responseType,
      'events': instance.events?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
