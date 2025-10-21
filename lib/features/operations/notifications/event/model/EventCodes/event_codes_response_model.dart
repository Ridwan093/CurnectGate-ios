import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'event_codes_data_model.dart';

part 'event_codes_response_model.freezed.dart';
part 'event_codes_response_model.g.dart';

@freezed
class EventCodesResponse with _$EventCodesResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventCodesResponse({
    bool? status,
    String? message,
    int? code,
    EventCodesData? data,
  }) = _EventCodesResponse;

  factory EventCodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EventCodesResponseFromJson(json);

  factory EventCodesResponse.fromSafeJson(Map<String, dynamic> json) {
    return EventCodesResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        EventCodesData.fromSafeJson,
        EventCodesData.empty(),
      ),
    );
  }

  factory EventCodesResponse.empty() => const EventCodesResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}
