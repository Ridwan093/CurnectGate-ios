// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/userNotification_setting_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotificationSettinProvider = AsyncNotifierProvider.autoDispose<
  UserNotificationNotifer,
  GetUserNotificationSettings?
>(() {
  return UserNotificationNotifer();
});

class UserNotificationNotifer
    extends AutoDisposeAsyncNotifier<GetUserNotificationSettings?> {
  @override
  Future<GetUserNotificationSettings?> build() async {
    // First try to load from local storage
    final localProfile = await SharedPrefsService.getNotificationSettings();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshProfile = await ref
          .read(getApiServiceProvider)
          .getUserNotificationSettings(bearerToken: token);

      // Only update local storage if data is different
      if (localProfile?.toJson() != freshProfile.toJson()) {
        await SharedPrefsService.saveNotificationSettings(freshProfile);
      }

      return freshProfile;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localProfile != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        ref.read(formProvider.notifier).updateNotificationSettingError(false);
        return localProfile;
      } else {
        ref.read(formProvider.notifier).updateNotificationSettingError(true);
      }
      rethrow;
    }
  }

  Future<void> refreshSettings(BuildContext context, WidgetRef ref) async {
    ref.read(formProvider.notifier).updateNotificationSettingError(false);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getUserNotificationSettings(bearerToken: token!);
        await SharedPrefsService.saveNotificationSettings(freshProfile);

        return freshProfile;
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

        final localProfile = await SharedPrefsService.getNotificationSettings();
        if (localProfile != null) {
          ref.read(formProvider.notifier).updateNotificationSettingError(false);
        } else {
          ref.read(formProvider.notifier).updateNotificationSettingError(true);
        }
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
