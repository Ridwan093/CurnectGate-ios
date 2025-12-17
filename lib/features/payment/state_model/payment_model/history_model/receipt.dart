import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'receipt_item.dart';


part 'receipt.freezed.dart';
part 'receipt.g.dart';

@freezed
class Receipt with _$Receipt {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Receipt({
    int? id,
    int? estateId,
    int? userId,
    String? amount,
    int? paymentTransactionId,
    String? receiptNumber,
    String? totalAmount,
    List<ReceiptItem>? itemsPaid,
    String? paymentMethod,
    String? balanceAfterPayment,
    String? pdfUrl,
    String? pdfPath,
    String? pdfPublicId,
    bool? emailSent,
    String? issuedAt,
    String? emailSentAt,
    String? createdAt,
    String? updatedAt,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  factory Receipt.safeFromJson(Map<String, dynamic>? json) {
    return Receipt(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      amount: NullSafetyHelper.safeString(json?['amount']),
      paymentTransactionId: NullSafetyHelper.safeInt(json?['payment_transaction_id']),
      receiptNumber: NullSafetyHelper.safeString(json?['receipt_number']),
      totalAmount: NullSafetyHelper.safeString(json?['total_amount']),
      itemsPaid: (NullSafetyHelper.safeList(json?['items_paid']) ?? [])
          .map((e) => ReceiptItem.safeFromJson(NullSafetyHelper.safeMap(e)))
          .toList(),
      paymentMethod: NullSafetyHelper.safeString(json?['payment_method']),
      balanceAfterPayment: NullSafetyHelper.safeString(json?['balance_after_payment']),
      pdfUrl: NullSafetyHelper.safeString(json?['pdf_url']),
      pdfPath: NullSafetyHelper.safeString(json?['pdf_path']),
      pdfPublicId: NullSafetyHelper.safeString(json?['pdf_public_id']),
      emailSent: NullSafetyHelper.safeBool(json?['email_sent']),
      issuedAt: NullSafetyHelper.safeString(json?['issued_at']),
      emailSentAt: NullSafetyHelper.safeString(json?['email_sent_at']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory Receipt.empty() => const Receipt(
        id: 0,
        estateId: 0,
        userId: 0,
        amount: '0.00',
        paymentTransactionId: 0,
        receiptNumber: '',
        totalAmount: '0.00',
        itemsPaid: [],
        paymentMethod: '',
        balanceAfterPayment: null,
        pdfUrl: '',
        pdfPath: '',
        pdfPublicId: null,
        emailSent: false,
        issuedAt: '',
        emailSentAt: null,
        createdAt: '',
        updatedAt: '',
      );
}
