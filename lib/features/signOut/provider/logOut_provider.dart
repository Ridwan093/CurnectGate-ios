import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/getApi_Method.dart';
import 'package:curnectgate/core/%20utils/api/getApi_service.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final getApiServiceProvider = Provider<GetApiService>((ref) {
  return GetApiService(ref.read(dioProvider), ref);
});

class SignOutNotifier extends StateNotifier<SharedPrefsService> {
  SignOutNotifier() : super((SharedPrefsService()));

  void logOut({required WidgetRef ref, required BuildContext context}) async {
   ref.read(formProvider.notifier).updateLoading(true);

    try {
      
      // Always check first
   final response = await ref.read(getApiServiceProvider).signOut();
      if (response['status'] == true) {
        ref.read(formProvider.notifier).updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.done_all_rounded,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      state.clearAuthData();
      context.goNamed(AppRoutes.signIN);
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
        ref.read(formProvider.notifier).updateLoading(false);
    
      log("END------->");
    }
  }
}

final authProvider = StateNotifierProvider<SignOutNotifier, SharedPrefsService>(
  (ref) {
    return SignOutNotifier();
  },
);
