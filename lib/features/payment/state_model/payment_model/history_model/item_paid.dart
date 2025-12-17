import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'item_paid.freezed.dart';
part 'item_paid.g.dart';

@freezed
class ItemPaid with _$ItemPaid {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ItemPaid({
    String? amount,
    int? dueId,
    String? category,
    String? dueDate,
    String? reference,
  }) = _ItemPaid;

  factory ItemPaid.fromJson(Map<String, dynamic> json) =>
      _$ItemPaidFromJson(json);

  factory ItemPaid.safeFromJson(Map<String, dynamic>? json) {
    return ItemPaid(
      amount: NullSafetyHelper.safeString(json?['amount']),
      dueId: NullSafetyHelper.safeInt(json?['due_id']),
      category: NullSafetyHelper.safeString(json?['category']),
      dueDate: NullSafetyHelper.safeString(json?['due_date']),
      reference: NullSafetyHelper.safeString(json?['reference']),
    );
  }

  factory ItemPaid.empty() =>
      const ItemPaid(amount: '0.00', dueId: 0, category: '', dueDate: '', reference: '');
}
