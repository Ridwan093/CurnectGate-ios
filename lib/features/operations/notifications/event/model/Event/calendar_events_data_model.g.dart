// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_events_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventsDataImpl _$$CalendarEventsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarEventsDataImpl(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => CalendarEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CalendarEventsDataImplToJson(
        _$CalendarEventsDataImpl instance) =>
    <String, dynamic>{
      'events': instance.events?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
