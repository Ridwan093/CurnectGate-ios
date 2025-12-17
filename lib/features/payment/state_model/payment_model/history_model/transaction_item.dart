import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'metadata.dart';
import 'due_item.dart';
import 'receipt.dart';


part 'transaction_item.freezed.dart';
part 'transaction_item.g.dart';

@freezed
class TransactionItem with _$TransactionItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory TransactionItem({
    int? id,
    int? estateId,
    int? userId,
    int? walletId,
    String? transactionReference,
    String? paymentReference,
    String? amount,
    String? paymentMethod,
    String? paymentGateway,
    String? transactionType,
    String? status,
    String? description,
    Metadata? metadata,
    String? paidAt,
    String? createdAt,
    String? updatedAt,
    List<DueItem>? dues,
    Receipt? receipt,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  factory TransactionItem.safeFromJson(Map<String, dynamic>? json) {
    return TransactionItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      walletId: NullSafetyHelper.safeInt(json?['wallet_id']),
      transactionReference: NullSafetyHelper.safeString(json?['transaction_reference']),
      paymentReference: NullSafetyHelper.safeString(json?['payment_reference']),
      amount: NullSafetyHelper.safeString(json?['amount']),
      paymentMethod: NullSafetyHelper.safeString(json?['payment_method']),
      paymentGateway: NullSafetyHelper.safeString(json?['payment_gateway']),
      transactionType: NullSafetyHelper.safeString(json?['transaction_type']),
      status: NullSafetyHelper.safeString(json?['status']),
      description: NullSafetyHelper.safeString(json?['description']),
      metadata: Metadata.safeFromJson(NullSafetyHelper.safeMap(json?['metadata'])),
      paidAt: NullSafetyHelper.safeString(json?['paid_at']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      dues: (NullSafetyHelper.safeList(json?['dues']) ?? [])
          .map((e) => DueItem.safeFromJson(NullSafetyHelper.safeMap(e)))
          .toList(),
      receipt: Receipt.safeFromJson(NullSafetyHelper.safeMap(json?['receipt'])),
    );
  }

  factory TransactionItem.empty() => const TransactionItem(
        id: 0,
        estateId: 0,
        userId: 0,
        walletId: 0,
        transactionReference: '',
        paymentReference: '',
        amount: '0.00',
        paymentMethod: '',
        paymentGateway: null,
        transactionType: '',
        status: '',
        description: '',
        metadata: null,
        paidAt: '',
        createdAt: '',
        updatedAt: '',
        dues: [],
        receipt: null,
      );
}
