// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletHistoryDataImpl _$$WalletHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletHistoryDataImpl(
      transactions: json['transactions'] == null
          ? null
          : WalletTransactionsPaginator.fromJson(
              json['transactions'] as Map<String, dynamic>),
      groupedByMonth: (json['grouped_by_month'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    WalletTransactionItem.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      summary: json['summary'] == null
          ? null
          : WalletSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletHistoryDataImplToJson(
        _$WalletHistoryDataImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions?.toJson(),
      'grouped_by_month': instance.groupedByMonth
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'summary': instance.summary?.toJson(),
    };
