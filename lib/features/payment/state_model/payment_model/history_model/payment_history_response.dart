import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_history_data.dart';


part 'payment_history_response.freezed.dart';
part 'payment_history_response.g.dart';

@freezed
class PaymentHistoryResponse with _$PaymentHistoryResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentHistoryResponse({
    bool? status,
    String? message,
    int? code,
    PaymentHistoryData? data,
  }) = _PaymentHistoryResponse;

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryResponseFromJson(json);

  factory PaymentHistoryResponse.safeFromJson(Map<String, dynamic>? json) {
    return PaymentHistoryResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PaymentHistoryData.safeFromJson(NullSafetyHelper.safeMap(json?['data'])),
    );
  }

  factory PaymentHistoryResponse.empty() =>
      const PaymentHistoryResponse(status: false, message: '', code: 0, data: null);
}
