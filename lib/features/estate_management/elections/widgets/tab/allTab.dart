import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/candiate_live_resuilt_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/candidate_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/history_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/tab/vote_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Alltab extends ConsumerWidget {
  final ElectionState state;
  const Alltab({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.activeTab == ElectionTab.voteNow) {
      return const VoteNow();
    } else if (state.activeTab == ElectionTab.liveResult) {
      return CandidateResultData(state: state);
    } else if (state.activeTab == ElectionTab.candidates) {
      return const CandidateData();
    } else if (state.activeTab == ElectionTab.history) {
      return const HistoryData();
    }

    // Default -> Vote Now Tab
    return VoteNow();
  }
}
