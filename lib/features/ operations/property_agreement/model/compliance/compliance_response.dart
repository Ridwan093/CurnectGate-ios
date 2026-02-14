import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'compliance_data.dart';

part 'compliance_response.freezed.dart';
part 'compliance_response.g.dart';

@freezed
class ComplianceResponse with _$ComplianceResponse {
  @JsonSerializable(explicitToJson: true)
  const factory ComplianceResponse({
    bool? status,
    String? message,
    int? code,
    ComplianceData? data,
  }) = _ComplianceResponse;

  factory ComplianceResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplianceResponseFromJson(json);

  factory ComplianceResponse.safeFromJson(Map<String, dynamic>? json) {
    return ComplianceResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: ComplianceData.safeFromJson(json?['data']),
    );
  }
}
