import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_methods_data.dart';

part 'payment_methods_response.freezed.dart';
part 'payment_methods_response.g.dart';

@freezed
class PaymentMethodsResponse with _$PaymentMethodsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentMethodsResponse({
    bool? status,
    String? message,
    int? code,
    PaymentMethodsData? data,
  }) = _PaymentMethodsResponse;

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsResponseFromJson(json);

  factory PaymentMethodsResponse.safeFromJson(Map<String, dynamic>? json) {
    return PaymentMethodsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PaymentMethodsData.safeFromJson(
        NullSafetyHelper.safeMap(json?['data']),
      ),
    );
  }

  factory PaymentMethodsResponse.empty() => const PaymentMethodsResponse(
    status: false,
    message: '',
    code: 0,
    data: null,
  );
}
