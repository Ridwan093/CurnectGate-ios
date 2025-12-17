// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDashboardDataImpl _$$PaymentDashboardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentDashboardDataImpl(
      walletBalance: json['wallet_balance'] as String?,
      totalOutstanding: (json['total_outstanding'] as num?)?.toInt(),
      totalOverdue: (json['total_overdue'] as num?)?.toInt(),
      outstandingDuesCount: (json['outstanding_dues_count'] as num?)?.toInt(),
      overdueDuesCount: (json['overdue_dues_count'] as num?)?.toInt(),
      hasSufficientBalance: json['has_sufficient_balance'] as bool?,
      outstandingDues: (json['outstanding_dues'] as List<dynamic>?)
          ?.map((e) => OutstandingDue.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      virtualAccounts: json['virtual_accounts'] as List<dynamic>?,
      recentTransactions: (json['recent_transactions'] as List<dynamic>?)
          ?.map((e) => RecentTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentDashboardDataImplToJson(
        _$PaymentDashboardDataImpl instance) =>
    <String, dynamic>{
      'wallet_balance': instance.walletBalance,
      'total_outstanding': instance.totalOutstanding,
      'total_overdue': instance.totalOverdue,
      'outstanding_dues_count': instance.outstandingDuesCount,
      'overdue_dues_count': instance.overdueDuesCount,
      'has_sufficient_balance': instance.hasSufficientBalance,
      'outstanding_dues':
          instance.outstandingDues?.map((e) => e.toJson()).toList(),
      'wallet': instance.wallet?.toJson(),
      'virtual_accounts': instance.virtualAccounts,
      'recent_transactions':
          instance.recentTransactions?.map((e) => e.toJson()).toList(),
    };
