// features/member_management/provider/form_provider.dart
import 'dart:developer';

import 'package:curnectgate/features/security/model/security_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormNotifier extends StateNotifier<SecurityStateModel> {
  FormNotifier() : super(const SecurityStateModel());
  void updateOtpCode(String value) {
    state = state.copyWith(otpCode: value);
  }

  void updateAccesType(String value) {
    state = state.copyWith(accessType: value);
  }

  void updateNumberOfGust(String value) {
    state = state.copyWith(
      numberOfGusest: value,
      numberValid: value.isNotEmpty,
    );
  }

  void updateLocation(String value) {
    log(value);
    state = state.copyWith(locationAccess: value);
  }

  void updatePhone(String value) {
    log(value);
    state = state.copyWith(phone: value);
  }

  void updateLodaing(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void updateRequiredEscort(bool value) {
    state = state.copyWith(requiredEscort: value);
  }

  void updateSecurityNote(String value) {
    state = state.copyWith(securityNoted: value);
  }

  void updateReason(String value) {
    state = state.copyWith(reason: value, reasonvalid: value.isNotEmpty);
  }

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
      case 'Access':
        state = state.copyWith(
          accessTypevalid: isValid,
          accessTypeError: errorMessage,
        );
      case 'Location':
        state = state.copyWith(
          locationGatevalid: isValid,
          locationGateError: errorMessage,
        );
      case 'Security note':
        state = state.copyWith(
          securityNotedvalid: isValid,
          securityNotedError: errorMessage,
        );
      case 'Reason':
        state = state.copyWith(reasonvalid: isValid, reasonError: errorMessage);
      case 'Phone':
        state = state.copyWith(
          vendorPhoneValid: isValid,
          phoneError: errorMessage,
        );
    }
  }

  void updateValidationType(String value) {
    log(value);
    state = state.copyWith(selectedValidationType: value);
  }

  void resetForm() {
    state = state.copyWith(
      locationAccess: "",
      accessType: "",
      otpCode: "",
      oTpCodevalid: false,
      accessTypeError: "",
      oTpCodeError: "",
      accessTypevalid: false,
      locationGateError: "",
      locationGatevalid: false,
      reason: "",
      reasonError: "",
      reasonvalid: false,
      securityNoted: "",
      securityNotedError: "",
      securityNotedvalid: false,
      isLoading: false,
      selectedValidationType: '',
      requiredEscort: false,
      vendorPhoneValid: false,
      phone: "",
      phoneError: "",
    );
  }

  void updateLoading(bool isLoading) {
    ///loading state if (optioner)
    state = state.copyWith(isLoading: isLoading);
  }
}

final oTpformProvider = StateNotifierProvider<FormNotifier, SecurityStateModel>(
  (ref) {
    return FormNotifier();
  },
);
