import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/payment/provider/payment_History_provider.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/tab_content.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentHistory extends ConsumerWidget {
  final PageController controller;

  const PaymentHistory({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentHistoryProviderAsync = ref.watch(paymentHistoryProvider);
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(paymentHistoryProvider.notifier)
              .refreshPaymentHistory(context, ref),
      child: paymentHistoryProviderAsync.when(
        data: (due) {
          try {
            final user = due?.data;
            return user != null
                ? PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    // Sync state when user swipes
                    ref.read(tabProvider.notifier).state =
                        WalletTab.values[index];
                  },
                  children: [
                    AllTabContent(data: user.transactions?.data),
                    DueTabContent(data: user.transactions?.data),
                    DepositTabContent(data: user.transactions?.data),
                  ],
                )
                : EmptyBodys(message: "No history data?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentHistoryProvider.notifier)
                      .refreshPaymentHistory(context, ref),
              firstMessae: "Faile to load history data?",
            );
          }
        },
        loading: () {
          try {
            final cachedProfile = ref.read(paymentHistoryProvider).value;
            return cachedProfile != null
                ? PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    // Sync state when user swipes
                    ref.read(tabProvider.notifier).state =
                        WalletTab.values[index];
                  },
                  children: [
                    AllTabContent(data: cachedProfile.data?.transactions?.data),
                    DueTabContent(data: cachedProfile.data?.transactions?.data),
                    DepositTabContent(
                      data: cachedProfile.data?.transactions?.data,
                    ),
                  ],
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentHistoryProvider.notifier)
                      .refreshPaymentHistory(context, ref),
              firstMessae: "Faile to load history data?",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).sessionExpire(context, ref);
              });
              return Expiresessionbody();
            }

            // Try to show cached data
            final cachedProfile = ref.read(paymentHistoryProvider).value;
            if (cachedProfile?.data != null) {
              return PageView(
                controller: controller,
                onPageChanged: (index) {
                  // Sync state when user swipes
                  ref.read(tabProvider.notifier).state =
                      WalletTab.values[index];
                },
                children: [
                  AllTabContent(data: cachedProfile?.data?.transactions?.data),
                  DueTabContent(data: cachedProfile?.data?.transactions?.data),
                  DepositTabContent(
                    data: cachedProfile?.data?.transactions?.data,
                  ),
                ],
              );
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(paymentHistoryProvider.notifier)
                      .refreshPaymentHistory(context, ref),
              firstMessae: "Faile to load history?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentHistoryProvider.notifier)
                      .refreshPaymentHistory(context, ref),
              firstMessae: "Faile to load history data",
            );
          }
        },
      ),
    );
  }
}
