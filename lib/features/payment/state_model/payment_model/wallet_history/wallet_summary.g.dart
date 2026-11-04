// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletSummaryImpl _$$WalletSummaryImplFromJson(Map<String, dynamic> json) =>
    _$WalletSummaryImpl(
      totalCredits: json['total_credits'] as String?,
      totalDebits: json['total_debits'] as String?,
      currentBalance: json['current_balance'] as String?,
    );

Map<String, dynamic> _$$WalletSummaryImplToJson(_$WalletSummaryImpl instance) =>
    <String, dynamic>{
      'total_credits': instance.totalCredits,
      'total_debits': instance.totalDebits,
      'current_balance': instance.currentBalance,
    };
