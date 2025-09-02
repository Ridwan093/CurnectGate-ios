import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_user_rsvp_model.freezed.dart';
part 'calendar_user_rsvp_model.g.dart';

@freezed
class CalendarUserRsvp with _$CalendarUserRsvp {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory CalendarUserRsvp({
    String? response,
    @JsonKey(name: 'added_to_calendar') bool? addedToCalendar,
    @JsonKey(name: 'responded_at') String? respondedAt,
  }) = _CalendarUserRsvp;

  factory CalendarUserRsvp.fromJson(Map<String, dynamic> json) => 
      _$CalendarUserRsvpFromJson(json);

  factory CalendarUserRsvp.fromSafeJson(Map<String, dynamic> json) {
    return CalendarUserRsvp(
      response: NullSafetyHelper.safeString(json['response']),
      addedToCalendar: NullSafetyHelper.safeBool(json['added_to_calendar']),
      respondedAt: NullSafetyHelper.safeString(json['responded_at']),
    );
  }

  factory CalendarUserRsvp.empty() => const CalendarUserRsvp(
        response: null,
        addedToCalendar: null,
        respondedAt: null,
      );
}

// ✅ ADD GETTERS AS EXTENSION (outside the class)
extension CalendarUserRsvpExtensions on CalendarUserRsvp {
  bool get isGoing => response != null && response!.toLowerCase() == 'going';
  
  bool get isNotGoing => response != null && response!.toLowerCase() == 'not_going';
  
  bool get isMaybe => response != null && response!.toLowerCase() == 'maybe';
  
  bool get isAddedToCalendar => addedToCalendar ?? false;
  
  bool get hasResponded => response != null;
}