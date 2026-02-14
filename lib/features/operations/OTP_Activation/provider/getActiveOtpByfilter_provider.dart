// Provider for your API class
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActiveOtpProvider =
    AsyncNotifierProvider<ActiveOtpNotifier, OtpResponseModel?>(() {
      return ActiveOtpNotifier();
    });

class ActiveOtpNotifier extends AsyncNotifier<OtpResponseModel?> {
  @override
  Future<OtpResponseModel?> build() async {
    // Load from local storage first
    final localOtp = await SharedPrefsService.getActiveOtp();

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final statusFilter = ref.watch(generateNotifierProvider).filter;

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshOtp = await ref
          .read(getApiServiceProvider)
          .getVisitorByFilters(bearerToken: token, status: statusFilter ?? "");

      // Save only if changed
      if (localOtp?.toJson() != freshOtp.toJson()) {
        await SharedPrefsService.saveActiveOtp(freshOtp);
      }

      return freshOtp;
    } catch (e) {
      // Return local cache if API fails
      if (localOtp != null) return localOtp;
      rethrow;
    }
  }

  Future<void> refreshActive(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final statusFilter = ref.watch(generateNotifierProvider).filter;
        final freshOtp = await ref
            .read(getApiServiceProvider)
            .getVisitorByFilters(
              bearerToken: token!,
              status: statusFilter ?? "",
            );
        await SharedPrefsService.saveActiveOtp(freshOtp);
        return freshOtp;
      } catch (e) {
        // Handle errors but fallback to local cache
        final localOtp = await SharedPrefsService.getActiveOtp();
        if (localOtp != null) return localOtp;
        rethrow;
      }
    });
  }
}
