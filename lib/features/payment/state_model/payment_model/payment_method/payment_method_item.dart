import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'payment_method_item.freezed.dart';
part 'payment_method_item.g.dart';

@freezed
class PaymentMethodItem with _$PaymentMethodItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentMethodItem({
    int? id,
    String? name,
    String? type,
    String? description,
    String? publicKey,
    String? secretKey,
    String? currency,
    String? environment,
    /// Percentage charge e.g. "1.5" → 1.5% of the entered amount.
    /// If this is "0" or null, fall back to [chargeFlat].
    String? chargePercentage,
    /// Flat charge e.g. "100" → ₦100 fixed fee.
    /// If this is "0" or null, use [chargePercentage] instead.
    String? chargeFlat,
  }) = _PaymentMethodItem;

  factory PaymentMethodItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodItemFromJson(json);

  factory PaymentMethodItem.safeFromJson(Map<String, dynamic>? json) {
    return PaymentMethodItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      type: NullSafetyHelper.safeString(json?['type']),
      description: NullSafetyHelper.safeString(json?['description']),
      publicKey: NullSafetyHelper.safeString(json?['public_key']),
      secretKey: NullSafetyHelper.safeString(json?['secret_key']),
      currency: NullSafetyHelper.safeString(json?['currency']),
      environment: NullSafetyHelper.safeString(json?['environment']),
      chargePercentage: NullSafetyHelper.safeString(json?['charge_percentage']),
      chargeFlat: NullSafetyHelper.safeString(json?['charge_flat']),
    );
  }

  factory PaymentMethodItem.empty() => const PaymentMethodItem(
        id: 0,
        name: '',
        type: '',
        description: '',
        publicKey: '',
        secretKey: '',
        currency: '',
        environment: '',
        chargePercentage: '0',
        chargeFlat: '0',
      );
}
