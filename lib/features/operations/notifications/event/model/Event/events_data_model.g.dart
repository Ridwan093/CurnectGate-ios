// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventsDataImpl _$$CalendarEventsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarEventsDataImpl(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      period: json['period'] == null
          ? null
          : CalendarPeriod.fromJson(json['period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CalendarEventsDataImplToJson(
        _$CalendarEventsDataImpl instance) =>
    <String, dynamic>{
      'events': instance.events?.map((e) => e.toJson()).toList(),
      'period': instance.period?.toJson(),
    };
