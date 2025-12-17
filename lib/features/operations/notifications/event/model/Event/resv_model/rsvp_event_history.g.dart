// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsvp_event_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsvpEventHistoryImpl _$$RsvpEventHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$RsvpEventHistoryImpl(
      rsvpId: (json['rsvp_id'] as num?)?.toInt(),
      response: json['response'] as String?,
      note: json['note'] as String?,
      addedToCalendar: json['added_to_calendar'] as bool?,
      respondedAt: json['responded_at'] as String?,
      event: json['event'] == null
          ? null
          : EventInfo.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RsvpEventHistoryImplToJson(
        _$RsvpEventHistoryImpl instance) =>
    <String, dynamic>{
      'rsvp_id': instance.rsvpId,
      'response': instance.response,
      'note': instance.note,
      'added_to_calendar': instance.addedToCalendar,
      'responded_at': instance.respondedAt,
      'event': instance.event?.toJson(),
    };
