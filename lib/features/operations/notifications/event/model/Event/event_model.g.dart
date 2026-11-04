// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      location: json['location'] as String?,
      venue: json['venue'] as String?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      duration: json['duration'] as String?,
      userRsvp: json['user_rsvp'],
      addedToCalendar: json['added_to_calendar'] as bool?,
      canRsvp: json['can_rsvp'] as bool?,
      rsvpCounts: json['rsvp_counts'] == null
          ? null
          : RsvpCounts.fromJson(json['rsvp_counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start,
      'end': instance.end,
      'location': instance.location,
      'venue': instance.venue,
      'category': instance.category,
      'type': instance.type,
      'status': instance.status,
      'duration': instance.duration,
      'user_rsvp': instance.userRsvp,
      'added_to_calendar': instance.addedToCalendar,
      'can_rsvp': instance.canRsvp,
      'rsvp_counts': instance.rsvpCounts?.toJson(),
    };
