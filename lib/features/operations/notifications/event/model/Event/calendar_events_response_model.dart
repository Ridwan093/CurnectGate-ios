// calendar_events_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'calendar_events_data_model.dart';

part 'calendar_events_response_model.freezed.dart';
part 'calendar_events_response_model.g.dart';

@freezed
class CalendarEventsResponse with _$CalendarEventsResponse {
    @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory CalendarEventsResponse({
    bool? status,
    String? message,
    int? code,
    CalendarEventsData? data,
  }) = _CalendarEventsResponse;

  factory CalendarEventsResponse.fromJson(Map<String, dynamic> json) => _$CalendarEventsResponseFromJson(json);

  factory CalendarEventsResponse.fromSafeJson(Map<String, dynamic> json) {
    return CalendarEventsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        CalendarEventsData.fromJson,
        CalendarEventsData.empty(),
      ),
    );
  }

  factory CalendarEventsResponse.empty() => const CalendarEventsResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}