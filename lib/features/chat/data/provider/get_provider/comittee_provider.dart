// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableCommitte/committee_members_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCommitteeProvider = AsyncNotifierProvider.autoDispose<
  CommtteeListNotifier,
  CommitteeMembersResponse?
>(() {
  return CommtteeListNotifier();
});

class CommtteeListNotifier
    extends AutoDisposeAsyncNotifier<CommitteeMembersResponse?> {
  @override
  Future<CommitteeMembersResponse?> build() async {
    // First try to load from local storage
    final localCommitte = await SharedPrefsService.getComitteeList();

    try {
      final freshAdmin = await ref.read(getApiServiceProvider).getComitteList();

      // Only update local storage if data is different
      if (localCommitte?.toJson() != freshAdmin.toJson()) {
        await SharedPrefsService.saveComitteeList(freshAdmin);
      }

      return freshAdmin;
    } catch (e) {
      // If error occurs, return local data if available

      if (localCommitte != null) {
        log("${e} HERE IS Admin LOCAL STORAGE DATA");

        return localCommitte;
      }
      rethrow;
    }
  }

  Future<void> refreshCommitte(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshCommmitte =
            await ref.read(getApiServiceProvider).getComitteList();
        await SharedPrefsService.saveComitteeList(freshCommmitte);
        return freshCommmitte;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
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

        final localComittee = await SharedPrefsService.getComitteeList();
        if (localComittee != null) return localComittee;
        rethrow;
      }
    });
  }
}
