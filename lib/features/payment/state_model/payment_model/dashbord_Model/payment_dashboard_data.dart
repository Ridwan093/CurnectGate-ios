import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'outstanding_due.dart';
import 'wallet.dart';
import 'recent_transaction.dart';


part 'payment_dashboard_data.freezed.dart';
part 'payment_dashboard_data.g.dart';

@freezed
class PaymentDashboardData with _$PaymentDashboardData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaymentDashboardData({
    String? walletBalance,
    int? totalOutstanding,
    int? totalOverdue,
    int? outstandingDuesCount,
    int? overdueDuesCount,
    bool? hasSufficientBalance,
    List<OutstandingDue>? outstandingDues,
    Wallet? wallet,
    List<dynamic>? virtualAccounts,
    List<RecentTransaction>? recentTransactions,
  }) = _PaymentDashboardData;

  factory PaymentDashboardData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDashboardDataFromJson(json);

  factory PaymentDashboardData.safeFromJson(Map<String, dynamic>? json) {
    return PaymentDashboardData(
      walletBalance: NullSafetyHelper.safeString(json?['wallet_balance']),
      totalOutstanding: NullSafetyHelper.safeInt(json?['total_outstanding']),
      totalOverdue: NullSafetyHelper.safeInt(json?['total_overdue']),
      outstandingDuesCount: NullSafetyHelper.safeInt(json?['outstanding_dues_count']),
      overdueDuesCount: NullSafetyHelper.safeInt(json?['overdue_dues_count']),
      hasSufficientBalance: NullSafetyHelper.safeBool(json?['has_sufficient_balance']),
      outstandingDues: (NullSafetyHelper.safeList(json?['outstanding_dues']))
          .map((e) => OutstandingDue.safeFromJson(e))
          .toList(),
      wallet: Wallet.safeFromJson(NullSafetyHelper.safeMap(json?['wallet'])),
      virtualAccounts: NullSafetyHelper.safeList(json?['virtual_accounts']) ,
      recentTransactions: (NullSafetyHelper.safeList(json?['recent_transactions']) ?? [])
          .map((e) => RecentTransaction.safeFromJson(e))
          .toList(),
    );
  }

  factory PaymentDashboardData.empty() => const PaymentDashboardData(
        walletBalance: '0.00',
        totalOutstanding: 0,
        totalOverdue: 0,
        outstandingDuesCount: 0,
        overdueDuesCount: 0,
        hasSufficientBalance: false,
        outstandingDues: [],
        wallet: null,
        virtualAccounts: [],
        recentTransactions: [],
      );
}
