// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventImpl _$$CalendarEventImplFromJson(Map<String, dynamic> json) =>
    _$CalendarEventImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      eventDescriptionFromHost: json['event_description_from_host'] as String?,
      startDatetime: json['start_datetime'] as String?,
      endDatetime: json['end_datetime'] as String?,
      location: json['location'] as String?,
      venue: json['venue'] as String?,
      duration: json['duration'] as String?,
      eventType: json['event_type'] as String?,
      category: json['category'] as String?,
      status: json['status'] as String?,
      createdBy: json['created_by'] as String?,
      requiresRsvp: json['requires_rsvp'] as bool?,
      maxAttendees: (json['max_attendees'] as num?)?.toInt(),
      rsvpCounts: json['rsvp_counts'] == null
          ? null
          : CalendarRsvpCounts.fromJson(
              json['rsvp_counts'] as Map<String, dynamic>),
      userRsvp: json['user_rsvp'] == null
          ? null
          : CalendarUserRsvp.fromJson(
              json['user_rsvp'] as Map<String, dynamic>),
      canRsvp: json['can_rsvp'] as bool?,
      isUpcoming: json['is_upcoming'] as bool?,
      isToday: json['is_today'] as bool?,
      eventImageUrl: json['event_image_url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$CalendarEventImplToJson(_$CalendarEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'event_description_from_host': instance.eventDescriptionFromHost,
      'start_datetime': instance.startDatetime,
      'end_datetime': instance.endDatetime,
      'location': instance.location,
      'venue': instance.venue,
      'duration': instance.duration,
      'event_type': instance.eventType,
      'category': instance.category,
      'status': instance.status,
      'created_by': instance.createdBy,
      'requires_rsvp': instance.requiresRsvp,
      'max_attendees': instance.maxAttendees,
      'rsvp_counts': instance.rsvpCounts?.toJson(),
      'user_rsvp': instance.userRsvp?.toJson(),
      'can_rsvp': instance.canRsvp,
      'is_upcoming': instance.isUpcoming,
      'is_today': instance.isToday,
      'event_image_url': instance.eventImageUrl,
      'created_at': instance.createdAt,
    };
