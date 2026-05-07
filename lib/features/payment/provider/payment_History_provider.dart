// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/payment_history_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentHistoryProvider = AsyncNotifierProvider.autoDispose<
  PaymentHistoryNotifier,
  PaymentHistoryResponse?
>(() {
  return PaymentHistoryNotifier();
});

class PaymentHistoryNotifier
    extends AutoDisposeAsyncNotifier<PaymentHistoryResponse?> {
  @override
  Future<PaymentHistoryResponse?> build() async {
    // First try to load from local storage
    final localPaymentHistory = await SharedPrefsService.getPaymentHistory();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshPaymentHistory = await ref
          .read(getApiServiceProvider)
          .getPaymentHistory(bearerToken: token);

      // Only update local storage if data is different
      if (localPaymentHistory?.toJson() != freshPaymentHistory.toJson()) {
        await SharedPrefsService.savePaymentHistory(freshPaymentHistory);
      }

      return freshPaymentHistory;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}payment History");
      if (localPaymentHistory != null) {
        log("${e} payment History");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localPaymentHistory;
      }
      rethrow;
    }
  }

  Future<void> refreshPaymentHistory(
    BuildContext context,
    WidgetRef ref,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getPaymentHistory(bearerToken: token ?? "");
        await SharedPrefsService.savePaymentHistory(freshProfile);
        return freshProfile;
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401) {
          log(e.toString());
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else if (e.toString().contains("The connection errored")) {
          log(e.toString());
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localProfile = await SharedPrefsService.getPaymentHistory();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
