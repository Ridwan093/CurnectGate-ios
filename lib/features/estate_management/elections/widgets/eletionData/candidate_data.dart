import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/estate_management/elections/provider/candidate_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/tab/candidate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CandidateData extends ConsumerWidget {
  const CandidateData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candidateAsync = ref.watch(candidateProvider);
    return RefreshIndicator(
      onRefresh: () async {},
      child: candidateAsync.when(
        data: (candidate) {
          try {
            final polls = candidate?.data;
            return polls != null
                ? EletionCandidate(data: polls)
                : EmptyBodys(message: "No Candidate Yet?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(candidateProvider.notifier)
                      .refreshCandidate(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          }
        },
        loading: () {
          try {
            final polls = ref.read(candidateProvider).value;
            return polls != null
                ? EletionCandidate(data: polls.data!)
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(candidateProvider.notifier)
                      .refreshCandidate(context, ref),
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
            final polls = ref.read(candidateProvider).value;
            if (polls != null) {
              return EletionCandidate(data: polls.data!);
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(candidateProvider.notifier)
                      .refreshCandidate(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(candidateProvider.notifier)
                      .refreshCandidate(context, ref),
              firstMessae: "Faile to load Candidate?",
            );
          }
        },
      ),
    );
  }
}
