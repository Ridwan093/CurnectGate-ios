// features/signOut/provider/authProvider.dart (or session_provider.dart)

import 'package:flutter_riverpod/flutter_riverpod.dart';
// features/signOut/provider/session_provider.dart
// Better approach – use a StateNotifier for cleaner control

class SessionNotifier extends StateNotifier<bool> {
  SessionNotifier() : super(false);

  void expire() {
    if (!state) state = true;
  }

  void reset() {
    state = false;
  }
}

final sessionExpiredProvider = StateNotifierProvider<SessionNotifier, bool>((
  ref,
) {
  return SessionNotifier();
});
