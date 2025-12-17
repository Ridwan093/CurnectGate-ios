import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_History_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/History_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryData extends ConsumerWidget {
  const HistoryData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryAsync = ref.watch(pollHistoryProvider);
    return RefreshIndicator(
      onRefresh: () async {},
      child: HistoryAsync.when(
        data: (candidate) {
          try {
            final polls = candidate?.data;
            return polls != null
                ? ElectionHistoryCard(votes: polls.history ?? [])
                : EmptyBodys(message: "No Candidate Yet?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(pollHistoryProvider.notifier)
                      .refreshHistory(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          }
        },
        loading: () {
          try {
            final polls = ref.read(pollHistoryProvider).value;
            return polls != null
                ? ElectionHistoryCard(votes: polls.data?.history ?? [])
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(pollHistoryProvider.notifier)
                      .refreshHistory(context, ref),
              firstMessae: "Faile to load Candidate?",
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
            final polls = ref.read(pollHistoryProvider).value;
            if (polls != null) {
              return ElectionHistoryCard(votes: polls.data?.history ?? []);
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(pollHistoryProvider.notifier)
                      .refreshHistory(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(pollHistoryProvider.notifier)
                      .refreshHistory(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          }
        },
      ),
    );
  }
}
