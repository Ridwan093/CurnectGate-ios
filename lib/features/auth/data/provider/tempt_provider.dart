
// 1. Password Validation Provider
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordValidationProvider =
    StateNotifierProvider<PasswordValidationNotifier, PasswordValidationState>((
      ref,
    ) {
      return PasswordValidationNotifier(ref);
    });

class PasswordValidationNotifier
    extends StateNotifier<PasswordValidationState> {
  final Ref ref;

  PasswordValidationNotifier(this.ref) : super(PasswordValidationState()) {
    // Automatically update form indicator when validation changes
    addListener((state) {
      ref.read(formProvider.notifier).updateIndicatorChekc(state.isValid);
    });
  }

  void validate(String password) {
    state = PasswordValidationState(
      hasMinLength: password.length >= 9,
      hasNumber: password.contains(RegExp(r'[0-9]')),
      hasSpecialChar: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
    );
  }
}

class PasswordValidationState {
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  PasswordValidationState({
    this.hasMinLength = false,
    this.hasNumber = false,
    this.hasSpecialChar = false,
  });

  bool get isValid => hasMinLength && hasNumber && hasSpecialChar;
}

// 2. Password Visibility Provider
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
