import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'fee_category.dart';
import 'property.dart';


part 'outstanding_due.freezed.dart';
part 'outstanding_due.g.dart';

@freezed
class OutstandingDue with _$OutstandingDue {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory OutstandingDue({
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
    dynamic internalNotes,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    FeeCategory? feeCategory,
    List<dynamic>? lateFees,
    Property? property,
    String? minimumPayableAmount,
  }) = _OutstandingDue;

  const OutstandingDue._();

  String get title => feeCategory?.name ?? description ?? 'Bill';
  bool get isFullPaymentOnly => !(allowPartialPayment ?? true);

  factory OutstandingDue.fromJson(Map<String, dynamic> json) =>
      _$OutstandingDueFromJson(json);

  factory OutstandingDue.safeFromJson(Map<String, dynamic>? json) {
    return OutstandingDue(
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
      internalNotes: json?['internal_notes'],
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      deletedAt: json?['deleted_at'],
      feeCategory: FeeCategory.safeFromJson(NullSafetyHelper.safeMap(json?['fee_category'])),
      lateFees: NullSafetyHelper.safeList(json?['late_fees']),
      property: Property.safeFromJson(NullSafetyHelper.safeMap(json?['property'])),
      minimumPayableAmount: NullSafetyHelper.safeString(json?['minimum_payable_amount']),
    );
  }

  factory OutstandingDue.empty() => const OutstandingDue(
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
        internalNotes: null,
        createdAt: '',
        updatedAt: '',
        deletedAt: null,
        feeCategory: null,
        lateFees: [],
        property: null,
        minimumPayableAmount: '0.00',
      );
}
