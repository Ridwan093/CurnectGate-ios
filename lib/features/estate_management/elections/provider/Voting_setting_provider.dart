// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/election_Setting/voting_settings_response.dart';
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
      log("${e}");
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
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshVotingSetting = await ref
            .read(getApiServiceProvider)
            .getVotingSettings(bearerToken: token!);
        await SharedPrefsService.saveVotingSettings(freshVotingSetting);
        return freshVotingSetting;
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

        final locaVotingSettings = await SharedPrefsService.getVotingSettings();
        if (locaVotingSettings != null) return locaVotingSettings;
        rethrow;
      }
    });
  }
}
