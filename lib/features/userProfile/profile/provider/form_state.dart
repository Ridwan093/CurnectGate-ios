import 'dart:developer';

import 'package:curnectgate/features/userProfile/profile/model/fform_enum.dart';
import 'package:curnectgate/features/userProfile/profile/model/form_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileFormProvider =
    StateNotifierProvider<ProfileFormNotifier, ProfileFormState>((ref) {
      return ProfileFormNotifier();
    });

class ProfileFormNotifier extends StateNotifier<ProfileFormState> {
  ProfileFormNotifier() : super(const ProfileFormState());

  void updateField({
    required ProfileFormType type,
    required String field,
    required String value,
  }) {
    switch (type) {
      case ProfileFormType.changePassword:
        _updatePasswordField(field, value);
        break;
      case ProfileFormType.changeName:
        _updateNameField(field, value);
        break;
      case ProfileFormType.deactivateAccount:
        _updateDeactivationField(field, value);
        break;
    }
  }

  void _updatePasswordField(String field, String value) {
    switch (field) {
      case 'currentPassword':
        state = state.copyWith(
          currentPassword: value,
          currentPasswordValid: value.isNotEmpty,
          passwordError: value.isEmpty ? 'Current password is required' : "",
        );
        break;
      case 'newPass':
        final isValid = value.isNotEmpty && value.length >= 6;
        state = state.copyWith(
          newPass: value,
          newPassValid: isValid,
          newwpasswordError: isValid ? "" : 'Minimum 6 characters required',
          confirmPassValid: isValid && value == state.confirmPass,
        );
        break;
      case 'confirmPass':
        state = state.copyWith(
          confirmPass: value,
          confirmPassValid: value.isNotEmpty && value == state.newPass,
          confirmpasswordError:
              value.isNotEmpty && value != state.newPass
                  ? 'Passwords do not match'
                  : "",
        );
        break;
    }
  }

  void _updateNameField(String field, String value) {
    log(value);
    switch (field) {
      case 'firstName':
        state = state.copyWith(
          firstName: value,
          firstNameValid: value.isNotEmpty,
          firstNameError: value.isEmpty ? 'First name is required' : '',
        );
        break;
      case 'lastName':
        state = state.copyWith(
          lastName: value,
          lastNameValid: value.isNotEmpty,
          lastNameError: value.isEmpty ? 'Last name is required' : '',
        );
        break;
    }
  }

  void _updateDeactivationField(String field, String value) {
    switch (field) {
      case 'currentPassword':
        state = state.copyWith(
          currentPassword: value,
          currentPasswordValid: value.isNotEmpty,
          passwordError: value.isEmpty ? 'Password is required' : '',
        );
        break;
      case 'reason':
        final isValid = value.isNotEmpty && value.length >= 10;
        state = state.copyWith(
          reason: value,
          reasonValid: isValid,
          reasonError: isValid ? '' : 'Minimum 10 characters required',
        );
        break;
    }
  }

  void reset() {
    state = const ProfileFormState();
  }
}
