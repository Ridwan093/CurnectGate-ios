import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/estate_management/elections/provider/Voting_setting_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votNow_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VotingSettingsData extends ConsumerWidget {
  const VotingSettingsData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final votingSettings = ref.watch(votingSettingsProvider);
    return votingSettings.when(
      data: (poll) {
        try {
          final polls = poll?.data;
          return polls != null
              ? VotnowContainer(data: polls)
              : EmptyBodys(message: "No Poll?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(votingSettingsProvider.notifier)
                    .refreshVotingSetting(context, ref),
            firstMessae: "Faile to load Poll?",
          );
        }
      },

      loading: () {
        try {
          final polls = ref.read(votingSettingsProvider).value;
          return polls != null
              ? VotnowContainer(data: polls.data!)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(votingSettingsProvider.notifier)
                    .refreshVotingSetting(context, ref),
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
          final polls = ref.read(votingSettingsProvider).value;
          if (polls != null) {
            return VotnowContainer(data: polls.data!);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(votingSettingsProvider.notifier)
                    .refreshVotingSetting(context, ref),
            firstMessae: "Faile to load Poll?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(votingSettingsProvider.notifier)
                    .refreshVotingSetting(context, ref),
            firstMessae: "Faile to load Poll deteils?",
          );
        }
      },
    );
  }
}
