import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'rsvp_event_history.dart';

part 'rsvp_events_data.freezed.dart';
part 'rsvp_events_data.g.dart';

@freezed
class RsvpEventsData with _$RsvpEventsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RsvpEventsData({
    String? responseType,
    List<RsvpEventHistory>? events,
    int? count,
  }) = _RsvpEventsData;

  factory RsvpEventsData.fromJson(Map<String, dynamic> json) =>
      _$RsvpEventsDataFromJson(json);

  factory RsvpEventsData.fromSafeJson(Map<String, dynamic> json) {
    return RsvpEventsData(
      responseType: NullSafetyHelper.safeString(json['response_type']),
      count: NullSafetyHelper.safeInt(json['count']),
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => RsvpEventHistory.fromSafeJson(e))
              .toList(),
    );
  }
}
