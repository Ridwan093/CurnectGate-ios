import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'recent_transaction.freezed.dart';
part 'recent_transaction.g.dart';

@freezed
class RecentTransaction with _$RecentTransaction {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RecentTransaction({
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
  }) = _RecentTransaction;

  factory RecentTransaction.fromJson(Map<String, dynamic> json) =>
      _$RecentTransactionFromJson(json);

  factory RecentTransaction.safeFromJson(Map<String, dynamic>? json) {
    return RecentTransaction(
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

  factory RecentTransaction.empty() => const RecentTransaction(
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
