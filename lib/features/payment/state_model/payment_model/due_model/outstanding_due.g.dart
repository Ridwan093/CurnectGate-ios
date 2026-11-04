// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_due.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingDueImpl _$$OutstandingDueImplFromJson(Map<String, dynamic> json) =>
    _$OutstandingDueImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      feeCategoryId: (json['fee_category_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      referenceNumber: json['reference_number'] as String?,
      amount: json['amount'] as String?,
      amountPaid: json['amount_paid'] as String?,
      balance: json['balance'] as String?,
      dueDate: json['due_date'] as String?,
      issueDate: json['issue_date'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      isMandatory: json['is_mandatory'] as bool?,
      allowPartialPayment: json['allow_partial_payment'] as bool?,
      lateFeeApplied: json['late_fee_applied'] as bool?,
      attachments: json['attachments'],
      internalNotes: json['internal_notes'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      feeCategory: json['fee_category'] == null
          ? null
          : FeeCategory.fromJson(json['fee_category'] as Map<String, dynamic>),
      lateFees: json['late_fees'] as List<dynamic>?,
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
      minimumPayableAmount: json['minimum_payable_amount'] as String?,
    );

Map<String, dynamic> _$$OutstandingDueImplToJson(
        _$OutstandingDueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'fee_category_id': instance.feeCategoryId,
      'user_id': instance.userId,
      'property_id': instance.propertyId,
      'created_by': instance.createdBy,
      'reference_number': instance.referenceNumber,
      'amount': instance.amount,
      'amount_paid': instance.amountPaid,
      'balance': instance.balance,
      'due_date': instance.dueDate,
      'issue_date': instance.issueDate,
      'description': instance.description,
      'status': instance.status,
      'type': instance.type,
      'is_mandatory': instance.isMandatory,
      'allow_partial_payment': instance.allowPartialPayment,
      'late_fee_applied': instance.lateFeeApplied,
      'attachments': instance.attachments,
      'internal_notes': instance.internalNotes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'fee_category': instance.feeCategory?.toJson(),
      'late_fees': instance.lateFees,
      'property': instance.property?.toJson(),
      'minimum_payable_amount': instance.minimumPayableAmount,
    };
