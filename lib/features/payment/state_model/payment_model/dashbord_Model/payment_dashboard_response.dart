import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_dashboard_data.dart';


part 'payment_dashboard_response.freezed.dart';
part 'payment_dashboard_response.g.dart';

@freezed
class PaymentDashboardResponse with _$PaymentDashboardResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentDashboardResponse({
    bool? status,
    String? message,
    int? code,
    PaymentDashboardData? data,
  }) = _PaymentDashboardResponse;

  factory PaymentDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentDashboardResponseFromJson(json);

  factory PaymentDashboardResponse.safeFromJson(Map<String, dynamic>? json) {
    return PaymentDashboardResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PaymentDashboardData.safeFromJson(json?['data']),
    );
  }

  factory PaymentDashboardResponse.empty() => PaymentDashboardResponse(
        status: false,
        message: '',
        code: 0,
        data: PaymentDashboardData.empty(),
      );
}
