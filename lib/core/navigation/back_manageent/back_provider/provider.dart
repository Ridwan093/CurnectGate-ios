import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backPressProvider = StateNotifierProvider<BackPressNotifier, BackPressState>((ref) {
  return BackPressNotifier();
});

class BackPressState {
  final DateTime? lastBackPressTime;
  final bool showSnackBar;

  const BackPressState({
    this.lastBackPressTime,
    this.showSnackBar = false,
  });
}

class BackPressNotifier extends StateNotifier<BackPressState> {
  BackPressNotifier() : super(const BackPressState());

  void reset() {
    state = const BackPressState();
  }

  Future<bool> handleBackPress(BuildContext context) async {
    final now = DateTime.now();
    final lastPress = state.lastBackPressTime;
    const exitDuration = Duration(seconds: 2); // 2-second window for double press

    if (lastPress == null || now.difference(lastPress) > exitDuration) {
      // First press - show snackbar
      state = BackPressState(
        lastBackPressTime: now,
        showSnackBar: true,
      );
      
      // Hide snackbar after duration
      Future.delayed(exitDuration, () {
        if (state.showSnackBar) {
          state = BackPressState(lastBackPressTime: null);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      });
      
      return false;
    } else {
      // Second press within duration - exit app
      return true;
    }
  }
}