import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'wallet_transaction_item.freezed.dart';
part 'wallet_transaction_item.g.dart';

@freezed
class WalletTransactionItem with _$WalletTransactionItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WalletTransactionItem({
    int? id,
    int? walletId,
    String? amount,
    String? referenceNo,
    int? estateId,
    String? type,
    String? description,
    int? accepted,
    String? createdAt,
    String? updatedAt,
  }) = _WalletTransactionItem;

  factory WalletTransactionItem.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionItemFromJson(json);

  factory WalletTransactionItem.safeFromJson(Map<String, dynamic>? json) {
    return WalletTransactionItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      walletId: NullSafetyHelper.safeInt(json?['wallet_id']),
      amount: NullSafetyHelper.safeString(json?['amount']),
      referenceNo: NullSafetyHelper.safeString(json?['reference_no']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      type: NullSafetyHelper.safeString(json?['type']),
      description: NullSafetyHelper.safeString(json?['description']),
      accepted: NullSafetyHelper.safeInt(json?['accepted']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory WalletTransactionItem.empty() => const WalletTransactionItem(
        id: 0,
        walletId: 0,
        amount: '0.00',
        referenceNo: '',
        estateId: 0,
        type: '',
        description: '',
        accepted: 0,
        createdAt: '',
        updatedAt: '',
      );
}
