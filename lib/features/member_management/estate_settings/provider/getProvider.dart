// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/estate_settings/setting_model/estate_settings_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emergencyProvider = AsyncNotifierProvider.autoDispose<
  EstateSettingNotifier,
  EstateSettingsResponse?
>(() {
  return EstateSettingNotifier();
});

class EstateSettingNotifier
    extends AutoDisposeAsyncNotifier<EstateSettingsResponse?> {
  @override
  Future<EstateSettingsResponse?> build() async {
    // First try to load from local storage
    final localEstateSettings = await SharedPrefsService.getEstateSettings();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshEstateSettings = await ref
          .read(getApiServiceProvider)
          .getEstateSettings(bearerToken: token);

      // Only update local storage if data is different
      if (localEstateSettings?.toJson() != freshEstateSettings.toJson()) {
        await SharedPrefsService.saveEstateSettings(freshEstateSettings);
      }

      return freshEstateSettings;
    } catch (e) {
      // If error occurs, return local data if available
      // log("${e}");
      log(
        "My Data was here => ${localEstateSettings?.data?.estate?.name ?? ""}",
      );
      if (localEstateSettings != null) {
        log(
          "My Data was here => ${localEstateSettings.data?.estate?.name ?? ""}",
        );
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localEstateSettings;
      }
      rethrow;
    }
  }

  Future<void> refreshEstateSettings(
    BuildContext context,
    WidgetRef ref,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getEstateSettings(bearerToken: token ?? "");
        await SharedPrefsService.saveEstateSettings(freshProfile);
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

        final localProfile = await SharedPrefsService.getEstateSettings();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
