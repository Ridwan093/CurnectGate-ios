import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart'
    show ElectionTab;
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final electionProvider = StateNotifierProvider<ElectionNotifier, ElectionState>(
  (ref) {
    final initial = ElectionState(
      election: _mockElection(),
      activeTab: ElectionTab.voteNow,
      activeResultTab: _mockElection().positions.first.id,
    );
    return ElectionNotifier(initial);
  },
);

class ElectionNotifier extends StateNotifier<ElectionState> {
  ElectionNotifier(ElectionState state) : super(state);

  void selectCandidate(String positionId, String candidateId) {
    final newSel = Map<String, String?>.from(state.selections);
    newSel[positionId] = candidateId;
    state = state.copyWith(selections: newSel);
  }

  void clearSelection(String positionId) {
    final newSel = Map<String, String?>.from(state.selections);
    newSel[positionId] = null;
    state = state.copyWith(selections: newSel);
  }

  void changeTab(ElectionTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  void changeResultTab(String id) {
    state = state.copyWith(activeResultTab: id);
  }

  // Example method to update votes or live results from an external source
  void updateLiveVotes(int votesSoFar) {
    final e = state.election;
    final updated = ElectionModel(
      id: e.id,
      title: e.title,
      estateName: e.estateName,
      memberName: e.memberName,
      memberId: e.memberId,
      activeCount: e.activeCount,
      yourVotes: e.yourVotes,
      totalVoters: e.totalVoters,
      votesSoFar: votesSoFar,
      timeLeft: e.timeLeft,
      positions: e.positions,
    );
    state = state.copyWith(election: updated);
  }
}

// Provide mock data
ElectionModel _mockElection() {
  final pos1 = PositionModel(
    id: 'pres',
    title: 'President',
    description: 'Lead the estate executive council',
    candidates: [
      Candidate(
        id: 'c1',
        name: 'Chinedu Okafor',
        party: 'Progress Party',
        totalVotes: 8,
      ),
      Candidate(
        id: 'c2',
        name: 'Aisha Bello',
        party: 'Unity Alliance',
        totalVotes: 4,
      ),
      Candidate(
        id: 'c3',
        name: 'Tunde Adeyemi',
        party: 'New Dawn',
        totalVotes: 12,
      ),
      Candidate(
        id: 'c4',
        name: 'Ngozi Okeke',
        party: 'Independent',
        totalVotes: 2,
      ),
    ],
  );

  final pos2 = PositionModel(
    id: 'gen_sec',
    title: 'Gen. Secretary',
    description: 'Manage membership records and meetings',
    candidates: [
      Candidate(
        id: 'c5',
        name: 'Ada Nwankwo',
        party: 'Progress Party',
        totalVotes: 7,
      ),
      Candidate(
        id: 'c6',
        name: 'Bayo Ojo',
        party: 'Unity Alliance',
        totalVotes: 2,
      ),
    ],
  );

  final pos3 = PositionModel(
    id: 'fin_sec',
    title: 'Finacial Sec.',
    description: 'Manage membership records and meetings',
    candidates: [
      Candidate(
        id: 'c7',
        name: 'Kinde Nwankwo',
        party: 'Progress Party',
        totalVotes: 3,
      ),
      Candidate(
        id: 'c8',
        name: 'Krish  Inkega',
        party: 'Unity Alliance',
        totalVotes: 4,
      ),
    ],
  );

  return ElectionModel(
    id: 'e2025',
    title: 'Executive Elections 2025',
    estateName: 'Greenville Estate',
    memberName: 'Benjamin Afolabi',
    memberId: 'GVE-2451',
    activeCount: 1,
    yourVotes: 0,
    totalVoters: 847,
    votesSoFar: 234,
    timeLeft: Duration(days: 1),
    positions: [pos1, pos2, pos3],
  );
}
