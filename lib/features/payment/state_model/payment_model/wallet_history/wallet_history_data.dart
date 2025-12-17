import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_transactions_paginator.dart';
import 'wallet_transaction_item.dart';
import 'wallet_summary.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'wallet_history_data.freezed.dart';
part 'wallet_history_data.g.dart';

@freezed
class WalletHistoryData with _$WalletHistoryData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WalletHistoryData({
    WalletTransactionsPaginator? transactions,
    @JsonKey(name: 'grouped_by_month') Map<String, List<WalletTransactionItem>>? groupedByMonth,
    WalletSummary? summary,
  }) = _WalletHistoryData;

  factory WalletHistoryData.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryDataFromJson(json);

  factory WalletHistoryData.safeFromJson(Map<String, dynamic>? json) {
    // parse grouped_by_month safely
    final grouped = json?['grouped_by_month'];
    Map<String, List<WalletTransactionItem>>? groupedMap;
    if (grouped is Map<String, dynamic>) {
      groupedMap = grouped.map((k, v) {
        final list = (v is List)
            ? v.map((e) => WalletTransactionItem.safeFromJson(NullSafetyHelper.safeMap(e))).toList()
            : <WalletTransactionItem>[];
        return MapEntry(k, list);
      });
    } else {
      groupedMap = {};
    }

    return WalletHistoryData(
      transactions:
          WalletTransactionsPaginator.safeFromJson(NullSafetyHelper.safeMap(json?['transactions'])),
      groupedByMonth: groupedMap,
      summary: WalletSummary.safeFromJson(NullSafetyHelper.safeMap(json?['summary'])),
    );
  }

  factory WalletHistoryData.empty() => const WalletHistoryData(
        transactions: null,
        groupedByMonth: {},
        summary: null,
      );
}
