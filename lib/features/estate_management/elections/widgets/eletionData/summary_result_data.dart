import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/estate_management/elections/provider/summary_result_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/sub_tab/sumamry.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryResuiltData extends ConsumerWidget {
  const SummaryResuiltData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candidateAsync = ref.watch(reultSummaryProvider);
    return RefreshIndicator(
      onRefresh: () async {},
      child: candidateAsync.when(
        data: (candidate) {
          try {
            final polls = candidate?.data;
            return polls != null
                ? SummaryResultTab(data: polls)
                : EmptyBodys(message: "No Result Yet?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(reultSummaryProvider.notifier)
                      .refreshCandidateResult(context, ref),
              firstMessae: "Faile to load Result?",
            );
          }
        },
        loading: () {
          try {
            final polls = ref.read(reultSummaryProvider).value;
            return polls != null
                ? SummaryResultTab(data: polls.data!)
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(reultSummaryProvider.notifier)
                      .refreshCandidateResult(context, ref),
              firstMessae: "Faile to load Result?",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error is DioException && error.response?.statusCode == 401) {
              return Expiresessionbody();
            }

            // Try to show cached data
            final polls = ref.read(reultSummaryProvider).value;
            if (polls != null) {
              return SummaryResultTab(data: polls.data!);
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(reultSummaryProvider.notifier)
                      .refreshCandidateResult(context, ref),
              firstMessae: "Faile to load Result?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(reultSummaryProvider.notifier)
                      .refreshCandidateResult(context, ref),
              firstMessae: "Faile to load Result?",
            );
          }
        },
      ),
    );
  }
}
