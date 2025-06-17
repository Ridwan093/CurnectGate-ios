// features/member_management/provider/form_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormState {
  final bool firstNameValid;
  final bool lastNameValid;
  final bool emailValid;
  final bool phoneValid;
  final bool isLoading;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;

  const FormState({
    this.firstNameValid = false,
    this.lastNameValid = false,
    this.emailValid = false,
    this.phoneValid = false,
    this.isLoading = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
  });

  bool get allValid => firstNameValid && lastNameValid && emailValid && phoneValid;

  FormState copyWith({
    bool? firstNameValid,
    bool? lastNameValid,
    bool? emailValid,
    bool? phoneValid,
    bool? isLoading,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
  }) {
    return FormState(
      firstNameValid: firstNameValid ?? this.firstNameValid,
      lastNameValid: lastNameValid ?? this.lastNameValid,
      emailValid: emailValid ?? this.emailValid,
      phoneValid: phoneValid ?? this.phoneValid,
      isLoading: isLoading ?? this.isLoading,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
    );
  }
}

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier() : super(const FormState());

  void updateField({
    required String field,
    required bool isValid,
    String? errorMessage,
  }) {
    switch (field) {
      case 'firstName':
        state = state.copyWith(
          firstNameValid: isValid,
          firstNameError: errorMessage,
        );
        break;
      case 'lastName':
        state = state.copyWith(
          lastNameValid: isValid,
          lastNameError: errorMessage,
        );
        break;
      case 'email':
        state = state.copyWith(
          emailValid: isValid,
          emailError: errorMessage,
        );
        break;
      case 'phone':
        state = state.copyWith(
          phoneValid: isValid,
          phoneError: errorMessage,
        );
        break;
    }
  }

  void updateLoading(bool isLoading) {
    ///loading state if (optioner)
    state = state.copyWith(isLoading: isLoading);
  }
}

final formProvider = StateNotifierProvider<FormNotifier, FormState>((ref) {
  return FormNotifier();
});