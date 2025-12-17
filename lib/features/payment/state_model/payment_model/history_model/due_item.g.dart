// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'due_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DueItemImpl _$$DueItemImplFromJson(Map<String, dynamic> json) =>
    _$DueItemImpl(
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
      internalNotes: json['internal_notes'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DueItemImplToJson(_$DueItemImpl instance) =>
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
      'pivot': instance.pivot?.toJson(),
    };
