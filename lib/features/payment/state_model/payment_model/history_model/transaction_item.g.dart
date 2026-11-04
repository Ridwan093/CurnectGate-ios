// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionItemImpl _$$TransactionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionItemImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      transactionReference: json['transaction_reference'] as String?,
      paymentReference: json['payment_reference'] as String?,
      amount: json['amount'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentGateway: json['payment_gateway'] as String?,
      transactionType: json['transaction_type'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      paidAt: json['paid_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      dues: (json['dues'] as List<dynamic>?)
          ?.map((e) => DueItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      receipt: json['receipt'] == null
          ? null
          : Receipt.fromJson(json['receipt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionItemImplToJson(
        _$TransactionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'user_id': instance.userId,
      'wallet_id': instance.walletId,
      'transaction_reference': instance.transactionReference,
      'payment_reference': instance.paymentReference,
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'payment_gateway': instance.paymentGateway,
      'transaction_type': instance.transactionType,
      'status': instance.status,
      'description': instance.description,
      'metadata': instance.metadata?.toJson(),
      'paid_at': instance.paidAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'dues': instance.dues?.map((e) => e.toJson()).toList(),
      'receipt': instance.receipt?.toJson(),
    };
