import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/household_members/reminder_household_members_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reminderHouseholdProvider = AsyncNotifierProvider.autoDispose<
  ReminderHouseholdNotifier,
  ReminderHouseholdMembersResponse?
>(() {
  return ReminderHouseholdNotifier();
});

class ReminderHouseholdNotifier
    extends AutoDisposeAsyncNotifier<ReminderHouseholdMembersResponse?> {
  @override
  Future<ReminderHouseholdMembersResponse?> build() async {
    // First try to load from local storage
    final localHousehold = await SharedPrefsService.getReminderHousehold();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshHousehold = await ref
          .read(getApiServiceProvider)
          .getReminderHouseholdMembers(bearerToken: token);

      // Only update local storage if data is different
      if (localHousehold?.toJson() != freshHousehold.toJson()) {
        await SharedPrefsService.saveReminderHousehold(freshHousehold);
      }

      return freshHousehold;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}_ReminderHouseholdError");
      if (localHousehold != null) {
        log("${e}_ReminderHouseholdError using cache");
        return localHousehold;
      }
      rethrow;
    }
  }

  Future<void> refreshHousehold(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshHousehold = await ref
            .read(getApiServiceProvider)
            .getReminderHouseholdMembers(bearerToken: token!);
        await SharedPrefsService.saveReminderHousehold(freshHousehold);
        return freshHousehold;
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

        final localHousehold = await SharedPrefsService.getReminderHousehold();
        if (localHousehold != null) return localHousehold;
        rethrow;
      }
    });
  }
}
