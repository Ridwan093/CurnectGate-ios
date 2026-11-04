// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/auth/data/auth_model/get_start_model/onboarding_slider_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSliderprovider =
    AsyncNotifierProvider.autoDispose<SliderNotifer, OnboardingSliderResponse?>(
      () {
        return SliderNotifer();
      },
    );

class SliderNotifer
    extends AutoDisposeAsyncNotifier<OnboardingSliderResponse?> {
  @override
  Future<OnboardingSliderResponse?> build() async {
    // First try to load from local storage
    final localSlide = await SharedPrefsService.getSlider();

    try {
      final freshSlider = await ref.read(getApiServiceProvider).getSlider();

      // Only update local storage if data is different
      if (localSlide?.toJson() != freshSlider.toJson()) {
        await SharedPrefsService.saveSlider(freshSlider);
      }

      return freshSlider;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e} THIS IS PROFILE SCREEN THAT LOADING AFTER LOGOUT THE APP");
      if (localSlide != null) {
        log("${e} HERE IS PROFILE LOCAL STORAGE DATA");
        // Show error toast but still return local data

        return localSlide;
      }
      rethrow;
    }
  }

  Future<void> refreshSlider(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshSlide = await ref.read(getApiServiceProvider).getSlider();
        await SharedPrefsService.saveSlider(freshSlide);
        return freshSlide;
      } catch (e) {
        if (e.toString().contains("The connection errored")) {
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

        final localProfile = await SharedPrefsService.getSlider();
        if (localProfile != null) return localProfile;
        rethrow;
      }
    });
  }
}
