// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableAdmin/estate_admins_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAdminProvider =
    AsyncNotifierProvider.autoDispose<AdminNotifier, EstateAdminsResponse?>(() {
      return AdminNotifier();
    });

class AdminNotifier extends AutoDisposeAsyncNotifier<EstateAdminsResponse?> {
  @override
  Future<EstateAdminsResponse?> build() async {
    // First try to load from local storage
    final localAdmin = await SharedPrefsService.getAdminList();

    try {
      final freshAdmin = await ref.read(getApiServiceProvider).getAdminList();

      // Only update local storage if data is different
      if (localAdmin?.toJson() != freshAdmin.toJson()) {
        await SharedPrefsService.saveAdminList(freshAdmin);
      }

      return freshAdmin;
    } catch (e) {
      // If error occurs, return local data if available

      if (localAdmin != null) {
        log("${e} HERE IS Admin LOCAL STORAGE DATA");
       
        return localAdmin;
      }
      rethrow;
    }
  }

  Future<void> refreshAdmin(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshAdmin = await ref.read(getApiServiceProvider).getAdminList();
        await SharedPrefsService.saveAdminList(freshAdmin);
        return freshAdmin;
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

        final localAdmin = await SharedPrefsService.getAdminList();
        if (localAdmin != null) return localAdmin;
        rethrow;
      }
    });
  }
}
