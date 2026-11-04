import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'digital_member_id_data.dart';

part 'digital_member_id_response.freezed.dart';
part 'digital_member_id_response.g.dart';

@freezed
class DigitalMemberIdResponse with _$DigitalMemberIdResponse {
  const factory DigitalMemberIdResponse({
    required bool status,
    required String message,
    required int code,
    required DigitalMemberIdData data,
  }) = _DigitalMemberIdResponse;

  factory DigitalMemberIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DigitalMemberIdResponseFromJson(json);

  factory DigitalMemberIdResponse.safeFromJson(Map<String, dynamic>? json) =>
      DigitalMemberIdResponse(
        status: NullSafetyHelper.safeBool(json?['status']),
        message: NullSafetyHelper.safeString(json?['message']),
        code: NullSafetyHelper.safeInt(json?['code']),
        data: DigitalMemberIdData.safeFromJson(json?['data']),
      );
}
