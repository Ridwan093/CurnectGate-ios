import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/event_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/period_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_data_model.freezed.dart';
part 'events_data_model.g.dart';

@freezed
class EventsData with _$EventsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventsData({List<Event>? events, CalendarPeriod? period}) =
      _CalendarEventsData;

  factory EventsData.fromJson(Map<String, dynamic> json) =>
      _$EventsDataFromJson(json);

  factory EventsData.fromSafeJson(Map<String, dynamic> json) {
    return EventsData(
      events: _eventsFromJson(json['events']),
      period: NullSafetyHelper.safeModel(
        json['period'],
        CalendarPeriod.fromSafeJson,
        CalendarPeriod.empty(),
      ),
    );
  }

  static List<Event>? _eventsFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <Event>[];

    return value
        .map(
          (item) => NullSafetyHelper.safeModel(
            item,
            Event.fromSafeJson,
            Event.empty(),
          ),
        )
        .whereType<Event>()
        .toList();
  }

  factory EventsData.empty() => const EventsData(events: null, period: null);
}
