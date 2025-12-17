import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'active_count_data.dart';


part 'active_count_response.freezed.dart';
part 'active_count_response.g.dart';

@freezed
class ActiveCountResponse with _$ActiveCountResponse {
  const factory ActiveCountResponse({
    bool? status,
    String? message,
    int? code,
    ActiveCountData? data,
  }) = _ActiveCountResponse;

  factory ActiveCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveCountResponseFromJson(json);

  factory ActiveCountResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ActiveCountResponse();
    return ActiveCountResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: ActiveCountData.safeFromJson(json['data']),
    );
  }
}
