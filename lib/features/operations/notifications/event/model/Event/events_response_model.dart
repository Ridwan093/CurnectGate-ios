// events_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'event_model.dart';

part 'events_response_model.freezed.dart';
part 'events_response_model.g.dart';

@freezed
class EventsResponse with _$EventsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventsResponse({
    bool? status,
    String? message,
    int? code,
    List<Event>? events,
  }) = _EventsResponse;

  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);

  factory EventsResponse.fromSafeJson(Map<String, dynamic> json) {
    return EventsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      events: _reminderFromJson(json['events']),
    );
  }
  static List<Event>? _reminderFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <Event>[];

    return value
        .map(
          (item) => NullSafetyHelper.safeModel(
            item,
            Event.fromSafeJson, // Use fromSafeJson for nested safety
            Event.empty(),
          ),
        )
        .whereType<Event>() // Filter out nulls
        .toList();
  }

  factory EventsResponse.empty() => const EventsResponse(
    status: null,
    message: null,
    code: null,
    events: null,
  );
}
