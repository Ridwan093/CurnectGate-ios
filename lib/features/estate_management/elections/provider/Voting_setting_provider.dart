// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/election_Setting/voting_settings_response.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final votingSettingsProvider = AsyncNotifierProvider.autoDispose<
  VotingSettingsNotifier,
  VotingSettingsResponse?
>(() {
  return VotingSettingsNotifier();
});

class VotingSettingsNotifier
    extends AutoDisposeAsyncNotifier<VotingSettingsResponse?> {
  @override
  Future<VotingSettingsResponse?> build() async {
    // First try to load from local storage
    final locaVotingSetting = await SharedPrefsService.getVotingSettings();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshVotingSetting = await ref
          .read(getApiServiceProvider)
          .getVotingSettings(bearerToken: token);

      // Only update local storage if data is different
      if (locaVotingSetting?.toJson() != freshVotingSetting.toJson()) {
        await SharedPrefsService.saveVotingSettings(freshVotingSetting);
      }

      return freshVotingSetting;
    } catch (e) {
      // If error occurs, return local data if available
      log("Setting: Error Here${e}");

      if (e.toString().toLowerCase().contains("access denied")) {
        ref.read(electionProvider.notifier).setError(e.toString());
      }
      if (locaVotingSetting != null) {
        log("${e}");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return locaVotingSetting;
      }
      rethrow;
    }
  }

  Future<void> refreshVotingSetting(BuildContext context, WidgetRef ref) async {
    // Preserve any existing data by explicitly keeping the state, but we can set loading.
    // Riverpod does this nicely.
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final token = await ref.watch(accessTokenProvider.future);
      final freshVotingSetting = await ref
          .read(getApiServiceProvider)
          .getVotingSettings(bearerToken: token!);
      await SharedPrefsService.saveVotingSettings(freshVotingSetting);
      return freshVotingSetting;
    });

    if (state.hasError) {
      final e = state.error!;
      final st = state.stackTrace;
      bool isAccessDenied = false;
      bool isConnectionError = false;

      if (e is DioException) {
        if (e.response?.statusCode == 403) {
          isAccessDenied = true;
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionError) {
          isConnectionError = true;
        }
      }

      final errorStr = e.toString().toLowerCase();
      if (errorStr.contains("access denied")) isAccessDenied = true;
      if (errorStr.contains("connection")) isConnectionError = true;

      // log(e.toString());
      if (isAccessDenied) {
        log("Access Denied@@: ${e.toString()}");
        // Explicitly set the error here as a failsafe
        try {
          ref.read(electionProvider.notifier).setError(e.toString());
        } catch (_) {}

        showCustomSuccessToast(
          context: context,
          message: "You don't have permission to perform this action.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey300,
          positionNumber: 72,
        );
      } else if (isConnectionError) {
        log("Connection Error: ${e.toString()}");
        showCustomSuccessToast(
          context: context,
          message: 'Connection failed. Please check your network',
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey300,
          positionNumber: 72,
        );
      }

      // Restore previously cached data if available, while keeping the error in state
      final locaVotingSettings = await SharedPrefsService.getVotingSettings();
      if (locaVotingSettings != null) {
        state = AsyncValue<VotingSettingsResponse?>.error(
          e,
          st ?? StackTrace.current,
        ).copyWithPrevious(AsyncValue.data(locaVotingSettings));
      }
    }
  }
}
