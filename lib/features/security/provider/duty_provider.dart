// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/security/model/duty_model/duty_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dutyProvider =
    AsyncNotifierProvider.autoDispose<GetDutyNotifier, DutyResponse?>(() {
      return GetDutyNotifier();
    });

class GetDutyNotifier extends AutoDisposeAsyncNotifier<DutyResponse?> {
  @override
  Future<DutyResponse?> build() async {
    // First try to load from local storage
    final localDuty = await SharedPrefsService.getDuty();

    try {
      // Then try to fetch fresh data

      final freshDuty = await ref.read(getApiServiceProvider).getDuty();

      // Only update local storage if data is different
      if (localDuty?.toJson() != freshDuty.toJson()) {
        await SharedPrefsService.saveDuty(freshDuty);
      }

      return freshDuty;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (localDuty != null) {
        log("${e}");

        return localDuty;
      }
      rethrow;
    }
  }

  Future<void> refreshDuty(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshDuty = await ref.read(getApiServiceProvider).getDuty();
        await SharedPrefsService.saveDuty(freshDuty);

        return freshDuty;
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401) {
          log(e.toString());
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else if (e.toString().contains("connection")) {
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localDuty = await SharedPrefsService.getDuty();
        if (localDuty != null) {
        } else {}
        if (localDuty != null) return localDuty;
        rethrow;
      }
    });
  }
}
