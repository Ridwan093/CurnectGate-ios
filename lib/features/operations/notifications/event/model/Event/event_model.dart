// event_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'rsvp_counts_model.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class Event with _$Event {
   @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Event({
    int? id,
    String? title,
    String? start,
    String? end,
    String? location,
    String? venue,
    String? category,
    String? type,
    String? status,
    String? duration,
    dynamic userRsvp,
    bool? addedToCalendar,
    bool? canRsvp,
    RsvpCounts? rsvpCounts,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  factory Event.fromSafeJson(Map<String, dynamic> json) {
    return Event(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      start: NullSafetyHelper.safeString(json['start']),
      end: NullSafetyHelper.safeString(json['end']),
      location: NullSafetyHelper.safeString(json['location']),
      venue: NullSafetyHelper.safeString(json['venue']),
      category: NullSafetyHelper.safeString(json['category']),
      type: NullSafetyHelper.safeString(json['type']),
      status: NullSafetyHelper.safeString(json['status']),
      duration: NullSafetyHelper.safeString(json['duration']),
      userRsvp: json['user_rsvp'],
      addedToCalendar: NullSafetyHelper.safeBool(json['added_to_calendar']),
      canRsvp: NullSafetyHelper.safeBool(json['can_rsvp']),
      rsvpCounts: NullSafetyHelper.safeModel(
        json['rsvp_counts'],
        RsvpCounts.fromJson,
        RsvpCounts.empty(),
      ),
    );
  }

  factory Event.empty() => const Event(
        id: null,
        title: null,
        start: null,
        end: null,
        location: null,
        venue: null,
        category: null,
        type: null,
        status: null,
        duration: null,
        userRsvp: null,
        addedToCalendar: null,
        canRsvp: null,
        rsvpCounts: null,
      );
}