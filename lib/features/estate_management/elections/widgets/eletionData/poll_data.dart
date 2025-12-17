import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/vote_progress_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollDatas extends ConsumerWidget {
  final bool canRoute;
  const PollDatas({super.key, required this.canRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollAsync = ref.watch(pollProvider);
    return pollAsync.when(
      data: (poll) {
        try {
          final polls = poll?.data;
          return polls != null
              ? VoteProgressCard(data: polls, canRoute: canRoute)
              : EmptyBodys(message: "No Poll?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref.read(pollProvider.notifier).refreshPoll(context, ref),
            firstMessae: "Faile to load Poll?",
          );
        }
      },

      loading: () {
        try {
          final polls = ref.read(pollProvider).value;
          return polls != null
              ? VoteProgressCard(data: polls.data, canRoute: canRoute)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref.read(pollProvider.notifier).refreshPoll(context, ref),
            firstMessae: "Faile to load Poll?",
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
          final polls = ref.read(pollProvider).value;
          if (polls != null) {
            return Column(
              children: [
                VoteProgressCard(data: polls.data, canRoute: canRoute),
                // Emmergencybody(error: error.toString()),
              ],
            );
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref.read(pollProvider.notifier).refreshPoll(context, ref),
            firstMessae: "Faile to load Poll?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref.read(pollProvider.notifier).refreshPoll(context, ref),
            firstMessae: "Faile to load Poll deteils?",
          );
        }
      },
    );
  }
}
