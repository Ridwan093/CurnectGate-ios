import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'rsvp_counts.dart';

part 'event_info.freezed.dart';
part 'event_info.g.dart';

@freezed
class EventInfo with _$EventInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventInfo({
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
    String? hostedBy,
    String? eventImageUrl,
    bool? isUpcoming,
    bool? isToday,
    RsvpCounts? rsvpCounts,
    String? createdAt,
  }) = _EventInfo;

  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);

  factory EventInfo.fromSafeJson(Map<String, dynamic> json) {
    return EventInfo(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      description: NullSafetyHelper.safeString(json['description']),
      eventDescriptionFromHost:
          NullSafetyHelper.safeString(json['event_description_from_host']),
      startDatetime: NullSafetyHelper.safeString(json['start_datetime']),
      endDatetime: NullSafetyHelper.safeString(json['end_datetime']),
      location: NullSafetyHelper.safeString(json['location']),
      venue: NullSafetyHelper.safeString(json['venue']),
      duration: NullSafetyHelper.safeString(json['duration']),
      eventType: NullSafetyHelper.safeString(json['event_type']),
      category: NullSafetyHelper.safeString(json['category']),
      status: NullSafetyHelper.safeString(json['status']),
      hostedBy: NullSafetyHelper.safeString(json['hosted_by']),
      eventImageUrl: NullSafetyHelper.safeString(json['event_image_url']),
      isUpcoming: NullSafetyHelper.safeBool(json['is_upcoming']),
      isToday: NullSafetyHelper.safeBool(json['is_today']),
      rsvpCounts: NullSafetyHelper.safeModel(
        json['rsvp_counts'],
        RsvpCounts.fromJson,
        null,
      ),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
    );
  }

  factory EventInfo.empty() => const EventInfo(
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
        hostedBy: null,
        eventImageUrl: null,
        isUpcoming: null,
        isToday: null,
        rsvpCounts: null,
        createdAt: null,
      );
}
