// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PivotImpl _$$PivotImplFromJson(Map<String, dynamic> json) => _$PivotImpl(
      paymentTransactionId: (json['payment_transaction_id'] as num?)?.toInt(),
      dueId: (json['due_id'] as num?)?.toInt(),
      amountPaid: json['amount_paid'] as String?,
      isPartial: (json['is_partial'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$PivotImplToJson(_$PivotImpl instance) =>
    <String, dynamic>{
      'payment_transaction_id': instance.paymentTransactionId,
      'due_id': instance.dueId,
      'amount_paid': instance.amountPaid,
      'is_partial': instance.isPartial,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
