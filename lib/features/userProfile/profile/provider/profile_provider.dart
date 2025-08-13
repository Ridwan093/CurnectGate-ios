// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/profile/model/get_user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider =
    AsyncNotifierProvider.autoDispose<UserProfileNotifier, GetUserProfile?>(() {
      return UserProfileNotifier();
    });

class UserProfileNotifier extends AutoDisposeAsyncNotifier<GetUserProfile?> {
  @override
  Future<GetUserProfile?> build() async {
    // First try to load from local storage
    final localProfile = await SharedPrefsService.getProfile();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshProfile = await ref
          .read(getApiServiceProvider)
          .getUserProfile(bearerToken: token);

      // Only update local storage if data is different
      if (localProfile?.toJson() != freshProfile.toJson()) {
        await SharedPrefsService.saveProfile(freshProfile);
      }

      return freshProfile;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localProfile != null) {
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
        return localProfile;
      }
      rethrow;
    }
  }

  Future<void> refreshProfile(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshProfile = await ref
            .read(getApiServiceProvider)
            .getUserProfile(bearerToken: token ?? "");
        await SharedPrefsService.saveProfile(freshProfile);
        return freshProfile;
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

        final localProfile = await SharedPrefsService.getProfile();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
