// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/poll_details_response.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pollDetailsProvider =
    AsyncNotifierProvider.autoDispose<PollDeteilsNotifer, PollDetailsResponse?>(
      () {
        return PollDeteilsNotifer();
      },
    );

class PollDeteilsNotifer
    extends AutoDisposeAsyncNotifier<PollDetailsResponse?> {
  @override
  Future<PollDetailsResponse?> build() async {
    // First try to load from local storage
    final locaPollDeteils = await SharedPrefsService.getPollDeteils();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      final id = ref.watch(electionProvider).id.toString();
      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }
      if (id.isEmpty) {
        throw Exception("Error Unauthenticated");
      }
      final freshPollDeteils = await ref
          .read(getApiServiceProvider)
          .getPollDeteils(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (locaPollDeteils?.toJson() != freshPollDeteils.toJson()) {
        await SharedPrefsService.savePollDeteils(freshPollDeteils);
      }

      return freshPollDeteils;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (locaPollDeteils != null) {
        log(locaPollDeteils.data!.poll!.description.toString());
        return locaPollDeteils;
      }
      rethrow;
    }
  }

  Future<void> refreshPollDeteils(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final id = ref.watch(electionProvider).id.toString();
        final freshPollDeteils = await ref
            .read(getApiServiceProvider)
            .getPollDeteils(bearerToken: token!, id: id);
        await SharedPrefsService.savePollDeteils(freshPollDeteils);
        return freshPollDeteils;
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

        final locaPollDeteils = await SharedPrefsService.getPollDeteils();
        if (locaPollDeteils != null) return locaPollDeteils;
        rethrow;
      }
    });
  }
}
