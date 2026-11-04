// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_History/poll_history_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pollHistoryProvider = AsyncNotifierProvider.autoDispose<
  PollHistoryNotifier,
  PollHistoryResponse?
>(() {
  return PollHistoryNotifier();
});

class PollHistoryNotifier
    extends AutoDisposeAsyncNotifier<PollHistoryResponse?> {
  @override
  Future<PollHistoryResponse?> build() async {
    // First try to load from local storage
    final locaPollHistory = await SharedPrefsService.getPollHistory();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshPollHistory = await ref
          .read(getApiServiceProvider)
          .getPollHistory(bearerToken: token, id: "");

      // Only update local storage if data is different
      if (locaPollHistory?.toJson() != freshPollHistory.toJson()) {
        await SharedPrefsService.savePollHistory(freshPollHistory);
      }

      return freshPollHistory;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (locaPollHistory != null) {
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
        return locaPollHistory;
      }
      rethrow;
    }
  }

  Future<void> refreshHistory(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshPollHistory = await ref
            .read(getApiServiceProvider)
            .getPollHistory(bearerToken: token!, id: "");
        await SharedPrefsService.savePollHistory(freshPollHistory);
        return freshPollHistory;
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

        final locaPollHistory = await SharedPrefsService.getPollHistory();
        if (locaPollHistory != null) return locaPollHistory;
        rethrow;
      }
    });
  }
}
