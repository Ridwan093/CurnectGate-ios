// features/member_management/provider/form_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpFormState {
  final bool oTpCodevalid;

  final bool isLoading;
  final String? oTpCodeError;

  const OtpFormState({
    this.isLoading = false,
    this.oTpCodevalid = false,
    this.oTpCodeError,
  });

  bool get allValid => oTpCodevalid;

  OtpFormState copyWith({
    bool? oTpCodevalid,
    bool? isLoading,
    String? oTpCodeError,
  }) {
    return OtpFormState(
      oTpCodeError: oTpCodeError ?? this.oTpCodeError,
      oTpCodevalid: oTpCodevalid ?? this.oTpCodevalid,

      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FormNotifier extends StateNotifier<OtpFormState> {
  FormNotifier() : super(const OtpFormState());

  void updateOTPCodeField({
    required String field,
    required bool isValid,
    String? errorMessage,
  }) {
    switch (field) {
      case 'OTPCode':
        state = state.copyWith(
          oTpCodevalid: isValid,
          oTpCodeError: errorMessage,
        );
    }
  }

  void updateLoading(bool isLoading) {
    ///loading state if (optioner)
    state = state.copyWith(isLoading: isLoading);
  }
}

final oTpformProvider = StateNotifierProvider<FormNotifier, OtpFormState>((ref) {
  return FormNotifier();
});
