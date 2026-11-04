import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'pivot.dart';


part 'due_item.freezed.dart';
part 'due_item.g.dart';

@freezed
class DueItem with _$DueItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DueItem({
    int? id,
    int? estateId,
    int? feeCategoryId,
    int? userId,
    int? propertyId,
    int? createdBy,
    String? referenceNumber,
    String? amount,
    String? amountPaid,
    String? balance,
    String? dueDate,
    String? issueDate,
    String? description,
    String? status,
    String? type,
    bool? isMandatory,
    bool? allowPartialPayment,
    bool? lateFeeApplied,
    dynamic attachments,
    String? internalNotes,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    Pivot? pivot,
  }) = _DueItem;

  factory DueItem.fromJson(Map<String, dynamic> json) =>
      _$DueItemFromJson(json);

  factory DueItem.safeFromJson(Map<String, dynamic>? json) {
    return DueItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      feeCategoryId: NullSafetyHelper.safeInt(json?['fee_category_id']),
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      propertyId: NullSafetyHelper.safeInt(json?['property_id']),
      createdBy: NullSafetyHelper.safeInt(json?['created_by']),
      referenceNumber: NullSafetyHelper.safeString(json?['reference_number']),
      amount: NullSafetyHelper.safeString(json?['amount']),
      amountPaid: NullSafetyHelper.safeString(json?['amount_paid']),
      balance: NullSafetyHelper.safeString(json?['balance']),
      dueDate: NullSafetyHelper.safeString(json?['due_date']),
      issueDate: NullSafetyHelper.safeString(json?['issue_date']),
      description: NullSafetyHelper.safeString(json?['description']),
      status: NullSafetyHelper.safeString(json?['status']),
      type: NullSafetyHelper.safeString(json?['type']),
      isMandatory: NullSafetyHelper.safeBool(json?['is_mandatory']),
      allowPartialPayment: NullSafetyHelper.safeBool(json?['allow_partial_payment']),
      lateFeeApplied: NullSafetyHelper.safeBool(json?['late_fee_applied']),
      attachments: json?['attachments'],
      internalNotes: NullSafetyHelper.safeString(json?['internal_notes']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      deletedAt: json?['deleted_at'],
      pivot: Pivot.safeFromJson(NullSafetyHelper.safeMap(json?['pivot'])),
    );
  }

  factory DueItem.empty() => const DueItem(
        id: 0,
        estateId: 0,
        feeCategoryId: 0,
        userId: 0,
        propertyId: 0,
        createdBy: 0,
        referenceNumber: '',
        amount: '0.00',
        amountPaid: '0.00',
        balance: '0.00',
        dueDate: '',
        issueDate: '',
        description: '',
        status: '',
        type: '',
        isMandatory: false,
        allowPartialPayment: false,
        lateFeeApplied: false,
        attachments: null,
        internalNotes: '',
        createdAt: '',
        updatedAt: '',
        deletedAt: null,
        pivot: null,
      );
}
