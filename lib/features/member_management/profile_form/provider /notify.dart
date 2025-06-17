import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier() : super(const FormState());

  void updateValidation(String field, bool isValid, String value) {
    switch (field) {
      case 'firstName':
        state = state.copyWith(
          firstNameValid: isValid,
      
        );
        break;
      case 'lastName':
        state = state.copyWith(
          lastNameValid: isValid,
       
        );
        break;
      case 'email':
        state = state.copyWith(
          emailValid: isValid,
       
        );
        break;
      case 'phone':
        state = state.copyWith(
          phoneValid: isValid,
      
        );
        break;
    }
  }

  void updateLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}