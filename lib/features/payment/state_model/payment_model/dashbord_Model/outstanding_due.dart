import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'outstanding_due.freezed.dart';
part 'outstanding_due.g.dart';

@freezed
class OutstandingDue with _$OutstandingDue {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory OutstandingDue({
    int? id,
    String? reference,
    String? category,
    String? amount,
    String? paid,
    String? balance,
    String? dueDate,
    bool? isOverdue,
    int? daysOverdue,
    String? status,
  }) = _OutstandingDue;

  factory OutstandingDue.fromJson(Map<String, dynamic> json) =>
      _$OutstandingDueFromJson(json);

  factory OutstandingDue.safeFromJson(Map<String, dynamic>? json) {
    return OutstandingDue(
      id: NullSafetyHelper.safeInt(json?['id']),
      reference: NullSafetyHelper.safeString(json?['reference']),
      category: NullSafetyHelper.safeString(json?['category']),
      amount: NullSafetyHelper.safeString(json?['amount']),
      paid: NullSafetyHelper.safeString(json?['paid']),
      balance: NullSafetyHelper.safeString(json?['balance']),
      dueDate: NullSafetyHelper.safeString(json?['due_date']),
      isOverdue: NullSafetyHelper.safeBool(json?['is_overdue']),
      daysOverdue: NullSafetyHelper.safeInt(json?['days_overdue']),
      status: NullSafetyHelper.safeString(json?['status']),
    );
  }

  factory OutstandingDue.empty() => const OutstandingDue(
        id: 0,
        reference: '',
        category: '',
        amount: '0.00',
        paid: '0.00',
        balance: '0.00',
        dueDate: '',
        isOverdue: false,
        daysOverdue: 0,
        status: '',
      );
}
