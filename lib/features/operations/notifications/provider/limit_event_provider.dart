



// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_events_response_model.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getEventLimitProvider =
    AsyncNotifierProvider.autoDispose<EventNotifier, CalendarEventsResponse?>(
      () {
        return EventNotifier();
      },
    );

class EventNotifier extends AutoDisposeAsyncNotifier<CalendarEventsResponse?> {
  @override
  Future<CalendarEventsResponse?> build() async {
    // First try to load from local storage
    final localEvent = await SharedPrefsService.getEvent();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      // final category = ref.watch(reminderProvider).category.toLowerCase();

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshEvent = await ref
          .read(getApiServiceProvider)
          .getEvent(bearerToken: token, limit: "20", statuse: "active");

      // Only update local storage if data is different
      if (localEvent?.toJson() != freshEvent.toJson()) {
        await SharedPrefsService.saveEvent(freshEvent);
      }

      return freshEvent;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localEvent != null) {
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
        return localEvent;
      }
      rethrow;
    }
  }

  Future<void> refreshEvent(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        // final category = ref.watch(reminderProvider).filter.toLowerCase();
        final freshEvent = await ref
            .read(getApiServiceProvider)
            .getEvent(bearerToken: token ?? "", limit: "20",statuse: "active");
        await SharedPrefsService.saveEvent(freshEvent);
        return freshEvent;
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

        final localEvent = await SharedPrefsService.getEvent();
        if (localEvent != null) return localEvent;
        rethrow;
      }
    });
  }
}
