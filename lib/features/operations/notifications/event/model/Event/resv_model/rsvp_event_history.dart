import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'event_info.dart';

part 'rsvp_event_history.freezed.dart';
part 'rsvp_event_history.g.dart';

@freezed
class RsvpEventHistory with _$RsvpEventHistory {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RsvpEventHistory({
    int? rsvpId,
    String? response,
    String? note,
    bool? addedToCalendar,
    String? respondedAt,
    EventInfo? event,
  }) = _RsvpEventHistory;

  factory RsvpEventHistory.fromJson(Map<String, dynamic> json) =>
      _$RsvpEventHistoryFromJson(json);

  factory RsvpEventHistory.fromSafeJson(Map<String, dynamic> json) {
    return RsvpEventHistory(
      rsvpId: NullSafetyHelper.safeInt(json['rsvp_id']),
      response: NullSafetyHelper.safeString(json['response']),
      note: NullSafetyHelper.safeString(json['note']),
      addedToCalendar: NullSafetyHelper.safeBool(json['added_to_calendar']),
      respondedAt: NullSafetyHelper.safeString(json['responded_at']),
      event: NullSafetyHelper.safeModel(
        json['event'],
        EventInfo.fromJson,
        null,
      ),
    );
  }
}
