import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';

class ElectionState {
  final ElectionModel election;
  final ElectionTab activeTab;
  final String? activeResultTab;

  /// Map of positionId -> selected candidateId
  final Map<String, String?> selections;

  ElectionState({
    required this.election,
    Map<String, String?>? selections,
    required this.activeTab,
    required this.activeResultTab,
  }) : selections = selections ?? {};

  ElectionState copyWith({
    Map<String, String?>? selections,
    ElectionTab? activeTab,
    ElectionModel? election,
    String? activeResultTab,
  }) {
    return ElectionState(
      activeResultTab: activeResultTab ?? this.activeResultTab,
      election: election ?? this.election,
      activeTab: activeTab ?? this.activeTab,
      selections: selections ?? Map.of(this.selections),
    );
  }
}
