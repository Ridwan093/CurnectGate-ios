import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stores typing status of multiple users in a chat
class TypingStatusNotifier extends StateNotifier<Map<int, bool>> {
  TypingStatusNotifier() : super({});

  final Map<int, Timer> _timers = {};

  /// Update typing status for a user
  void updateTyping(int userId, bool isTyping) {
    // Cancel existing timer for this user
    _timers[userId]?.cancel();
    _timers.remove(userId);

    // Update state
    state = {...state, userId: isTyping};

    if (isTyping) {
      // Start a new timer to clear the typing status after 5 seconds
      _timers[userId] = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          updateTyping(userId, false);
        }
      });
    }
  }

  /// Remove a user when they leave
  void removeUser(int userId) {
    _timers[userId]?.cancel();
    _timers.remove(userId);
    final newState = {...state};
    newState.remove(userId);
    state = newState;
  }

  /// Clear all typing (e.g., chat closed)
  void clear() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    state = {};
  }

  @override
  void dispose() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    super.dispose();
  }
}

/// Provider per chat
final typingStatusProvider =
    StateNotifierProvider.family<TypingStatusNotifier, Map<int, bool>, int>(
        (ref, chatId) => TypingStatusNotifier());
