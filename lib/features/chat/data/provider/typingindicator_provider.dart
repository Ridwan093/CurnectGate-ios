import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stores typing status of multiple users in a chat
class TypingStatusNotifier extends StateNotifier<Map<int, bool>> {
  TypingStatusNotifier() : super({});

  /// Update typing status for a user
  void updateTyping(int userId, bool isTyping) {
    state = {...state, userId: isTyping};
  }

  /// Remove a user when they leave
  void removeUser(int userId) {
    final newState = {...state};
    newState.remove(userId);
    state = newState;
  }

  /// Clear all typing (e.g., chat closed)
  void clear() => state = {};
}

/// Provider per chat
final typingStatusProvider =
    StateNotifierProvider.family<TypingStatusNotifier, Map<int, bool>, int>(
        (ref, chatId) => TypingStatusNotifier());