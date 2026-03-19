/// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/set_restriction/restriction_status_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestrictionStatus = AsyncNotifierProvider.autoDispose<
  PropertyIDNotifier,
  RestrictionStatusResponse?
>(() {
  return PropertyIDNotifier();
});

class PropertyIDNotifier
    extends AutoDisposeAsyncNotifier<RestrictionStatusResponse?> {
  @override
  Future<RestrictionStatusResponse?> build() async {
    // First try to load from local storage
    final localRes = await SharedPrefsService.getRestricted();

    try {
      final id = ref.watch(notificationProviders).id;
      final freshRes = await ref
          .read(getApiServiceProvider)
          .getRestriced(id: int.parse(id));

      // Only update local storage if data is different
      if (localRes?.toJson() != freshRes.toJson()) {
        await SharedPrefsService.saveRestricted(freshRes);
      }

      return freshRes;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}j");
      if (localRes != null) {
        return localRes;
      }
      rethrow;
    }
  }

  Future<void> refresrestrict(
    BuildContext context,
    WidgetRef ref,
    int id,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshproperty = await ref
            .read(getApiServiceProvider)
            .getRestriced(id: id);
        await SharedPrefsService.saveRestricted(freshproperty);
        return freshproperty;
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401) {
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

        final localRes = await SharedPrefsService.getRestricted();
        if (localRes != null) return localRes;
        rethrow;
      }
    });
  }
}
