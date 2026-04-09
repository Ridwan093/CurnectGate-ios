import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart';

class ElectionState {
  final Map<String, String> selections;
  final ElectionTab activeTab;
  final String? activeResultTab;
  final String id;
  final String isError;
  const ElectionState({
    this.id = "",
    required this.selections,
    required this.activeTab,
    this.activeResultTab,
    this.isError = "",
  });

  // Initial empty state
  factory ElectionState.empty() => ElectionState(
    selections: {},
    activeTab: ElectionTab.voteNow,
    activeResultTab: null,
  );

  ElectionState copyWith({
    String? id,
    Map<String, String>? selections,
    ElectionTab? activeTab,
    String? activeResultTab,
    String? isError,
  }) {
    return ElectionState(
      isError: isError ?? this.isError,
      id: id ?? this.id,
      selections: selections ?? this.selections,
      activeTab: activeTab ?? this.activeTab,
      activeResultTab: activeResultTab ?? this.activeResultTab,
    );
  }
}
