import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'pivot.freezed.dart';
part 'pivot.g.dart';

@freezed
class Pivot with _$Pivot {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Pivot({
    int? paymentTransactionId,
    int? dueId,
    String? amountPaid,
    int? isPartial,
    String? createdAt,
    String? updatedAt,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  factory Pivot.safeFromJson(Map<String, dynamic>? json) {
    return Pivot(
      paymentTransactionId: NullSafetyHelper.safeInt(json?['payment_transaction_id']),
      dueId: NullSafetyHelper.safeInt(json?['due_id']),
      amountPaid: NullSafetyHelper.safeString(json?['amount_paid']),
      isPartial: NullSafetyHelper.safeInt(json?['is_partial']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory Pivot.empty() => const Pivot(
        paymentTransactionId: 0,
        dueId: 0,
        amountPaid: '0.00',
        isPartial: 0,
        createdAt: '',
        updatedAt: '',
      );
}
