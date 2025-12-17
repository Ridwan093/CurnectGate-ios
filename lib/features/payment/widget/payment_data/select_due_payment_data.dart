import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/payment/provider/due_payment_provider.dart';
import 'package:curnectgate/features/payment/screen/select_duetoPay.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectDuePaymentData extends ConsumerWidget {
  final String walletBalance;
  final String totalDue;
  const SelectDuePaymentData({
    super.key,
    required this.totalDue,
    required this.walletBalance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashbordProviderAsync = ref.watch(paymentDueProvider);
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(paymentDueProvider.notifier)
              .refreshDuePayment(context, ref),
      child: dashbordProviderAsync.when(
        data: (due) {
          try {
            final user = due?.data;
            return user != null
                ? DuePaymentSelection(
                  data: user,
                  totalDue: totalDue,
                  walletBalance: walletBalance,
                )
                : EmptyBodys(message: "No due data?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentDueProvider.notifier)
                      .refreshDuePayment(context, ref),
              firstMessae: "Faile to load due data?",
            );
          }
        },
        loading: () {
          try {
            final cachedProfile = ref.read(paymentDueProvider).value;
            return cachedProfile != null
                ? DuePaymentSelection(
                  data: cachedProfile.data,
                  totalDue: totalDue,
                  walletBalance: walletBalance,
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentDueProvider.notifier)
                      .refreshDuePayment(context, ref),
              firstMessae: "Faile to load due data?",
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
            final cachedProfile = ref.read(paymentDueProvider).value;
            if (cachedProfile?.data != null) {
              return DuePaymentSelection(
                data: cachedProfile!.data,
                totalDue: totalDue,
                walletBalance: walletBalance,
              );
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(paymentDueProvider.notifier)
                      .refreshDuePayment(context, ref),
              firstMessae: "Faile to load due data?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(paymentDueProvider.notifier)
                      .refreshDuePayment(context, ref),
              firstMessae: "Faile to load due data?",
            );
          }
        },
      ),
    );
  }
}
