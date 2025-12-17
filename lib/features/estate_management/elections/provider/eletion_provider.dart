import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart'
    show ElectionTab;

import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final electionProvider = StateNotifierProvider<ElectionNotifier, ElectionState>(
  (ref) {
    return ElectionNotifier(ElectionState.empty());
  },
);

class ElectionNotifier extends StateNotifier<ElectionState> {
  ElectionNotifier(ElectionState state) : super(state);
  void selectCandidate(String positionId, String candidateId) {
    state = state.copyWith(
      selections: {
        ...state.selections,
        positionId: candidateId, // overrides if already exists → single select
      },
    );
  }

  void removeCandidate(String positionId) {
    final newMap = Map<String, String>.from(state.selections)
      ..remove(positionId);
    state = state.copyWith(selections: newMap);
  }

  void clearAll() {
    state = state.copyWith(selections: {});
  }

  void addId(String id) {
    state = state.copyWith(id: id);
  }

  void changeTab(ElectionTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  void changeResultTab(String id) {
    if (id.isNotEmpty) {
      state = state.copyWith(activeResultTab: id);
    }
  }

  // Example method to update votes or live results from an external source
  void updateLiveVotes(int votesSoFar) {
    // final e = state.election;
    // final updated = ElectionModel(
    //   id: e.id,
    //   title: e.title,
    //   estateName: e.estateName,
    //   memberName: e.memberName,
    //   memberId: e.memberId,
    //   activeCount: e.activeCount,
    //   yourVotes: e.yourVotes,
    //   totalVoters: e.totalVoters,
    //   votesSoFar: votesSoFar,
    //   timeLeft: e.timeLeft,
    //   positions: e.positions,
    // );
    // state = state.copyWith(election: updated);
  }
}
