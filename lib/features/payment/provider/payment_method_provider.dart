// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_methods_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getpaymentMethodProvider = AsyncNotifierProvider.autoDispose<
  PaymentMethodNotifier,
  PaymentMethodsResponse?
>(() {
  return PaymentMethodNotifier();
});

class PaymentMethodNotifier
    extends AutoDisposeAsyncNotifier<PaymentMethodsResponse?> {
  @override
  Future<PaymentMethodsResponse?> build() async {
    // First try to load from local storage
    final localpaymentMethod = await SharedPrefsService.getPayMethod();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final fresPaymentMethod = await ref
          .read(getApiServiceProvider)
          .getPayMethod(bearerToken: token);

      // Only update local storage if data is different
      if (localpaymentMethod?.toJson() != fresPaymentMethod.toJson()) {
        await SharedPrefsService.savePayMethod(fresPaymentMethod);
      }

      return fresPaymentMethod;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localpaymentMethod != null) {
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
        return localpaymentMethod;
      }
      rethrow;
    }
  }

  Future<void> refreshPaymentmethod(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getPayMethod(bearerToken: token ?? "");
        await SharedPrefsService.savePayMethod(freshProfile);
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

        final localProfile = await SharedPrefsService.getPayMethod();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
