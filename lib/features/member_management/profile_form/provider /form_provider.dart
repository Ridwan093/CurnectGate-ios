// features/member_management/provider/form_provider.dart
import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/provider/estate_code_repository.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/state_model/infoFilled_model.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider(
  (ref) => AppApiMethod(ref.read(dioProvider)),
);

class FormNotifier extends StateNotifier<FormStates> {
  FormNotifier() : super(FormStates());

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
        state = state.copyWith(emailValid: isValid, emailError: errorMessage);
        break;
      case 'phone':
        state = state.copyWith(phoneValid: isValid, phoneError: errorMessage);
        break;
      case 'OTPCode':
        state = state.copyWith(phoneValid: isValid, phoneError: errorMessage);
    }
  }

  void updateGender(String? gender) {
    state = state.copyWith(gender: gender);
  }

  void updateAgreement(bool? agreed) {
    // Ensure we never pass null to a non-tristate checkbox
    state = state.copyWith(agreedToTerms: agreed ?? false);
  }

  void updateLoading(bool isLoading) {
    ///loading state if (optioner)
    state = state.copyWith(isLoading: isLoading);
  }

  void updatePassword(String pass) {
    ///loading state if (optioner)
    log("Pass:$pass");
    state = state.copyWith(pass: pass);
  }

  Future<void> submitCode({
    required BuildContext context,
    required String firstName,
    required String lasetName,
    required String estateCode,
    required String memberCode,
    required String phnoneNumber,
    required String email,
    required String pass,
    required bool identityconfirmed,
    required WidgetRef ref,
  }) async {
    if (firstName.isEmpty &&
        lasetName.isEmpty &&
        estateCode.isEmpty &&
        memberCode.isEmpty &&
        phnoneNumber.isEmpty &&
        !state.agreedToTerms &&
        !identityconfirmed &&
        state.pass!.isEmpty) {
      return;
    }
    // Force validation check
 
    updateLoading(true);

    try {
      final response = await ref
          .read(estateCodeRepositoryProvider)
          .onboardingRegistration(
            membercode: memberCode,
            estateCode: estateCode,
            firstname: firstName,
            lastName: lasetName,
            email: email,
            phoneNumber: phnoneNumber,
            gender: state.gender,
            identityConfirmed: true,
            agreetoterms: state.agreedToTerms,
            password: state.pass ?? "",
          );

      if (response['status'] == true) {
        if (context.mounted) {
          log(response['data'].toString());
          // context.goNamed(AppRoutes.confirmInfomation, extra: response['data']);
        }
      } else {
        log(response['data'].toString());
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error600,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }

      log(e.toString());
    } catch (e) {
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error600,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
    }
  }
}

final formProvider = StateNotifierProvider<FormNotifier, FormStates>((ref) {
  return FormNotifier();
});
