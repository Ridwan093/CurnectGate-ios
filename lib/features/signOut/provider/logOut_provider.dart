import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/getApi_Method.dart';
import 'package:curnectgate/core/%20utils/api/getApi_service.dart';
import 'package:curnectgate/core/config/biometric_faceID/Helper/device_info_helper.dart';
import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/services/reverb_service.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/signOut/errorWidget/SignOut_dialog.dart';
import 'package:curnectgate/features/signOut/errorWidget/expireDialog.dart';
import 'package:curnectgate/features/signOut/provider/authProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final getApiServiceProvider = Provider<GetApiService>((ref) {
  return GetApiService(ref.read(dioProvider));
});

class SignOutNotifier extends StateNotifier<SharedPrefsService> {
  SignOutNotifier() : super((SharedPrefsService()));

  void logOut({required WidgetRef ref, required BuildContext context}) async {
    final shouldSignOut = await showSignOutDialog(context);

    if (shouldSignOut == true) {
      // Perform sign out logic

      ref.read(formProvider.notifier).updateLogOutLoadin(true);

      try {
        // Always check first
        final token = ref.read(accessTokenProvider).value;
        final data = await DeviceInfoHelper.deviceInfo();
        final response = await ref
            .read(getApiServiceProvider)
            .signOut(token: token ?? "");
        if (response['status'] == true) {
          try {
            await ref
                .read(profileRepositoryProvider)
                .removedDeviceTokens(requestData: data, context: context);
          } catch (e) {
            log("Removed device tokens failed: $e");
          }

          if (context.mounted) {
            showCustomSuccessToast(
              context: context,
              message: response["message"],
              color: AppColors.instance.teal300,
              icon: Icons.done_all_rounded,
              iconColors: AppColors.instance.grey200,
              positionNumber: 70,
            );
          }

          ReverbService.disconnect();
          await state.clearAuthData();
          await ref.read(profilePicProvider.notifier).clearAllProfilePics();
          ref.read(tabStateProvider.notifier).resetToMainTab();
          
          if (context.mounted) {
            context.goNamed(AppRoutes.signIN);
          }
          
          ref.read(sessionExpiredProvider.notifier).reset();
          ref.read(formProvider.notifier).updateLogOutLoadin(false);

          log("TRUE------->");
          // ref
          //     .read(formProvider.notifier)
          //     .removedToken(context: context, ref: ref);

          // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
          //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
          // final userData = response['data'] as Map<String, dynamic>?;
          // if (userData != null) {
          //   final user = userData['user'] as Map<String, dynamic>?;
          //   final firstName = user?['firstname'] as String?;
          //   if (firstName != null) {
          //     await SharedPrefsService().saveSingleUserName(firstName);
          //   }
          // }
        } else {
          log("FALSE------->");
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.close,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      } on DioException catch (e) {
        if (!context.mounted) return;

        if (e.error is SocketException) {
          showCustomSuccessToast(
            context: context,
            message:
                "Network unavailable. Please check your internet connection.",
            color: AppColors.instance.error500,
            icon: Icons.close,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
        log(e.toString());
      } catch (e) {
        if (!context.mounted) return;
        log("E-ERROR-MESSAGE------->");
        log(e.toString());
        showCustomSuccessToast(
          context: context,
          message: e.toString(),
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } finally {
        ref.read(formProvider.notifier).updateLogOutLoadin(false);

        log("END------->");
      }
    }
  }

  void sessionExpire(BuildContext context, WidgetRef ref) async {
    final shouldLogout = await showSessionExpiredDialog(context);

    if (shouldLogout) {
      // 2. Clear states only after user confirms
      ReverbService.disconnect();
      await state.clearAuthData();

      await ref.read(profilePicProvider.notifier).clearAllProfilePics();
      ref.read(tabStateProvider.notifier).resetToMainTab();
      // 3. Navigate to login screen
      if (context.mounted) {
        context.goNamed(AppRoutes.signIN);
      }

      ref.read(sessionExpiredProvider.notifier).reset();
    } else {
      ref.read(sessionExpiredProvider.notifier).reset();
    }
  }
}

final authProvider = StateNotifierProvider<SignOutNotifier, SharedPrefsService>(
  (ref) {
    return SignOutNotifier();
  },
);
