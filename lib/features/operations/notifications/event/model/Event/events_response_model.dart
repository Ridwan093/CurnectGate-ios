// events_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'events_data_model.dart';


part 'events_response_model.freezed.dart';
part 'events_response_model.g.dart';

@freezed
class EventsResponse with _$EventsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventsResponse({
    bool? status,
    String? message,
    int? code,
    EventsData? data,
  }) = _EventsResponse;

  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);

  factory EventsResponse.fromSafeJson(Map<String, dynamic> json) {
    return EventsResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        EventsData.fromSafeJson,
        EventsData.empty(),
      ),
    );
  }

  factory EventsResponse.empty() => const EventsResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}
