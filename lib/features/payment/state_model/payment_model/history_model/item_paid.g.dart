// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_paid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemPaidImpl _$$ItemPaidImplFromJson(Map<String, dynamic> json) =>
    _$ItemPaidImpl(
      amount: json['amount'] as String?,
      dueId: (json['due_id'] as num?)?.toInt(),
      category: json['category'] as String?,
      dueDate: json['due_date'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$$ItemPaidImplToJson(_$ItemPaidImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'due_id': instance.dueId,
      'category': instance.category,
      'due_date': instance.dueDate,
      'reference': instance.reference,
    };
