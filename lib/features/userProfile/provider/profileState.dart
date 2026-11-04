import 'package:flutter_riverpod/flutter_riverpod.dart';

// State holder for the switch value + API call logic
final switchProvider = StateNotifierProvider<SwitchNotifier, bool>((ref) {
  return SwitchNotifier();
});

class SwitchNotifier extends StateNotifier<bool> {
  SwitchNotifier() : super(false); // Initial state (switch off)

  // Toggle switch and call API
  Future<void> toggleSwitch(bool newValue) async {
    state = newValue; // Update state
    await _callMockApi(newValue); // Replace with your actual API call
  }

  // Mock API call (replace with your real implementation)
  Future<void> _callMockApi(bool isEnabled) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    print('API called with value: $isEnabled');
    // throw Exception('Failed!'); // Uncomment to test error handling
  }
}