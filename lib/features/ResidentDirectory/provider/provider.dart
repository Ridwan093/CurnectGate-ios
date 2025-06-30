// resident_search_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final residentSearchProvider = StateNotifierProvider<ResidentSearchNotifier, ResidentSearchState>((ref) {
  return ResidentSearchNotifier();
});

class ResidentSearchState {
  final String searchQuery;
  final List<Map<String, dynamic>> filteredResidents;
  final String? errorMessage;

  ResidentSearchState({
    this.searchQuery = '',
    required this.filteredResidents,
    this.errorMessage,
  });

  ResidentSearchState copyWith({
    String? searchQuery,
    List<Map<String, dynamic>>? filteredResidents,
    String? errorMessage,
  }) {
    return ResidentSearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      filteredResidents: filteredResidents ?? this.filteredResidents,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ResidentSearchNotifier extends StateNotifier<ResidentSearchState> {
  ResidentSearchNotifier()
      : super(ResidentSearchState(
          filteredResidents: _allResidents,
        ));

  static final List<Map<String, dynamic>> _allResidents = [
    {
      'name': 'Rita Dominic',
      'block': 'Block A, 2B',
      'address': 'Greenwood Estate',
      'status': 'Active',
    },
    {
      'name': 'John Doe',
      'block': 'Block B, 3C',
      'address': 'Greenwood Estate',
      'status': 'Pending',
    },
    // Add more residents here...
  ];

  void searchResidents(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        searchQuery: query,
        filteredResidents: _allResidents,
        errorMessage: '',
      );
      return;
    }

    final filtered = _allResidents.where((resident) {
      return resident['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    state = state.copyWith(
      searchQuery: query,
      filteredResidents: filtered,
      errorMessage: filtered.isEmpty ? 'No profile found, try adjusting your search' : null,
    );
  }

  void filterByStatus(String status) {
    if (status == 'All') {
      state = state.copyWith(filteredResidents: _allResidents);
      return;
    }

    final filtered = _allResidents.where((resident) {
      return resident['status'] == status;
    }).toList();

    state = state.copyWith(
      filteredResidents: filtered,
      errorMessage: filtered.isEmpty ? 'No residents with status: $status' : null,
    );
  }
}