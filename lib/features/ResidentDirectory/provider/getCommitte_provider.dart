// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committees_response_model.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCommitteeProvider =
    AsyncNotifierProvider.autoDispose<GetCommitteNotifier, CommitteesResponse?>(
      () {
        return GetCommitteNotifier();
      },
    );

class GetCommitteNotifier
    extends AutoDisposeAsyncNotifier<CommitteesResponse?> {
  @override
  Future<CommitteesResponse?> build() async {
    // First try to load from local storage
    final localcommitte = await SharedPrefsService.getCommittee();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      // final filter = ref.read(reportProvider).report.reportfilter;
      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshcommitte = await ref
          .read(getApiServiceProvider)
          .getCommittees(bearerToken: token);

      // Only update local storage if data is different
      if (localcommitte?.toJson() != freshcommitte.toJson()) {
        await SharedPrefsService.saveCommittee(freshcommitte);
      }

      return freshcommitte;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (localcommitte != null) {
        log("${e}");
      } else {}
      rethrow;
    }
  }

  Future<void> refreshCommitte(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);

        final freshcommitte = await ref
            .read(getApiServiceProvider)
            .getCommittees(bearerToken: token!);
        await SharedPrefsService.saveCommittee(freshcommitte);

        return freshcommitte;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else if (e.toString().contains("connection")) {
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localCommittee = await SharedPrefsService.getCommittee();

        if (localCommittee != null) return localCommittee;
        rethrow;
      }
    });
  }
}
