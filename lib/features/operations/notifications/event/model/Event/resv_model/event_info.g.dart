// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventInfoImpl _$$EventInfoImplFromJson(Map<String, dynamic> json) =>
    _$EventInfoImpl(
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
      hostedBy: json['hosted_by'] as String?,
      eventImageUrl: json['event_image_url'] as String?,
      isUpcoming: json['is_upcoming'] as bool?,
      isToday: json['is_today'] as bool?,
      rsvpCounts: json['rsvp_counts'] == null
          ? null
          : RsvpCounts.fromJson(json['rsvp_counts'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$EventInfoImplToJson(_$EventInfoImpl instance) =>
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
      'hosted_by': instance.hostedBy,
      'event_image_url': instance.eventImageUrl,
      'is_upcoming': instance.isUpcoming,
      'is_today': instance.isToday,
      'rsvp_counts': instance.rsvpCounts?.toJson(),
      'created_at': instance.createdAt,
    };
