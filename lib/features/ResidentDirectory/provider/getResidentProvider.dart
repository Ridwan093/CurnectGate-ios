// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getResidentProvider = AsyncNotifierProvider.autoDispose<
  getResidentNotifier,
  ResidentDirectoryResponse?
>(() {
  return getResidentNotifier();
});

class getResidentNotifier
    extends AutoDisposeAsyncNotifier<ResidentDirectoryResponse?> {
  @override
  Future<ResidentDirectoryResponse?> build() async {
    // First try to load from local storage
    final localResident = await SharedPrefsService.getResident();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      // final filter = ref.read(reportProvider).report.reportfilter;
      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshResident = await ref
          .read(getApiServiceProvider)
          .getResident(bearerToken: token);

      // Only update local storage if data is different
      if (localResident?.toJson() != freshResident.toJson()) {
        await SharedPrefsService.saveResident(freshResident);
      }

      return freshResident;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (localResident != null) {
        log("${e}");
      } else {}
      rethrow;
    }
  }

  Future<void> refreshResident(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);

        final freshResindent = await ref
            .read(getApiServiceProvider)
            .getResident(bearerToken: token!);
        await SharedPrefsService.saveResident(freshResindent);

        return freshResindent;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
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

        final localResident = await SharedPrefsService.getResident();

        if (localResident != null) return localResident;
        rethrow;
      }
    });
  }
}
