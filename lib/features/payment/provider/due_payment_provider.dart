// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentDueProvider = AsyncNotifierProvider.autoDispose<
  PaymentDueNotifier,
  OutstandingDuesResponse?
>(() {
  return PaymentDueNotifier();
});

class PaymentDueNotifier
    extends AutoDisposeAsyncNotifier<OutstandingDuesResponse?> {
  @override
  Future<OutstandingDuesResponse?> build() async {
    // First try to load from local storage
    final localdue = await SharedPrefsService.getPaymentDue();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshDue = await ref
          .read(getApiServiceProvider)
          .getDuePayemnt(bearerToken: token);

      // Only update local storage if data is different
      if (localdue?.toJson() != freshDue.toJson()) {
        await SharedPrefsService.savePaymentDue(freshDue);
      }

      return freshDue;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localdue != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localdue;
      }
      rethrow;
    }
  }

  Future<void> refreshDuePayment(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getDuePayemnt(bearerToken: token ?? "");
        await SharedPrefsService.savePaymentDue(freshProfile);
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

        final localProfile = await SharedPrefsService.getPaymentDue();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
