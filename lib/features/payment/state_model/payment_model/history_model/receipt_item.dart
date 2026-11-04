import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'receipt_item.freezed.dart';
part 'receipt_item.g.dart';

@freezed
class ReceiptItem with _$ReceiptItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReceiptItem({
    String? amount,
    int? dueId,
    String? category,
    String? dueDate,
    String? reference,
  }) = _ReceiptItem;

  factory ReceiptItem.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemFromJson(json);

  factory ReceiptItem.safeFromJson(Map<String, dynamic>? json) {
    return ReceiptItem(
      amount: NullSafetyHelper.safeString(json?['amount']),
      dueId: NullSafetyHelper.safeInt(json?['due_id']),
      category: NullSafetyHelper.safeString(json?['category']),
      dueDate: NullSafetyHelper.safeString(json?['due_date']),
      reference: NullSafetyHelper.safeString(json?['reference']),
    );
  }

  factory ReceiptItem.empty() => const ReceiptItem(amount: '0.00', dueId: 0, category: '', dueDate: '', reference: '');
}
