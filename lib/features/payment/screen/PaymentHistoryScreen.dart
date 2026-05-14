import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/payment_History_provider.dart';
import 'package:curnectgate/features/payment/widget/trancaction_histroy_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentHistoryScreen extends ConsumerWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(paymentHistoryProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.instance.black600,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Transaction History',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 18,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.instance.yellow500,
        onRefresh:
            () => ref
                .read(paymentHistoryProvider.notifier)
                .refreshPaymentHistory(context),
        child: historyAsync.when(
          data: (history) {
            final transactions = history?.data?.transactions?.data ?? [];
            if (transactions.isEmpty) {
              return const EmptyBodys(message: "No transactions found yet.");
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(transaction: transactions[index]);
              },
            );
          },
          loading: () => const Loadingstates(),
          error: (error, stack) {
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(paymentHistoryProvider.notifier)
                      .refreshPaymentHistory(context),
              firstMessae: "Failed to load transaction history",
            );
          },
        ),
      ),
    );
  }
}
