// Riverpod Providers
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);
final searchQueryProvider = StateProvider<String>((ref) => '');
final isSearchingProvider = StateProvider<bool>((ref) => false);
final selectedFilterProvider = StateProvider<String?>((ref) => null);

final isPopProvider = StateProvider<bool>((ref) => false);



final getUserNotification = AsyncNotifierProvider.autoDispose<
  GetUserNotification,
  NotificationResponse?
>(() {
  return GetUserNotification();
});

class GetUserNotification
    extends AutoDisposeAsyncNotifier<NotificationResponse?> {
  @override
  Future<NotificationResponse?> build() async {
    // First try to load from local storage
    final localNotification = await SharedPrefsService.getUserNotification();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshUserNotication = await ref
          .read(getApiServiceProvider)
          .getAllNotification(bearerToken: token);

      // Only update local storage if data is different
      if (localNotification?.toJson() != freshUserNotication.toJson()) {
        await SharedPrefsService.saveUserNotification(freshUserNotication);
      }

      return freshUserNotication;
    } catch (e) {
      // If error occurs, return local data if available
      log("$e");
      if (localNotification != null) {
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
        return localNotification;
      }
      rethrow;
    }
  }

  Future<void> refreshSettings(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final localNotification = await ref
            .read(getApiServiceProvider)
            .getAllNotification(bearerToken: token!);
        await SharedPrefsService.saveUserNotification(localNotification);
        return localNotification;
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

        final localNotification =
            await SharedPrefsService.getUserNotification();
        if (localNotification != null) return localNotification;
        rethrow;
      }
    });
  }
}
