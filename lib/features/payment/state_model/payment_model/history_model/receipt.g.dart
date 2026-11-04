// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptImpl _$$ReceiptImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      amount: json['amount'] as String?,
      paymentTransactionId: (json['payment_transaction_id'] as num?)?.toInt(),
      receiptNumber: json['receipt_number'] as String?,
      totalAmount: json['total_amount'] as String?,
      itemsPaid: (json['items_paid'] as List<dynamic>?)
          ?.map((e) => ReceiptItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['payment_method'] as String?,
      balanceAfterPayment: json['balance_after_payment'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      pdfPath: json['pdf_path'] as String?,
      pdfPublicId: json['pdf_public_id'] as String?,
      emailSent: json['email_sent'] as bool?,
      issuedAt: json['issued_at'] as String?,
      emailSentAt: json['email_sent_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ReceiptImplToJson(_$ReceiptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'payment_transaction_id': instance.paymentTransactionId,
      'receipt_number': instance.receiptNumber,
      'total_amount': instance.totalAmount,
      'items_paid': instance.itemsPaid?.map((e) => e.toJson()).toList(),
      'payment_method': instance.paymentMethod,
      'balance_after_payment': instance.balanceAfterPayment,
      'pdf_url': instance.pdfUrl,
      'pdf_path': instance.pdfPath,
      'pdf_public_id': instance.pdfPublicId,
      'email_sent': instance.emailSent,
      'issued_at': instance.issuedAt,
      'email_sent_at': instance.emailSentAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
