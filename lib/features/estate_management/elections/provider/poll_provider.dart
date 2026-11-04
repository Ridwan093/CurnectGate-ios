// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/polls_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pollProvider =
    AsyncNotifierProvider.autoDispose<PollNotifier, PollsResponse?>(() {
      return PollNotifier();
    });

class PollNotifier extends AutoDisposeAsyncNotifier<PollsResponse?> {
  @override
  Future<PollsResponse?> build() async {
    // First try to load from local storage
    final locaPoll = await SharedPrefsService.getPoll();

    try {
      // Then try to fetch fresh data

      final freshPoll = await ref.read(getApiServiceProvider).getPoll();

      // Only update local storage if data is different
      if (locaPoll?.toJson() != freshPoll.toJson()) {
        await SharedPrefsService.savePoll(freshPoll);
      }

      return freshPoll;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (locaPoll != null) {
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
        return locaPoll;
      }
      rethrow;
    }
  }

  Future<void> refreshPoll(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshPoll = await ref.read(getApiServiceProvider).getPoll();
        await SharedPrefsService.savePoll(freshPoll);
        return freshPoll;
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

        final locaPoll = await SharedPrefsService.getPoll();
        if (locaPoll != null) return locaPoll;
        rethrow;
      }
    });
  }
}
