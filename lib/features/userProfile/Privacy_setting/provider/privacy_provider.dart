// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/get_user_privacy_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPrivacyprovider = AsyncNotifierProvider.autoDispose<
  UserPrivacyNotifer,
  GetUserPrivacySettings?
>(() {
  return UserPrivacyNotifer();
});

class UserPrivacyNotifer
    extends AutoDisposeAsyncNotifier<GetUserPrivacySettings?> {
  @override
  Future<GetUserPrivacySettings?> build() async {
    // First try to load from local storage
    final localprivacy = await SharedPrefsService.getUserPrivacySettings();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshPrivacy = await ref
          .read(getApiServiceProvider)
          .getUserPrivacySettings(bearerToken: token);

      // Only update local storage if data is different
      if (localprivacy?.toJson() != freshPrivacy.toJson()) {
        await SharedPrefsService.savePrivacySettings(freshPrivacy);
      }

      return freshPrivacy;
    } catch (e, stack) {
      // If error occurs, return local data if available
      log("$e");
      if (localprivacy != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        ref.read(formProvider.notifier).updatePrivacy(false);
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localprivacy;
      } else {
        ref.read(formProvider.notifier).updatePrivacy(true);
      }
      rethrow;
    }
  }

  Future<void> refreshSettings(BuildContext context, WidgetRef ref) async {
    ref.read(formProvider.notifier).updatePrivacy(false);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshPrivacy = await ref
            .read(getApiServiceProvider)
            .getUserPrivacySettings(bearerToken: token!);
        await SharedPrefsService.savePrivacySettings(freshPrivacy);
        return freshPrivacy;
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

        final localprivacy = await SharedPrefsService.getUserPrivacySettings();
        if (localprivacy != null) {
          ref.read(formProvider.notifier).updatePrivacy(false);
        } else {
          ref.read(formProvider.notifier).updatePrivacy(true);
        }
        if (localprivacy != null) return localprivacy;
        rethrow;
      }
    });
  }
}
