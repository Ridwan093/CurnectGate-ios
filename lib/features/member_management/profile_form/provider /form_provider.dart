// features/member_management/provider/form_provider.dart
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/comment_provider.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/auth/widget/tmporarypassword_dialog.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/state_model/infoFilled_model.dart';
import 'package:curnectgate/features/member_management/profile_form/validator/password_validator.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/getDigitalIDProvider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/provider/prefrence_provider.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/provider/privacy_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/provider/NotificationSettings_provider.dart';
import 'package:curnectgate/features/userProfile/profile/provider/profile_provider.dart';
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

  void updateloginLodaing(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(loginLodaing: isLoading);
  }

  void updateEstateIdCheckLoadin(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(estateIdCheckLoadin: isLoading);
  }

  void updateMemberIdcheckLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(memberIdcheckLoading: isLoading);
  }

  void updateCreatPassLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(creatPassLoading: isLoading);
  }

  void updateOtpVerifyLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(otpVerifyLoading: isLoading);
  }

  void updateChangPassLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(changPassLoading: isLoading);
  }

  void updatForgetPaSsLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(forgetPaSsLoading: isLoading);
  }

  void updateChangTemporyPassLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(changTemporyPassLoading: isLoading);
  }

  void updateLogOutLoadin(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(logOutLoading: isLoading);
  }

  void updatePrivacyLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(privacyLoading: isLoading);
  }

  void updatePrevencyLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(prevencyLoading: isLoading);
  }

  void updateNotificationSettingLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(notificationSettingLoading: isLoading);
  }

  void updateReportLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(reportLoading: isLoading);
  }

  void updateCommentLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(commentLoading: isLoading);
  }

  void updateChangProfileInfoLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(changProfileInfoLoading: isLoading);
  }

  void updateChangProfilePicLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(changProfilePicLoading: isLoading);
  }

  void updateChangProfilePassLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(changProfilePassLoading: isLoading);
  }

  void updatedeActivatAccountLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(deActivatAccountLoading: isLoading);
  }

  void updatedeSchedulOtpLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(schedulOtpLoading: isLoading);
  }

  void updatedeGenerateOtpLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(generateOtpWithValidatorLoading: isLoading);
  }

  void updatedeRevorkOtpLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(revokOtpLoading: isLoading);
  }

  void updateGenrateMemberIdLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(generateMemberIdLoading: isLoading);
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

  void updatecurrentPass(String? createNewpass) {
    state = state.copyWith(
      currentPass: createNewpass,
      currentPassVaalid: createNewpass!.isNotEmpty,
    );
  }

  void updateIndicatorChekc(bool value) {
    state = state.copyWith(indicatorCheck: value);
  }

  void updateRegenerateDigiterCode(String value) {
    state = state.copyWith(digiterReason: value);
  }

  void resteRasion() {
    state = state.copyWith(digiterReason: "");
  }

  void resettemptChange() {
    state = state.copyWith(
      createNewpass: "",
      newpassValid: false,
      confirmNewpass: "",
      confirmpassValid: false,
      currentPass: "",
      currentPassVaalid: false,
    );
  }

  void updateConfirmNewPass(String? confirmNewpass) {
    state = state.copyWith(
      confirmNewpass: confirmNewpass,
      confirmpassValid: confirmNewpass!.isNotEmpty,
    );
  }

  void updateFromTime(String? value) {
    state = state.copyWith(fromTime: value);
  }

  void updateToTime(String? value) {
    state = state.copyWith(toTime: value);
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

  void updateNotificationSettingError(bool value) {
    state = state.copyWith(notificationsettingerror: value);
  }

  void updateprevenc(bool value) {
    state = state.copyWith(prvencyettingerror: value);
  }

  void updatePrivacy(bool value) {
    state = state.copyWith(privacysettingerror: value);
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

    updateCreatPassLoading(true);

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
          updateCreatPassLoading(false);
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
          context.pushNamed(AppRoutes.oTPCode, extra: response['data']);
        }
      } else {
        // log(response['data'].toString());
        updateCreatPassLoading(false);
        showCustomSuccessToast(
          context: context,
          message: response['data']["password"][0] ?? "Invalide password",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateCreatPassLoading(false);
      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }

      log(e.toString());
    } catch (e) {
      updateCreatPassLoading(false);
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateCreatPassLoading(false);
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
    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPcode(email: email, code: state.otp, context: context);

      // Always check first

      if (response['status'] == true) {
        updateOtpVerifyLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
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
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateOtpVerifyLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateOtpVerifyLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  // void navigateBasedOnRole(UserRole role) {
  //   switch (role) {
  //     case UserRole.landlord:
  //       context.goNamed(AppRoutes.dashbord);
  //       break;
  //     case UserRole.admin:
  //       context.goNamed(AppRoutes.dashbord);
  //       break;
  //     case UserRole.resident:
  //       context.goNamed(AppRoutes.dashbord);
  //       break;
  //     case UserRole.security:
  //       context.goNamed(AppRoutes.securityguide);
  //       break;
  //     case UserRole.unknown:
  //       context.goNamed(AppRoutes.estatateOnbording);
  //       break;
  //   }
  // }
  void getUserRoleFromString(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case 'landlord':
        return context.goNamed(AppRoutes.dashbord);
      case 'admin':
        return context.goNamed(AppRoutes.dashbord);
      case 'resident':
        return context.goNamed(AppRoutes.dashbord);
      case 'security_personnel':
        return context.goNamed(AppRoutes.securityguide);
      default:
        return context.goNamed(AppRoutes.estatateOnbording);
    }
  }

  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
    required WidgetRef ref,
  }) async {
    updateloginLodaing(false);

    if (password.isEmpty && email.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateloginLodaing(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .logIn(email: email, pass: password, context: context);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateloginLodaing(false);

        if (response["data"]["password_change_required"] == true) {
          showForcePasswordChangeDialog(
            context: context,
            message: response["message"],
            onChangeNow: () {
              final token = response["data"]["access_token"];
              if (token != null) {
                context.pushNamed(
                  AppRoutes.changeTemporarypass,
                  extra: {"token": token},
                );
              }
            },
          );
        } else {
          log("TRUE------->");
          await SharedPrefsService().saveAuthData(response['data']);

          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
          final userData = response['data'] as Map<String, dynamic>?;
          if (userData != null) {
            final user = userData['user'] as Map<String, dynamic>?;
            final firstName = user?['firstname'] as String?;
            if (firstName != null) {
              await SharedPrefsService().saveSingleUserName(firstName);
            }
          }
          final user = response['data']["user"];
          final userRole = user['role'];
          log(userRole.toString());
          getUserRoleFromString(context, userRole.toString());
          // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
          //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
          // context.goNamed(AppRoutes.dashbord);
        }
      } else {
        updateloginLodaing(false);
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response['message'],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateloginLodaing(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: e.message.toString(),
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      updateloginLodaing(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateloginLodaing(false);
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
    updatForgetPaSsLoading(false);

    if (email.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updatForgetPaSsLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .forgetPaSs(email: email, context: context);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        if (isrequst) {
          startResendCountdown();
        }
        updatForgetPaSsLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
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
          icon: Icons.error,
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
          icon: Icons.error,
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
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updatForgetPaSsLoading(false);
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
    updateOtpVerifyLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPForget(email: email, code: state.otp);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateOtpVerifyLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
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
        updateOtpVerifyLoading(false);
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: "Invalid or password or  email!",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateOtpVerifyLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateOtpVerifyLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> requestNewOtp({
    required BuildContext context,
    required String email,

    required WidgetRef ref,
  }) async {
    updateOtpVerifyLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .requestOTPcode(email: email);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        startResendCountdown();
        updateOtpVerifyLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
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
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);
      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateOtpVerifyLoading(false);
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
    updateCreatPassLoading(false);

    if (email.isEmpty && state.otp.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateCreatPassLoading(true);

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
        updateCreatPassLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
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
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      updateCreatPassLoading(false);
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
      updateCreatPassLoading(false);
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
      updateCreatPassLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> changeTemporaryPass({
    required BuildContext context,
    required String token,
    required WidgetRef ref,
  }) async {
    updateChangTemporyPassLoading(false);

    log("START------->");
    updateChangTemporyPassLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .changeTemporaryPass(
            token: token,
            currentPass: state.currentPass ?? "",
            newPassword: state.createNewpass,
            confirmpass: state.confirmNewpass,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateChangTemporyPassLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        final userData = response['data'] as Map<String, dynamic>?;
        if (userData != null) {
          final user = userData['user'] as Map<String, dynamic>?;
          final firstName = user?['firstname'] as String?;
          if (firstName != null) {
            await SharedPrefsService().saveSingleUserName(firstName);
          }
        }
        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pushNamed(AppRoutes.signIN);
      } else {
        log("FALSE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      updateChangTemporyPassLoading(false);
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
      updateChangTemporyPassLoading(false);
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
      updateChangTemporyPassLoading(false);
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
    updateChangProfileInfoLoading(true);
    final token = await ref.watch(accessTokenProvider.future);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserProfiles(
            token: token!,
            gender: gender,
            firstName: firstName,
            lastName: lastName,
            preNotifcation: notifyPre,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateChangProfileInfoLoading(false);

        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(userProfileProvider.notifier).refreshProfile(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        updateChangProfileInfoLoading(false);
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      updateChangProfileInfoLoading(false);

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateChangProfileInfoLoading(false);
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateChangProfileInfoLoading(false);
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
    updateChangProfilePassLoading(true);
    final token = await ref.watch(accessTokenProvider.future);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserpass(
            confirmNewpass: confirmPass,
            newPass: newPassword,
            currentPassword: currentPassword,
            token: token!,
            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateChangProfilePassLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        updateChangProfilePassLoading(false);
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateChangProfilePassLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateChangProfilePassLoading(false);
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateChangProfilePassLoading(false);
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
    updatedeActivatAccountLoading(true);
    final token = await ref.watch(accessTokenProvider.future);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .deactiveAccount(
            reason: reason,
            token: token!,
            currentPassword: currentPassword,

            context: context,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatedeActivatAccountLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(userProfileProvider.notifier).refreshProfile(context, ref);
        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        updatedeActivatAccountLoading(false);
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatedeActivatAccountLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updatedeActivatAccountLoading(false);
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updatedeActivatAccountLoading(false);
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
    updateChangProfilePicLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserProfilespix(file: file, context: context, token: token!);

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateChangProfilePicLoading(false);
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(userProfileProvider.notifier).refreshProfile(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN

        context.pop();
      } else {
        updateChangProfilePicLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateChangProfilePicLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateChangProfilePicLoading(false);
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateChangProfilePicLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateAppNotification({
    required BuildContext context,
    required String key,
    required bool value,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateNotificationSettingLoading(false);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updateNotificationSettings(
            value: value,
            key: key,
            context: context,
            token: token!,
          );

      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateNotificationSettingLoading(false);
        log("TRUE------->");
        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );
        ref
            .read(userNotificationSettinProvider.notifier)
            .refreshSettings(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateNotificationSettingLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      updateNotificationSettingLoading(false);
      if (e.error is SocketException) {
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      updateNotificationSettingLoading(false);
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateNotificationSettingLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateAppPrivacy({
    required BuildContext context,
    required String key,
    required bool value,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updatePrivacyLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updatePrivacySettings(
            value: value,
            key: key,
            context: context,
            token: token!,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatePrivacyLoading(false);
        log("TRUE------->");
        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );
        ref.read(userPrivacyprovider.notifier).refreshSettings(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatePrivacyLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatePrivacyLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        updatePrivacyLoading(false);
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updatePrivacyLoading(false);
      if (!context.mounted) return;
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updatePrivacyLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateAppPrefernce({
    required BuildContext context,
    required String key,
    required String value,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updatePrevencyLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updatePreferencySettings(
            value: value,
            key: key,
            context: context,
            token: token!,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatePrevencyLoading(false);
        log("TRUE------->");

        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );
        ref.read(userPrefrenceprovider.notifier).refreshSettings(context, ref);
        context.pop();

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatePrevencyLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          context.pop();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatePrevencyLoading(false);
      if (!context.mounted) return;
      context.pop();
      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      updatePrevencyLoading(false);
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updatePrevencyLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateNotificationRead({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updateuserNotificationRead(context: context, token: token!);
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        log("TRUE------->");

        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );
        ref.read(userPrefrenceprovider.notifier).refreshSettings(context, ref);
        context.pop();

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          context.pop();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      if (!context.mounted) return;
      context.pop();
      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> createReport({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateReportLoading(true);

    try {
      final reportState = ref.watch(reportProvider);
      final reportStatess = ref.watch(reportProvider.notifier);
      final report = reportState.report;
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .createViolation(
            context: context,
            token: token!,
            categoryID: report.categoryID ?? "",
            estateaddressID: report.addressId ?? "",
            des: report.description,
            location: report.category ?? "",
            isAnonymouse: report.isAnonymous,
            priority: "High",
            evidence1: File(report.imagePaths[0] ?? ""),
            evidence2: File(report.imagePaths[1] ?? ""),
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateReportLoading(false);
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        reportStatess.resetState();
        ref.read(userPrefrenceprovider.notifier).refreshSettings(context, ref);
        context.pop();

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateReportLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          reportStatess.resetState();
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          reportStatess.resetState();
          context.pop();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateReportLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();
      context.pop();
      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateReportLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      updateReportLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> makeACommentonReport({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateCommentLoading(true);

    try {
      final reportState = ref.watch(reportProvider);
      final reportStatess = ref.watch(reportProvider.notifier);
      final report = reportState.report;
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .makeACommentonReport(
            token: token!,
            comment: report.comment ?? "",
            isInternal: report.isCommentInternal ?? false,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateCommentLoading(false);
        log("TRUE------->");

        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );
        reportStatess.resetState();
        ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateCommentLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          reportStatess.resetState();
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          reportStatess.resetState();
          //  final error = response['errors']?['comment']?.first;

          showCustomSuccessToast(
            context: context,
            message: response["data"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateCommentLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateCommentLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      updateCommentLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> generateOtpWithValidity({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updatedeGenerateOtpLoading(true);

    try {
      final visitor = ref.read(generateNotifierProvider);
      final visitors = ref.read(generateNotifierProvider.notifier);

      final token = await ref.watch(accessTokenProvider.future);
      int visitperiod = int.parse(
        RegExp(r'\d+').stringMatch(visitor.visitperiod ?? "")!,
      );

      final response = await ref
          .read(profileRepositoryProvider)
          .generateOtpWithValidity(
            visitorName: visitor.vistorName,
            visitorPurpos: visitor.purposeofVisit,
            validityHours: visitperiod,
            securityclearancelevel: "standard",
            vehiclenumber: visitor.vehiclenumber,
            phoneNumber: visitor.phoneNumber,
            token: token!,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatedeGenerateOtpLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        final otpCode = response["data"]?["otp"]?["otp_code"];
        if (otpCode != null) {
          String title = "Your visitor access code: ";
          String shareContent = "Here's your vistor access $otpCode:";
          context.pushNamed(
            AppRoutes.vendorAccessCode,
            extra: {
              'title': title,
              "code": otpCode,
              'share': shareContent, // Add new field
            },
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder:
          //         (context) => GetYourCodeScreen(
          //           title: "Your visitor access code: ",
          //           accessCode: otpCode,
          //           share: "Here's your vistor access $otpCode:",
          //         ),
          //   ),
          // );
          log("OTP Code: $otpCode");
        } else {
          log("OTP not found in response");
        }

        visitors.resetState();
        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatedeGenerateOtpLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          visitors.resetState();
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          visitors.resetState();
          //  final error = response['errors']?['comment']?.first;

          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatedeGenerateOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updatedeGenerateOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      updatedeGenerateOtpLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> scheduleOtpWithValidation({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updatedeSchedulOtpLoading(true);

    try {
      final visitor = ref.read(generateNotifierProvider);
      final visitors = ref.read(generateNotifierProvider.notifier);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .scheduleOtpWithValidation(
            visitorName: visitor.vistorName,
            visitorPurpos: visitor.purposeofVisit,
            validatorHour: visitor.selectedTime?.hourOfPeriod ?? 0,
            validatTime: visitor.selectedDate.toString(),
            vehicleNumber: visitor.vehiclenumber,
            phoneNumber: visitor.phoneNumber,
            token: token!,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatedeSchedulOtpLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        final otpCode = response["data"]?["otp"]?["otp_code"];
        if (otpCode != null) {
          String title = "Your visitor access code: ";
          String shareContent = "Here's your vistor access $otpCode:";
          context.pushNamed(
            AppRoutes.vendorAccessCode,
            extra: {
              'title': title,
              "code": otpCode,
              'share': shareContent, // Add new field
            },
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder:
          //         (context) => GetYourCodeScreen(
          //           title: "Your visitor access code: ",
          //           accessCode: otpCode,
          //           share: "Here's your vistor access $otpCode:",
          //         ),
          //   ),
          // );
          log("OTP Code: $otpCode");
        } else {
          log("OTP not found in response");
        }

        visitors.resetState();
        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatedeSchedulOtpLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          visitors.resetState();
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          visitors.resetState();
          //  final error = response['errors']?['comment']?.first;

          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatedeSchedulOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updatedeSchedulOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      updatedeSchedulOtpLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> revorkActiveOTP({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updatedeRevorkOtpLoading(true);

    try {
      final visitor = ref.read(generateNotifierProvider);
      final visitors = ref.read(generateNotifierProvider.notifier);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .revoActiveOtp(
            token: token ?? "",
            reason: visitor.revorkActiveOTP ?? "",
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updatedeRevorkOtpLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        // context.pop();

        visitors.resetState();
        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatedeRevorkOtpLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          visitors.resetState();
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          visitors.resetState();
          //  final error = response['errors']?['comment']?.first;

          showCustomSuccessToast(
            context: context,
            message: response['data']['otp_id']?.first ?? 'Unknown error',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updatedeSchedulOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updatedeRevorkOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      updatedeRevorkOtpLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> generateMemberIDForStat({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .generateMemberIDForStart(token: token ?? "", context: context);
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateGenrateMemberIdLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        context.pushNamed(AppRoutes.digitalIDMember);
        // context.pop();

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;

          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateGenrateMemberIdLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> reGenerateMemberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .reGenerateMemberDigiterId(
            token: token ?? "",
            reason: state.digiterReason ?? "",
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        context.pop();

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          resteRasion();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> deActivememberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .deActiveMemberDigiterID(
            token: token ?? "",
            reason: state.digiterReason ?? "",
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          resteRasion();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> reActivememberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .reActiveMemberDigiterID(token: token ?? "", context: context);
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        context.pop();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          resteRasion();
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

      if (e.error is SocketException) {
        log(e.error.toString());
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
      log(e.toString());
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      resteRasion();
      updateGenrateMemberIdLoading(false);
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
