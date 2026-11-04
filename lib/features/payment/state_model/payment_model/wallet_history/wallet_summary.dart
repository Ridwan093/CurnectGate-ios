import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_summary.freezed.dart';
part 'wallet_summary.g.dart';

@freezed
class WalletSummary with _$WalletSummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WalletSummary({
    String? totalCredits,
    String? totalDebits,
    String? currentBalance,
  }) = _WalletSummary;

  factory WalletSummary.fromJson(Map<String, dynamic> json) =>
      _$WalletSummaryFromJson(json);

  factory WalletSummary.safeFromJson(Map<String, dynamic>? json) {
    return WalletSummary(
      totalCredits: NullSafetyHelper.safeString(json?['total_credits']),
      totalDebits: NullSafetyHelper.safeString(json?['total_debits']),
      currentBalance: NullSafetyHelper.safeString(json?['current_balance']),
    );
  }

  factory WalletSummary.empty() => const WalletSummary(
        totalCredits: '0.00',
        totalDebits: '0.00',
        currentBalance: '0.00',
      );
}
