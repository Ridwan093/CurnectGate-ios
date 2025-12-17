import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'rsvp_events_data.dart';

part 'rsvp_events_response.freezed.dart';
part 'rsvp_events_response.g.dart';

@freezed
class RsvpEventsResponse with _$RsvpEventsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RsvpEventsResponse({
    bool? status,
    String? message,
    int? code,
    RsvpEventsData? data,
  }) = _RsvpEventsResponse;

  factory RsvpEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$RsvpEventsResponseFromJson(json);

  factory RsvpEventsResponse.fromSafeJson(Map<String, dynamic> json) {
    return RsvpEventsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        RsvpEventsData.fromJson,
        null,
      ),
    );
  }
}
