// multi_select_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiSelectProvider = StateNotifierProvider.family<
    MultiSelectNotifier, 
    List<String>, 
    String // Now only takes ID as parameter
  >((ref, id) => MultiSelectNotifier(),
);

class MultiSelectNotifier extends StateNotifier<List<String>> {
  MultiSelectNotifier() : super([]);

  void toggleSelection(String item) {
    state.contains(item)
        ? state = state.where((i) => i != item).toList()
        : state = [...state, item];
  }

  void clearAll() {
    state = [];
  }
}