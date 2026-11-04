// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_count/notification_count_response_model.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotificationCount = AsyncNotifierProvider.autoDispose<
  ReminderNotifier,
  NotificationCountResponse?
>(() {
  return ReminderNotifier();
});

class ReminderNotifier
    extends AutoDisposeAsyncNotifier<NotificationCountResponse?> {
  @override
  Future<NotificationCountResponse?> build() async {
    // First try to load from local storage
    final localcount = await SharedPrefsService.getNotificationCount();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshcount = await ref
          .read(getApiServiceProvider)
          .getNotificationCount(bearerToken: token);

      // Only update local storage if data is different
      if (localcount?.toJson() != freshcount.toJson()) {
        await SharedPrefsService.saveNotificationCount(freshcount);
      }

      return freshcount;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localcount != null) {
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
        return localcount;
      }
      rethrow;
    }
  }

  Future<void> refreshCount(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);

        final freshReminder = await ref
            .read(getApiServiceProvider)
            .getNotificationCount(bearerToken: token ?? "");
        await SharedPrefsService.saveNotificationCount(freshReminder);
        return freshReminder;
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

        final localcount = await SharedPrefsService.getNotificationCount();
        if (localcount != null) return localcount;
        rethrow;
      }
    });
  }
}
