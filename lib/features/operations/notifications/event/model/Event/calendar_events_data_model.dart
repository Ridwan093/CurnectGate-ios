// calendar_events_data_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'calendar_event_model.dart';

part 'calendar_events_data_model.freezed.dart';
part 'calendar_events_data_model.g.dart';

@freezed
class CalendarEventsData with _$CalendarEventsData {
    @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory CalendarEventsData({
    List<CalendarEvent>? events,
    int? count,
  }) = _CalendarEventsData;

  factory CalendarEventsData.fromJson(Map<String, dynamic> json) => _$CalendarEventsDataFromJson(json);

  factory CalendarEventsData.fromSafeJson(Map<String, dynamic> json) {
    return CalendarEventsData(
      events: _reminderFromJson(json['events']),
      count: NullSafetyHelper.safeInt(json['count']),
    );
  }
 static List<CalendarEvent>? _reminderFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <CalendarEvent>[];

    return value
        .map(
          (item) => NullSafetyHelper.safeModel(
            item,
            CalendarEvent.fromSafeJson, // Use fromSafeJson for nested safety
            CalendarEvent.empty(),
          ),
        )
        .whereType<CalendarEvent>() // Filter out nulls
        .toList();
  }
  factory CalendarEventsData.empty() => const CalendarEventsData(
        events: null,
        count: null,
      );
}