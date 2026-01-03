
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:curnectgate/features/security/model/count_model/violation_count_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_count_response.freezed.dart';
part 'violation_count_response.g.dart';

@freezed
class ViolationCountResponse with _$ViolationCountResponse {
   @JsonSerializable(explicitToJson: true)
  const factory ViolationCountResponse({
    bool? status,
    String? message,
    int? code,
    ViolationCountData? data,
  }) = _ViolationCountResponse;

  factory ViolationCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ViolationCountResponseFromJson(json);

  factory ViolationCountResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ViolationCountResponse();

    return ViolationCountResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: ViolationCountData.safeFromJson(json['data']),
    );
  }
}
