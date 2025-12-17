// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWorkpermitProvider = AsyncNotifierProvider.autoDispose<
  WorkPermitNotifier,
  ClearancePermitResponse?
>(() {
  return WorkPermitNotifier();
});

class WorkPermitNotifier
    extends AutoDisposeAsyncNotifier<ClearancePermitResponse?> {
  @override
  Future<ClearancePermitResponse?> build() async {
    // First try to load from local storage
    final localVendor = await SharedPrefsService.getClearancePermit();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshVendor = await ref
          .read(getApiServiceProvider)
          .getworkPermit(bearerToken: token, status: "");

      // Only update local storage if data is different
      if (localVendor?.toJson() != freshVendor.toJson()) {
        await SharedPrefsService.saveClearancePermit(freshVendor);
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

        final freshVendor = await ref
            .read(getApiServiceProvider)
            .getworkPermit(bearerToken: token!, status: "");
        await SharedPrefsService.saveClearancePermit(freshVendor);
        return freshVendor;
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

        final localVendor = await SharedPrefsService.getClearancePermit();
        if (localVendor != null) return localVendor;
        rethrow;
      }
    });
  }
}
