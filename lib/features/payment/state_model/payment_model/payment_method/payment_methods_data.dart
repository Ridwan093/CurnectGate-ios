import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_method_item.dart';

part 'payment_methods_data.freezed.dart';
part 'payment_methods_data.g.dart';

@freezed
class PaymentMethodsData with _$PaymentMethodsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentMethodsData({
    @JsonKey(name: 'payment_methods') List<PaymentMethodItem>? paymentMethods,
    int? total,
    int? estateId,
  }) = _PaymentMethodsData;

  factory PaymentMethodsData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsDataFromJson(json);

  factory PaymentMethodsData.safeFromJson(Map<String, dynamic>? json) {
    return PaymentMethodsData(
      paymentMethods:
          (NullSafetyHelper.safeList(json?['payment_methods']))
              .map(
                (e) =>
                    PaymentMethodItem.safeFromJson(NullSafetyHelper.safeMap(e)),
              )
              .toList(),
      total: NullSafetyHelper.safeInt(json?['total']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
    );
  }

  factory PaymentMethodsData.empty() =>
      const PaymentMethodsData(paymentMethods: [], total: 0, estateId: 0);
}
