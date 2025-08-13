// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActiveOtpProvider =
    AsyncNotifierProvider.autoDispose<ActiveOtpnotifier, OtpResponseModel?>(() {
      return ActiveOtpnotifier();
    });

class ActiveOtpnotifier extends AutoDisposeAsyncNotifier<OtpResponseModel?> {
  @override
  Future<OtpResponseModel?> build() async {
    // First try to load from local storage
    final localVendor = await SharedPrefsService.getActiveOtp();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      final statue = ref.watch(generateNotifierProvider).filter;

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshVendor = await ref
          .read(getApiServiceProvider)
          .getVisitorByFilters(bearerToken: token, status: statue ?? "");

      // Only update local storage if data is different
      if (localVendor?.toJson() != freshVendor.toJson()) {
        await SharedPrefsService.saveActiveOtp(freshVendor);
      }

      return freshVendor;
    } catch (e) {
      // If error occurs, return local data if available

      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localVendor != null) {
        log("$e local Error ");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localVendor;
      }
      rethrow;
    }
  }

  Future<void> refreshActive(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final statue = ref.watch(generateNotifierProvider).filter;
        final freshVendor = await ref
            .read(getApiServiceProvider)
            .getVisitorByFilters(bearerToken: token!, status: statue ?? "");
        await SharedPrefsService.saveActiveOtp(freshVendor);
        return freshVendor;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          log(e.toString());
          ref.read(authProvider.notifier).seassionExpire(context, ref);
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

        final localVendor = await SharedPrefsService.getActiveOtp();
        if (localVendor != null) return localVendor;
        rethrow;
      }
    });
  }
}
