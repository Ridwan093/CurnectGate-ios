// estate_code_validation_state.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Value<T> {
  final T value;
  const Value(this.value);
}

class EstateCodeFormState {
  final String code;
  final bool isValid;
  final String? validationError;
  final String? apiError;
  final bool isLoading;

  const EstateCodeFormState({
    this.code = '',
    this.isValid = false,
    this.validationError,
    this.apiError,
    this.isLoading = false,
  });

  String? get errorMessage => validationError ?? apiError;

  EstateCodeFormState copyWith({
    String? code,
    bool? isValid,
    Value<String?>? validationError,
    Value<String?>? apiError,
    bool? isLoading,
  }) {
    return EstateCodeFormState(
      code: code ?? this.code,
      isValid: isValid ?? this.isValid,
      validationError:
          validationError != null
              ? validationError.value
              : this.validationError,
      apiError: apiError != null ? apiError.value : this.apiError,
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
        validationError: const Value(null),
        apiError: const Value(null),
      );
      return;
    }

    final validationError = _validateCode(code, length);

    state = state.copyWith(
      code: code,
      validationError: Value(validationError),
      apiError: const Value(null), // clear API error when typing
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
    state = state.copyWith(
      code: "",
      apiError: Value(message),
      validationError: const Value(null),
      isValid: false,
      isLoading: false,
    );
  }

  void clearApiError() {
    log("state${state.code}");
    state = state.copyWith(
      code: "",
      isValid: false,
      validationError: const Value(null),
      apiError: const Value(null),
    );
    log("end${state.code}");
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
