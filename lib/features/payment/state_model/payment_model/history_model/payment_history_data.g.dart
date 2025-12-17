// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentHistoryDataImpl _$$PaymentHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentHistoryDataImpl(
      transactions: json['transactions'] == null
          ? null
          : TransactionsPaginator.fromJson(
              json['transactions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentHistoryDataImplToJson(
        _$PaymentHistoryDataImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions?.toJson(),
    };
