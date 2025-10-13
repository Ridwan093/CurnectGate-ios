import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final biometricPrefProvider =
    StateNotifierProvider<BiometricPrefNotifier, bool>((ref) {
  return BiometricPrefNotifier();
});

class BiometricPrefNotifier extends StateNotifier<bool> {
  BiometricPrefNotifier() : super(false) {
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('biometric_enabled') ?? false;
  }

  Future<void> toggleBiometric(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric_enabled', enabled);
    state = enabled; // instantly update UI
  }
}
