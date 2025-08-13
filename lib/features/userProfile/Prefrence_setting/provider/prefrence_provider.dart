// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/get_user_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPrefrenceprovider = AsyncNotifierProvider.autoDispose<
  UserPrefrenceNotifer,
  GetuserNotifications?
>(() {
  return UserPrefrenceNotifer();
});

class UserPrefrenceNotifer
    extends AutoDisposeAsyncNotifier<GetuserNotifications?> {
  @override
  Future<GetuserNotifications?> build() async {
    // First try to load from local storage
    final localpreferencey =
        await SharedPrefsService.getUserPreferenceSettings();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshPreferency = await ref
          .read(getApiServiceProvider)
          .getPreferences(bearerToken: token);

      // Only update local storage if data is different
      if (localpreferencey?.toJson() != freshPreferency.toJson()) {
        await SharedPrefsService.savePrefrencSettings(freshPreferency);
      }

      return freshPreferency;
    } catch (e, stack) {
      // If error occurs, return local data if available
      log("$e");
      if (localpreferencey != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        ref.read(formProvider.notifier).updateprevenc(false);
        return localpreferencey;
      } else {
        ref.read(formProvider.notifier).updateprevenc(true);
      }
      rethrow;
    }
  }

  Future<void> refreshSettings(BuildContext context, WidgetRef ref) async {
    ref.read(formProvider.notifier).updateprevenc(false);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshPreferency = await ref
            .read(getApiServiceProvider)
            .getPreferences(bearerToken: token!);
        await SharedPrefsService.savePrefrencSettings(freshPreferency);
        return freshPreferency;
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

        final localpreferency =
            await SharedPrefsService.getUserPreferenceSettings();
        if (localpreferency != null) {
          ref.read(formProvider.notifier).updateprevenc(false);
        } else {
          ref.read(formProvider.notifier).updateprevenc(true);
        }
        if (localpreferency != null) return localpreferency;
        rethrow;
      }
    });
  }
}
