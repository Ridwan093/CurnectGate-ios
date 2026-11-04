// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_user_rsvp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarUserRsvpImpl _$$CalendarUserRsvpImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarUserRsvpImpl(
      response: json['response'] as String?,
      addedToCalendar: json['added_to_calendar'] as bool?,
      respondedAt: json['responded_at'] as String?,
    );

Map<String, dynamic> _$$CalendarUserRsvpImplToJson(
        _$CalendarUserRsvpImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'added_to_calendar': instance.addedToCalendar,
      'responded_at': instance.respondedAt,
    };
