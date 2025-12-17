// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_due.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingDueImpl _$$OutstandingDueImplFromJson(Map<String, dynamic> json) =>
    _$OutstandingDueImpl(
      id: (json['id'] as num?)?.toInt(),
      reference: json['reference'] as String?,
      category: json['category'] as String?,
      amount: json['amount'] as String?,
      paid: json['paid'] as String?,
      balance: json['balance'] as String?,
      dueDate: json['due_date'] as String?,
      isOverdue: json['is_overdue'] as bool?,
      daysOverdue: (json['days_overdue'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$OutstandingDueImplToJson(
        _$OutstandingDueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'category': instance.category,
      'amount': instance.amount,
      'paid': instance.paid,
      'balance': instance.balance,
      'due_date': instance.dueDate,
      'is_overdue': instance.isOverdue,
      'days_overdue': instance.daysOverdue,
      'status': instance.status,
    };
