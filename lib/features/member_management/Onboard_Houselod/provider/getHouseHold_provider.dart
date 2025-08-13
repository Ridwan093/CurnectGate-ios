// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';

import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_members_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final houseProvider = AsyncNotifierProvider.autoDispose<
  GetHouseHoldNotifier,
  HouseholdMembersResponse?
>(() {
  return GetHouseHoldNotifier();
});

class GetHouseHoldNotifier
    extends AutoDisposeAsyncNotifier<HouseholdMembersResponse?> {
  @override
  Future<HouseholdMembersResponse?> build() async {
    // First try to load from local storage
    final localhouseHold = await SharedPrefsService.getHouseHold();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshHouseHold = await ref
          .read(getApiServiceProvider)
          .getHouseHolds(bearerToken: token);

      // Only update local storage if data is different
      if (localhouseHold?.toJson() != freshHouseHold.toJson()) {
        await SharedPrefsService.saveHouseHold(freshHouseHold);
      }

      return localhouseHold;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localhouseHold != null) {
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
        return localhouseHold;
      }
      rethrow;
    }
  }

  Future<void> refreshHuseHold(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshHouseHold = await ref
            .read(getApiServiceProvider)
            .getHouseHolds(bearerToken: token!);
        await SharedPrefsService.saveHouseHold(freshHouseHold);
        return freshHouseHold;
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

        final localhouseHold = await SharedPrefsService.getHouseHold();
        if (localhouseHold != null) return localhouseHold;
        rethrow;
      }
    });
  }
}
