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
      );
}
