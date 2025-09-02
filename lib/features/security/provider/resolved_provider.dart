// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resovedProvider =
    AsyncNotifierProvider.autoDispose<GetReportNotifer, ViolationResponse?>(() {
      return GetReportNotifer();
    });

class GetReportNotifer extends AutoDisposeAsyncNotifier<ViolationResponse?> {
  @override
  Future<ViolationResponse?> build() async {
    // First try to load from local storage
    final localReport = await SharedPrefsService.getReportListResolved();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      final filter = ref.read(reportProvider).report.reportfilter;
      if (token == null || token.isEmpty || filter!.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshReoprt = await ref
          .read(getApiServiceProvider)
          .getreport(bearerToken: token, filter: "resolved");

      // Only update local storage if data is different
      if (localReport?.toJson() != freshReoprt.toJson()) {
        await SharedPrefsService.saveReportListResolved(freshReoprt);
      }

      return freshReoprt;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (localReport != null) {
        log("${e}");
        ref.read(reportProvider.notifier).updateErrorShow(false);
        return localReport;
      } else {
        ref.read(reportProvider.notifier).updateErrorShow(true);
      }
      rethrow;
    }
  }

  Future<void> refreshReports(BuildContext context, WidgetRef ref) async {
    ref.read(reportProvider.notifier).updateErrorShow(false);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);

        final freshReoprt = await ref
            .read(getApiServiceProvider)
            .getreport(bearerToken: token!, filter: "resolved");
        await SharedPrefsService.saveReportListResolved(freshReoprt);

        return freshReoprt;
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

        final localReport = await SharedPrefsService.getReportListResolved();
        if (localReport != null) {
          ref.read(reportProvider.notifier).updateErrorShow(false);
        } else {
          ref.read(reportProvider.notifier).updateErrorShow(true);
        }
        if (localReport != null) return localReport;
        rethrow;
      }
    });
  }
}
