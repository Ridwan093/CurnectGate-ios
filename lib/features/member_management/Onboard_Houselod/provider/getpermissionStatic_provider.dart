// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permissions_response_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statisticProvider = AsyncNotifierProvider.autoDispose<
  PermissionStaticNotifier,
  PermissionsResponse?
>(() {
  return PermissionStaticNotifier();
});

class PermissionStaticNotifier
    extends AutoDisposeAsyncNotifier<PermissionsResponse?> {
  @override
  Future<PermissionsResponse?> build() async {
    // First try to load from local storage
    final localPermission = await SharedPrefsService.getPermissionStatistic();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      final id = ref.watch(notificationProviders).id;

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshPermission = await ref
          .read(getApiServiceProvider)
          .getPermissionStatisic(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (localPermission?.toJson() != freshPermission.toJson()) {
        await SharedPrefsService.savePermissionStatistic(freshPermission);
      }

      return localPermission;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localPermission != null) {
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
        return localPermission;
      }
      rethrow;
    }
  }

  Future<void> refreshPermission(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final id = ref.watch(notificationProviders).id;
        final freshPermission = await ref
            .read(getApiServiceProvider)
            .getPermissionStatisic(bearerToken: token!, id: id);
        await SharedPrefsService.savePermissionStatistic(freshPermission);
        return freshPermission;
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

        final localPermission =
            await SharedPrefsService.getPermissionStatistic();
        if (localPermission != null) return localPermission;
        rethrow;
      }
    });
  }
}
