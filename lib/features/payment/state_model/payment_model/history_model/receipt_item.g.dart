// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptItemImpl _$$ReceiptItemImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptItemImpl(
      amount: json['amount'] as String?,
      dueId: (json['due_id'] as num?)?.toInt(),
      category: json['category'] as String?,
      dueDate: json['due_date'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$$ReceiptItemImplToJson(_$ReceiptItemImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'due_id': instance.dueId,
      'category': instance.category,
      'due_date': instance.dueDate,
      'reference': instance.reference,
    };
