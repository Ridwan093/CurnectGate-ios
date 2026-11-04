import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'calendar_rsvp_counts_model.dart';
import 'calendar_user_rsvp_model.dart';

part 'calendar_event_model.freezed.dart';
part 'calendar_event_model.g.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CalendarEvent({
    int? id,
    String? title,
    String? description,
    String? eventDescriptionFromHost,
    String? startDatetime,
    String? endDatetime,
    String? location,
    String? venue,
    String? duration,
    String? eventType,
    String? category,
    String? status,
    String? createdBy,
    bool? requiresRsvp,
    int? maxAttendees,
    CalendarRsvpCounts? rsvpCounts,
    CalendarUserRsvp? userRsvp,
    bool? canRsvp,
    bool? isUpcoming,
    bool? isToday,
    String? eventImageUrl,
    String? createdAt,
  }) = _CalendarEvent;

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => _$CalendarEventFromJson(json);

  factory CalendarEvent.fromSafeJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      description: NullSafetyHelper.safeString(json['description']),
      eventDescriptionFromHost: NullSafetyHelper.safeString(json['event_description_from_host']),
      startDatetime: NullSafetyHelper.safeString(json['start_datetime']),
      endDatetime: NullSafetyHelper.safeString(json['end_datetime']),
      location: NullSafetyHelper.safeString(json['location']),
      venue: NullSafetyHelper.safeString(json['venue']),
      duration: NullSafetyHelper.safeString(json['duration']),
      eventType: NullSafetyHelper.safeString(json['event_type']),
      category: NullSafetyHelper.safeString(json['category']),
      status: NullSafetyHelper.safeString(json['status']),
      createdBy: NullSafetyHelper.safeString(json['created_by']),
      requiresRsvp: NullSafetyHelper.safeBool(json['requires_rsvp']),
      maxAttendees: NullSafetyHelper.safeInt(json['max_attendees']),
      rsvpCounts: NullSafetyHelper.safeModel(
        json['rsvp_counts'],
        CalendarRsvpCounts.fromJson,
        CalendarRsvpCounts.empty(),
      ),
      userRsvp: NullSafetyHelper.safeModel(
        json['user_rsvp'],
        CalendarUserRsvp.fromJson,
        null,
      ),
      canRsvp: NullSafetyHelper.safeBool(json['can_rsvp']),
      isUpcoming: NullSafetyHelper.safeBool(json['is_upcoming']),
      isToday: NullSafetyHelper.safeBool(json['is_today']),
      eventImageUrl: NullSafetyHelper.safeString(json['event_image_url']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
    );
  }

  factory CalendarEvent.empty() => const CalendarEvent(
        id: null,
        title: null,
        description: null,
        eventDescriptionFromHost: null,
        startDatetime: null,
        endDatetime: null,
        location: null,
        venue: null,
        duration: null,
        eventType: null,
        category: null,
        status: null,
        createdBy: null,
        requiresRsvp: null,
        maxAttendees: null,
        rsvpCounts: null,
        userRsvp: null,
        canRsvp: null,
        isUpcoming: null,
        isToday: null,
        eventImageUrl: null,
        createdAt: null,
      );
}

