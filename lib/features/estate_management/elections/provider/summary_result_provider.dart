// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/results_response.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reultSummaryProvider =
    AsyncNotifierProvider.autoDispose<ResultSummarNotifier, ResultsResponse?>(
      () {
        return ResultSummarNotifier();
      },
    );

class ResultSummarNotifier extends AutoDisposeAsyncNotifier<ResultsResponse?> {
  @override
  Future<ResultsResponse?> build() async {
    // First try to load from local storage
    final locaCandidate = await SharedPrefsService.getLiveResultSummary();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }
      final id = ref.watch(electionProvider).id.toString();
      if (id.isEmpty) {
        throw Exception("Unauthenticated");
      }
      final freshCanidate = await ref
          .read(getApiServiceProvider)
          .getCandidateResultSummary(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (locaCandidate?.toJson() != freshCanidate.toJson()) {
        await SharedPrefsService.saveLiveResultSummary(freshCanidate);
      }

      return freshCanidate;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (locaCandidate != null) {
        log("${e}");

        return locaCandidate;
      }
      rethrow;
    }
  }

  Future<void> refreshCandidateResult(
    BuildContext context,
    WidgetRef ref,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final id = ref.watch(electionProvider).id.toString();
        final token = await ref.watch(accessTokenProvider.future);
        final freshCandidate = await ref
            .read(getApiServiceProvider)
            .getCandidateResultSummary(bearerToken: token!, id: id);
        await SharedPrefsService.saveLiveResultSummary(freshCandidate);
        return freshCandidate;
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

        final localcandidate = await SharedPrefsService.getLiveResultSummary();
        if (localcandidate != null) return localcandidate;
        rethrow;
      }
    });
  }
}
