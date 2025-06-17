
// validation_notifier.dart
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidationNotifier extends StateNotifier<ValidationState> {
  ValidationNotifier() : super(ValidationState());

  Future<void> validateMemberCode(String code) async {
    state = state.copyWith(status: ValidationStatus.loading);
    
    try {
      // PLACEHOLDER: Replace with actual API call later
      await Future.delayed(Duration(seconds: 2)); // Simulate API call
      
      // Mock validation logic - replace with real API response handling
      final isValid = code.length >= 6; // Example validation
      
      if (isValid) {
        state = state.copyWith(
          status: ValidationStatus.success,
          memberAddress: "123 Estate Avenue\nLagos, Nigeria", // Mock data
        );
      } else {
        state = state.copyWith(
          status: ValidationStatus.error,
          errorMessage: "We couldn't find this ID for Greenwood Residences, please check your ID or contact your estate management""",
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: ValidationStatus.error,
        errorMessage: "We couldn't find this ID for Greenwood Residences, please check your ID or contact your estate management""",
      );
    }
  }

  void reset() {
    state = ValidationState();
  }
}

final validationProvider = StateNotifierProvider<ValidationNotifier, ValidationState>(
  (ref) => ValidationNotifier(),
);