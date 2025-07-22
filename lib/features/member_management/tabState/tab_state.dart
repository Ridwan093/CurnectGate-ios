// tab_state.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabStateNotifier extends StateNotifier<int> {
  TabStateNotifier() : super(0); // Start with first tab (index 0)

  void setTab(int index) {
    state = index;
  }

  void resetToMainTab() {
    state = 0; // Reset to main tab (index 0)
  }

}

final tabStateProvider = StateNotifierProvider<TabStateNotifier, int>((ref) {
  return TabStateNotifier();
});