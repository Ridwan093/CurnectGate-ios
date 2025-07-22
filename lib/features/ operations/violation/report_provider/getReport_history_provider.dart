// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/%20operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportHisoryProvider =
    AsyncNotifierProvider.autoDispose<GetReportNotifer, StatusHistoryResponse?>(
      () {
        return GetReportNotifer();
      },
    );

class GetReportNotifer
    extends AutoDisposeAsyncNotifier<StatusHistoryResponse?> {
  @override
  Future<StatusHistoryResponse?> build() async {
    // First try to load from local storage
    final localReportHistory = await SharedPrefsService.getReportHistory();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);
      final id = ref.watch(reportProvider).report.id;

      if (token == null || token.isEmpty || id == 0 || id == null) {
        throw Exception("Unauthenticated");
      }

      final freshReoprt = await ref
          .read(getApiServiceProvider)
          .getreportHistor(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (localReportHistory?.toJson() != freshReoprt.toJson()) {
        await SharedPrefsService.saveReportHistory(freshReoprt);
      }

      return freshReoprt;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localReportHistory != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");

        return localReportHistory;
      } else {}
      rethrow;
    }
  }

  Future<void> refreshReports(BuildContext context, WidgetRef ref, int id) async {
    ref.read(reportProvider.notifier).updateErrorShow(false);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        // final id = ref.watch(reportProvider).report.id;
        final freshReoprt = await ref
            .read(getApiServiceProvider)
            .getreportHistor(bearerToken: token!, id: id );
        await SharedPrefsService.saveReportHistory(freshReoprt);

        return freshReoprt;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else if (e.toString().contains("The connection errored")) {
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localReport = await SharedPrefsService.getReportHistory();
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
