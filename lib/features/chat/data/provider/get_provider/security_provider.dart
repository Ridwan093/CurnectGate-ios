// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableSecurity/securityResponde.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAvailableSecurity = AsyncNotifierProvider.autoDispose<
  SecurityListNotifier,
  SecurityPersonnelResponse?
>(() {
  return SecurityListNotifier();
});

class SecurityListNotifier
    extends AutoDisposeAsyncNotifier<SecurityPersonnelResponse?> {
  @override
  Future<SecurityPersonnelResponse?> build() async {
    // First try to load from local storage
    final localSecurity = await SharedPrefsService.getSecurityList();

    try {
      final freshSecurity = await ref.read(getApiServiceProvider).getSecurityList();

      // Only update local storage if data is different
      if (localSecurity?.toJson() != freshSecurity.toJson()) {
        await SharedPrefsService.saveSecurityList(freshSecurity);
      }

      return freshSecurity;
    } catch (e) {
      // If error occurs, return local data if available

      if (localSecurity != null) {
        log("${e} HERE IS Admin LOCAL STORAGE DATA");

        return localSecurity;
      }
      rethrow;
    }
  }

  Future<void> refreshSecurity(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshSecurity =
            await ref.read(getApiServiceProvider).getSecurityList();
        await SharedPrefsService.saveSecurityList(freshSecurity);
        return freshSecurity;
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

        final localSecurity = await SharedPrefsService.getSecurityList();
        if (localSecurity != null) return localSecurity;
        rethrow;
      }
    });
  }
}
