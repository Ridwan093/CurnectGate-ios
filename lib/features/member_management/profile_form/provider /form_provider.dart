// features/member_management/provider/form_provider.dart
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/state_model/infoFilled_model.dart';
import 'package:curnectgate/features/member_management/profile_form/validator/password_validator.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

final profileRepositoryProvider = Provider(
  (ref) => AppApiMethod(ref.read(dioProvider)),
);

class FormNotifier extends StateNotifier<FormStates> {
  Timer? _resendTimer;
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
        break;
      case 'password':
        state = state.copyWith(passValid: isValid, phoneError: errorMessage);
    }
  }

  void updateGender(String? gender) {
    state = state.copyWith(gender: gender);
  }

  void updateAgreement(bool? agreed) {
    // Ensure we never pass null to a non-tristate checkbox
    state = state.copyWith(agreedToTerms: agreed ?? false);
  }

  void updatepassValid(bool? valide) {
    // Ensure we never pass null to a non-tristate checkbox
    state = state.copyWith(passValid: valide ?? false);
  }

  void updateLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(isLoading: isLoading);
  }

  void updateOtp(String otp, bool isComplete) {
    log("FormStateOTP:$otp");
    state = state.copyWith(otp: otp, isOtpComplete: isComplete);
  }

  void updateCreateNewPass(String? createNewpass) {
    state = state.copyWith(
      createNewpass: createNewpass,
      newpassValid: createNewpass!.isNotEmpty,
    );
  }

  void updateConfirmNewPass(String? confirmNewpass) {
    state = state.copyWith(
      confirmNewpass: confirmNewpass,
      confirmpassValid: confirmNewpass!.isNotEmpty,
    );
  }

  // In your form provider notifier
  Future<void> pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageBytes = await image.readAsBytes();
      state = state.copyWith(
        profileImage: imageBytes,
        profileImagePath: image.path,
      );
    } catch (e) {}
  }

  void clearProfileImage() {
    state = state.copyWith(profileImage: null, profileImagePath: null);
  }

  void startResendCountdown() {
    // Disable button and reset timer
    state = state.copyWith(isResendOtpEnabled: false, resendCountdownTime: 30);

    // Start countdown
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdownTime == 0) {
        _resendTimer?.cancel();
        state = state.copyWith(isResendOtpEnabled: true);
      } else {
        state = state.copyWith(
          resendCountdownTime: state.resendCountdownTime - 1,
        );
      }
    });
  }

  void updatePassword(String value) {
    final validation = PasswordValidator.validate(value);
    state = state.copyWith(
      pass: value,
      passValid: validation.isValid,
      hasMinLength: validation.hasMinLength,
      hasNumber: validation.hasNumber,
      hasSpecialChar: validation.hasSpecialChar,
    );
  }

  Future<void> completeRegristration({
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
          .read(profileRepositoryProvider)
          .onboardingRegistration(
            membercode: memberCode,
            estateCode: estateCode,
            firstname: firstName,
            lastName: lasetName,
            email: email,
            phoneNumber: phnoneNumber,
            gender: state.gender!,
            identityConfirmed: true,
            agreetoterms: state.agreedToTerms,
            password: state.pass ?? "",
          );

      if (response['status'] == true) {
        if (context.mounted) {
          // log(response['data'].toString());
          updateLoading(false);
          showCustomSuccessToast(
            context: context,
            message: "Registration completed successfully",
            color: AppColors.instance.teal400,
            icon: Icons.close,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
          context.pushNamed(AppRoutes.oTPCode, extra: response['data']);
        }
      } else {
        // log(response['data'].toString());
        showCustomSuccessToast(
          context: context,
          message: response['data']["password"][0] ?? "Invalide password",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }

      log(e.toString());
    } catch (e) {
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      state.passValid == false;
    }
  }

  Future<void> verifyOTP({
    required BuildContext context,
    required String email,
    required String otp,
    required WidgetRef ref,
  }) async {
    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPcode(email: email, code: state.otp, context: context);

      // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.done_all_rounded,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        final userData = response['data'] as Map<String, dynamic>?;
        if (userData != null) {
          final user = userData['user'] as Map<String, dynamic>?;
          final firstName = user?['firstname'] as String?;
          if (firstName != null) {
            await SharedPrefsService().saveSingleUserName(firstName);
          }
        }

        context.pushNamed(AppRoutes.signIN, extra: response['data']);
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
    required WidgetRef ref,
  }) async {
    updateLoading(false);

    if (password.isEmpty && email.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .logIn(email: email, pass: password, context: context);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        await SharedPrefsService().saveAuthData(response['data']);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        context.goNamed(AppRoutes.dashbord);
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response['message'],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: e.message.toString(),
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> forgetPass({
    required BuildContext context,
    required String email,
    bool isrequst = false,
    required WidgetRef ref,
  }) async {
    updateLoading(false);

    if (email.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .forgetPaSs(email: email, context: context);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        if (isrequst) {
          startResendCountdown();
        }
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        context.pushNamed(AppRoutes.passRestOtpVerify, extra: {"email": email});
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response['message'],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> verifyOTPForget({
    required BuildContext context,
    required String email,
    required bool islogin,
    required WidgetRef ref,
  }) async {
    updateLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPForget(email: email, code: state.otp);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        final responseData = response['data'] as Map<String, dynamic>;

        context.pushNamed(
          AppRoutes.passReset,
          extra: {
            ...responseData, // Spread existing data
            'local_email': email,
            'original_response': response, // Add new field
          },
        );
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: "Invalid or password or  email!",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> requestNewOtp({
    required BuildContext context,
    required String email,

    required WidgetRef ref,
  }) async {
    updateLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .requestOTPcode(email: email);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        startResendCountdown();
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        // context.goNamed(AppRoutes.passReset, extra: response['data']);
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: "Invalid email!",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> creatNewPassword({
    required BuildContext context,
    required String email,
    required String token,
    required WidgetRef ref,
  }) async {
    updateLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .createNewPass(
            email: email,
            newPassword: state.createNewpass,
            confrimPass: state.confirmNewpass,
            token: token,
            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pushNamed(AppRoutes.signIN);
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateUserName({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String notifyPre,
    required String gender,
    required WidgetRef ref,
  }) async {
    if (firstName.isEmpty && lastName.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserProfiles(
            gender: gender,
            firstName: firstName,
            lastName: lastName,
            preNotifcation: notifyPre,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateUserPassWord({
    required BuildContext context,
    required String currentPassword,
    required String newPassword,
    required String confirmPass,

    required WidgetRef ref,
  }) async {
    if (currentPassword.isEmpty && newPassword.isEmpty && confirmPass.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserpass(
            confirmNewpass: confirmPass,
            newPass: newPassword,
            currentPassword: currentPassword,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> deactiveAccount({
    required BuildContext context,
    required String currentPassword,
    required String reason,

    required WidgetRef ref,
  }) async {
    if (currentPassword.isEmpty && reason.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .deactiveAccount(
            reason: reason,

            currentPassword: currentPassword,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateUserPix({
    required BuildContext context,
    required File file,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserProfilespix(file: file, context: context);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal400,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  @override
  void dispose() {
    _resendTimer?.cancel(); // Prevent memory leaks
    super.dispose();
  }
}

final formProvider = StateNotifierProvider<FormNotifier, FormStates>((ref) {
  return FormNotifier();
});
