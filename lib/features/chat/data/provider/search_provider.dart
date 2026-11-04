// search_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState());

  void toggleSearch() {
    state = state.copyWith(isSearching: !state.isSearching);
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void clearSearch() {
    state = state.copyWith(isSearching: false, query: '');
  }
}

class SearchState {
  final bool isSearching;
  final String query;

  SearchState({this.isSearching = false, this.query = ''});

  SearchState copyWith({bool? isSearching, String? query}) {
    return SearchState(
      isSearching: isSearching ?? this.isSearching,
      query: query ?? this.query,
    );
  }
}