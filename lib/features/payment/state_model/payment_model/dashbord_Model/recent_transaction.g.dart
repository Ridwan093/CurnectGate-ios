// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentTransactionImpl _$$RecentTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentTransactionImpl(
      id: (json['id'] as num?)?.toInt(),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      amount: json['amount'] as String?,
      referenceNo: json['reference_no'] as String?,
      estateId: (json['estate_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      description: json['description'] as String?,
      accepted: (json['accepted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$RecentTransactionImplToJson(
        _$RecentTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'reference_no': instance.referenceNo,
      'estate_id': instance.estateId,
      'type': instance.type,
      'description': instance.description,
      'accepted': instance.accepted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
