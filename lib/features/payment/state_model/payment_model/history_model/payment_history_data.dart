import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'transactions_paginator.dart';


part 'payment_history_data.freezed.dart';
part 'payment_history_data.g.dart';

@freezed
class PaymentHistoryData with _$PaymentHistoryData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentHistoryData({
    TransactionsPaginator? transactions,
  }) = _PaymentHistoryData;

  factory PaymentHistoryData.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryDataFromJson(json);

  factory PaymentHistoryData.safeFromJson(Map<String, dynamic>? json) {
    return PaymentHistoryData(
      transactions:
          TransactionsPaginator.safeFromJson(NullSafetyHelper.safeMap(json?['transactions'])),
    );
  }

  factory PaymentHistoryData.empty() => const PaymentHistoryData(transactions: null);
}
