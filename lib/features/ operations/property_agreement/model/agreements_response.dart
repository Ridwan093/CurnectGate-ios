import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'agreements_data.dart';

part 'agreements_response.freezed.dart';
part 'agreements_response.g.dart';

@freezed
class AgreementsResponse with _$AgreementsResponse {
  @JsonSerializable(explicitToJson: true)
  const factory AgreementsResponse({
    bool? status,
    String? message,
    int? code,
    AgreementsData? data,
  }) = _AgreementsResponse;

  factory AgreementsResponse.fromJson(Map<String, dynamic> json) =>
      _$AgreementsResponseFromJson(json);

  factory AgreementsResponse.safeFromJson(Map<String, dynamic>? json) {
    return AgreementsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: NullSafetyHelper.safeModel(
        json?['data'],
        AgreementsData.safeFromJson,
        null,
      ),
    );
  }
}
