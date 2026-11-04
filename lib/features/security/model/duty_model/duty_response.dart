import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'duty_data.dart';

part 'duty_response.freezed.dart';
part 'duty_response.g.dart';

@freezed
class DutyResponse with _$DutyResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DutyResponse({
    bool? status,
    String? message,
    int? code,
    DutyData? data,
  }) = _DutyResponse;

  factory DutyResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyResponseFromJson(json);

  factory DutyResponse.safeFromJson(Map<String, dynamic>? json) {
    return DutyResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: DutyData.safeFromJson(json?['data']),
    );
  }
}