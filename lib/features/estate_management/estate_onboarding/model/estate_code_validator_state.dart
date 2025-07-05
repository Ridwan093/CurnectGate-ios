// estate_code_validation_state.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstateCodeFormState {
  final String code;
  final bool isValid;
  final String? validationError; // For client-side validation
  final String? apiError; // For server-side errors
  final bool isLoading;

  const EstateCodeFormState({
    this.code = '',
    this.isValid = false,
    this.validationError,
    this.apiError,
    this.isLoading = false,
  });

  // Combine both errors with priority to validation errors
  String? get errorMessage => validationError ?? apiError;

  EstateCodeFormState copyWith({
    String? code,
    bool? isValid,
    String? validationError,
    String? apiError,
    bool? isLoading,
  }) {
    return EstateCodeFormState(
      code: code ?? this.code,
      isValid: isValid ?? this.isValid,
      validationError: validationError,
      apiError: apiError ?? this.apiError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class EstateCodeFormNotifier extends StateNotifier<EstateCodeFormState> {
  EstateCodeFormNotifier() : super(const EstateCodeFormState());

  void updateCode(String code, int length) {
    if (code.isEmpty) {
      state = state.copyWith(
        code: code,
        isValid: false,
        validationError: null, // No error shown when empty (better UX)
        apiError: null, // Clear any existing API error
      );
      return;
    }
    final validationError = _validateCode(code, length);
    state = state.copyWith(
      code: code,
      validationError: validationError,
      apiError:
          validationError == null
              ? null
              : state.apiError, // Clear API error if validating
      isValid: validationError == null,
    );
  }

  String? _validateCode(String code, int length) {
    if (code.isEmpty) return null; // No error when empty
    if (code.length < length) return 'code must be at least $length characters';
    // if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(code)) {
    //   return 'Only alphanumeric characters allowed';
    // }
    return null;
  }

  void setApiError(String message) {
    state = state.copyWith(apiError: message, isValid: false, isLoading: false);
  }

  void clearApiError() {
    state = state.copyWith(apiError: null, isLoading: false);
  }

  void update(EstateCodeFormState newState) {
    debugPrint(
      'Updating state from ${state.isLoading} to ${newState.isLoading}',
    );
    state = newState;
  }

  void setLoading(bool isLoading) {
    log('Loading: $isLoading');
    state = state.copyWith(isLoading: isLoading);
  }
}

final estateCodeFormProvider = StateNotifierProvider.autoDispose<
  EstateCodeFormNotifier,
  EstateCodeFormState
>((ref) {
  return EstateCodeFormNotifier();
});
