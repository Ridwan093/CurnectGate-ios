// features/member_management/provider/form_provider.dart
// ignore_for_file: unused_result

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/config/biometric_faceID/Helper/biometric_signature_helper.dart';
import 'package:curnectgate/core/config/biometric_faceID/Helper/device_info_helper.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart'
    as authState;
import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/auth/data/auth_model/OnboardingProgressManager.dart';
import 'package:curnectgate/features/auth/data/auth_model/onbording_enum.dart';
import 'package:curnectgate/features/auth/widget/tmporarypassword_dialog.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/provider/chat_local_repository_provider.dart';
import 'package:curnectgate/features/chat/data/provider/chat_messages_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/candidate_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/afterImage_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/getWorkOdder_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/state_model/general_state.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/CurfewProvider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getHouseHold_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getPermission_status_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getpermissionStatic_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/multi_select_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/permission_loading_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/digitalD_status.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/getDigitalIDProvider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/validator/password_validator.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/EventCode_provider/getlistofEventCode_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getCalender_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/going_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notification_Count_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/reminder_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/comment_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/payment/provider/dashbord_provider.dart';
import 'package:curnectgate/features/payment/provider/payment_History_provider.dart';
import 'package:curnectgate/features/security/provider/dismiss_provider.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/provider/investigation_provider.dart';
import 'package:curnectgate/features/security/provider/resolved_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Login_setting/state/biometric_provider.dart';
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
      case "emergency_contact_name":
        state = state.copyWith(
          emenergencyNameValid: isValid,
          phoneError: errorMessage,
        );
      case "emergency_contact_phone":
        state = state.copyWith(
          emergencyContactValid: isValid,
          phoneError: errorMessage,
        );
      case "years_of_experience":
        state = state.copyWith(
          yearofExpirenceValid: isValid,
          lastNameError: errorMessage,
        );
      case "desgination":
        state = state.copyWith(
          desginationValid: isValid,
          lastNameError: errorMessage,
        );
      case "rental_frequency":
        state = state.copyWith(
          rentalfrequencyValid: isValid,
          lastNameError: errorMessage,
        );
      case "security_deposit":
        state = state.copyWith(
          securityFeesValid: isValid,
          lastNameError: errorMessage,
        );
      case "agent_fee":
        state = state.copyWith(
          agentFeeValid: isValid,
          lastNameError: errorMessage,
        );
      case "occupation":
        state = state.copyWith(
          ocupationValid: isValid,
          lastNameError: errorMessage,
        );
      case "employer":
        state = state.copyWith(
          employerValid: isValid,
          lastNameError: errorMessage,
        );
      case "monthly_income":
        state = state.copyWith(
          montlyIconValid: isValid,
          lastNameError: errorMessage,
        );
    }
  }

  void updateMonthlyIcom(String value) {
    state = state.copyWith(
      montlyIconValid: value.isNotEmpty,
      montlyIcom: value,
    );
  }

  void updateEmergencyRole(String value) {
    state = state.copyWith(
      emenergencyRoleValid: value.isNotEmpty,
      emenergencyRole: value,
    );
  }

  void updateOcupation(String value) {
    state = state.copyWith(ocupationValid: value.isNotEmpty, ocupation: value);
  }

  void updateEmplyer(String value) {
    state = state.copyWith(employerValid: value.isNotEmpty, employer: value);
  }

  void updateRentFrequency(String value) {
    state = state.copyWith(
      rentalfrequencyValid: value.isNotEmpty,
      rentalfrequency: value,
    );
  }

  void updateAgentFees(String value) {
    state = state.copyWith(agentFeeValid: value.isNotEmpty, agentFee: value);
  }

  void updateSecurityFees(String value) {
    state = state.copyWith(
      securityFeesValid: value.isNotEmpty,
      securityFees: value,
    );
  }

  void updateGender(String? gender) {
    state = state.copyWith(gender: gender);
  }

  void updateyearExperece(String? value) {
    state = state.copyWith(
      yearofExperecnandeducation: value,
      yearofExpirenceValid: value?.isNotEmpty,
    );
  }

  void updateEducationLevel(String? value) {
    state = state.copyWith(
      educationLevel: value,
      educationlevelValid: value?.isNotEmpty,
    );
  }

  void updatemutle(String key, List<String>? value) {
    switch (key) {
      case 'Specializations':
        updateSpecializations(value);
        break;
      case 'Certifications':
        updateCertifications(value);
        break;
      default:
        // Optionally handle unknown keys
        break;
    }
  }

  void updateSpecializations(List<String>? value) {
    log(value.toString());
    state = state.copyWith(
      specializations: value,
      specializeValid: value?.isNotEmpty,
    );
  }

  void updateCertifications(List<String>? value) {
    log(value.toString());
    state = state.copyWith(
      certifications: value,
      certificatteValid: value?.isNotEmpty,
    );
  }

  void updatestartDate(String? value) {
    state = state.copyWith(startdate: value, timeStateValid: value?.isNotEmpty);
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
    state = state.copyWith(chattingLoading: isLoading);
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

  void updateAddHouseHoldLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(addHouseHoldLoading: isLoading);
  }

  void updateGranFacilityPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(facilityLoading: isLoading);
  }

  void updateGrantCurfewPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(curfewLoading: isLoading);
  }

  void updateGrantGatePermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(gateAccessLoading: isLoading);
  }

  void updateGrantCommunityPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(communityAccessLoading: isLoading);
  }

  void updateGrantNightPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(nightAccessLoading: isLoading);
  }

  void updateGrantParkingPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(parkingAccessLoading: isLoading);
  }

  void updateGrantVisitorPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(visitorAccessLoading: isLoading);
  }

  void updateBasicPermissionLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(basicPermissionLoading: isLoading);
  }

  void updateRemovedHouseHoldLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(removedHouseHoldLoading: isLoading);
  }

  void updateWorkderLoading(bool isLoading) {
    ///loading state if (optioner)
    log(isLoading.toString());
    state = state.copyWith(workOderLoading: isLoading);
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

  void updateRestrictionValue(bool value) {
    state = state.copyWith(restrictionValue: value);
  }

  void updateRestrictionReason(String value) {
    state = state.copyWith(restrictionReasion: value);
  }

  void updateRestrictionHours(String value) {
    state = state.copyWith(restrictionHours: value);
  }

  void updateRestrictiondays(String value) {
    state = state.copyWith(restrictionDays: value);
  }

  void resteRasion() {
    state = state.copyWith(digiterReason: "");
  }

  void setProperty(String property, String properyID) {
    state = state.copyWith(property: property, propertyId: properyID);
  }

  void restaddMemberFillds() {
    state = state.copyWith(
      firstNameError: "",
      firstNameValid: false,
      lastNameError: "",
      lastNameValid: false,
      emailError: "",
      emailValid: false,
      phoneError: '',
      phoneValid: false,
      emenergencyNameValid: false,
      emergencyContactValid: false,
      yearofExpirenceValid: false,
      desginationValid: false,
      educationlevelValid: false,
      specializeValid: false,
      certificatteValid: false,
      timeStateValid: false,
      yearofExperecnandeducation: "",
      educationLevel: '',
      certifications: null,
      startdate: '',
      specializations: null,
      ocupation: "",
      ocupationValid: false,
      property: "",
      propertyId: "",
      emenergencyRoleValid: false,
      montlyIconValid: false,
      employerValid: false,
      rentalfrequencyValid: false,
      agentFeeValid: false,
      securityFeesValid: false,
      workOderLoading: false,
      emenergencyRole: "",
      montlyIcom: "",
      employer: "",
      agentFee: "",
      securityFees: "",
      rentalfrequency: "",
    );
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

  void updateTermsAndPropertyLoading(bool value) {
    state = state.copyWith(termsAndCondintionLoading: value);
  }

  void updateChatingLoading(bool value) {
    state = state.copyWith(chattingLoading: value);
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
            gender: state.gender ?? "",
            identityConfirmed: true,
            agreetoterms: state.agreedToTerms,
            password: state.pass ?? "",
          );

      if (response['status'] == true) {
        if (context.mounted) {
          // log(response['data'].toString());
          updateCreatPassLoading(false);
          if (email.isNotEmpty) {
            await DeviceInfoHelper.saveUserEmail(email);
          }
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
          await OnboardingProgressManager.saveStep(OnboardingStep.otp);
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
    final emails = await BiometricSignatureHelper.getStoredEmail();
    if (email.isEmpty && state.otp.isEmpty && emails!.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPcode(
            email: email.isEmpty ? emails : email,
            code: state.otp,
            context: context,
          );

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
        await OnboardingProgressManager.clearProgress();

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
    final isBiometricEnabled = ref.read(biometricPrefProvider.notifier);
    final prefs = SharedPrefsService();
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
          final isRegistered = await registerToken(context: context, ref: ref);

          if (isRegistered) {
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
              log("UserLoging Token: ${userData["access_token"]}");
              prefs.saveUserToken(userData["access_token"]);
              final user = userData['user'] as Map<String, dynamic>?;
              final firstName = user?['firstname'] as String?;
              final lastName = user!["lastname"] as String?;
              final email = user["email"] as String?;
              final medUrl = user["media_url"] as String?;
              ref.read(authState.authProvider.notifier).loadAuthData();

              if (medUrl != null) {
                await SharedPrefsService().saveMedialUrl(medUrl);
                ref.read(profilePicProvider.notifier).refreshProfilePic();
                ref.read(profilePicProvider.notifier).loadProfilePic();
              }
              if (firstName != null) {
                await SharedPrefsService().saveSingleUserName(firstName);
                await SharedPrefsService().saveFullName(
                  "${firstName} ${lastName}",
                );
                ref.read(authState.authProvider.notifier).loadfullName();
              }

              if (email != null) {
                await DeviceInfoHelper.saveUserEmail(email);
              }
            }

            final user = response['data']["user"];
            final userRole = user['role'];
            final biometricenabled = user["biometric_enabled"];

            if (biometricenabled) {
              await DeviceInfoHelper.saveFirstTimeCheck(false);
              isBiometricEnabled.toggleBiometric(true);
            } else {
              await DeviceInfoHelper.saveFirstTimeCheck(true);
              isBiometricEnabled.toggleBiometric(false);
            }
            log(userRole.toString());
            getUserRoleFromString(context, userRole.toString());
            // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
            //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
            // context.goNamed(AppRoutes.dashbord);
          } else {
            showCustomSuccessToast(
              context: context,
              message: "Error Somthing wrong",
              color: AppColors.instance.error500,
              icon: Icons.error,
              iconColors: AppColors.instance.grey200,
              positionNumber: 70,
            );
          }
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

  Future<bool> registerToken({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    log("🚀 START registerToken()");

    try {
      final data = await DeviceInfoHelper.deviceInfo();

      final response = await ref
          .read(profileRepositoryProvider)
          .registerDeviceTokens(requestData: data, context: context);

      if (!context.mounted) return false;

      if (response["status"] == true) {
        log("✅ Token registered successfully");
        return true; // ✅ registered
      } else {
        final message = response["message"] ?? "Token not registered yet.";
        log("❌ Register Token failed: $message");

        _handleLoginError(context, ref, message);
        return false; // ❌ not registered
      }
    } on DioException catch (e) {
      log("🌐 DIO ERROR: $e");
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred.",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      return false;
    } catch (e) {
      log("💥 Unexpected ERROR: $e");
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      return false;
    } finally {
      updateloginLodaing(false);
      log("🏁 END registerToken()");
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
    final emails = await BiometricSignatureHelper.getStoredEmail();
    if (email.isEmpty && emails!.isEmpty) {
      log("empty");
      return;
    }
    log("START------->");
    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .requestOTPcode(email: email.isEmpty ? emails : email);

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
        final data = response["data"];

        final fullName = data["full_name"].toString();
        await SharedPrefsService().saveFullName(fullName);
        log(fullName);
        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        ref.read(userProfileProvider.notifier).refreshProfile(context, ref);
        context.pop();
      } else {
        updateChangProfileInfoLoading(false);
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
        final profileFile = ref.read(profilePicProvider.notifier);
        final data = response["data"];
        final url = data["media_url"] as String?;

        if (url != null) {
          await SharedPrefsService().saveMedialUrl(url);
          profileFile.refreshProfilePic();
        }

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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
    required String slug,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateNotificationSettingLoading(false);
    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);

    notifiers.setLoading(true);
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

        notifiers.setLoading(false);
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
        notifiers.setLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
      notifiers.setLoading(false);
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
      notifiers.setLoading(false);
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
      notifiers.setLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateAppPrivacy({
    required BuildContext context,
    required String key,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
    log("START------->");
    updatePrivacyLoading(true);
    updateNotificationSettingLoading(false);
    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
    notifiers.setLoading(true);
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
        notifiers.setLoading(false);
        log("TRUE------->");

        ref.read(userPrivacyprovider.notifier).refreshSettings(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updatePrivacyLoading(false);
        notifiers.setLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
      notifiers.setLoading(false);
      if (!context.mounted) return;

      if (e.error is SocketException) {
        updatePrivacyLoading(false);
        notifiers.setLoading(false);
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
      notifiers.setLoading(false);
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
      notifiers.setLoading(false);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
        ref.read(getNotificationCount.notifier).refreshCount(context, ref);
        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
            priority: "high",
            evidence1:
                report.imagePaths[0] != null
                    ? File(report.imagePaths[0]!)
                    : File(''),
            evidence2:
                report.imagePaths[1] != null
                    ? File(report.imagePaths[1]!)
                    : File(''),
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
        ref.read(userReportProvider.notifier).refreshReports(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
    required String id,
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
            id: id,
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          String title = "Your visitor access code:";
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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

  Future<void> revorkWorkOder({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final state = ref.read(workOrderFormProvider.notifier);

      state.setLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .revoWorkOder(token: token ?? "", id: id, context: context);
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        state.setLoading(false);
        ref.read(workOrderProvider.notifier).refreshWorkOrders(context, ref);
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

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        state.setLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          state.setLoading(false);
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
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
      final state = ref.read(workOrderFormProvider.notifier);
      state.setLoading(false);

      if (!context.mounted) return;

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
      final state = ref.read(workOrderFormProvider.notifier);
      state.setLoading(false);
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
      final state = ref.read(workOrderFormProvider.notifier);
      state.setLoading(false);
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
        ref.refresh(digitalIdStatusProvider);

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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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

  Future<void> addHouseHoold({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateAddHouseHoldLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addHouseHold(
            token: token ?? "",
            firstname: firstname,
            lastname: lastname,
            email: email,
            phonenumber: phonenumber,
            propertyId: propertyId,
            role: role,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        restaddMemberFillds();
        updateAddHouseHoldLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        context.goNamed(AppRoutes.getMemberInfo);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateAddHouseHoldLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          restaddMemberFillds();
          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
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
      restaddMemberFillds();
      updateAddHouseHoldLoading(false);
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
      restaddMemberFillds();
      updateAddHouseHoldLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> removedHouseHoold({
    required BuildContext context,

    required int id,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateRemovedHouseHoldLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .removedHouseHold(token: token ?? "", id: id, context: context);
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        resteRasion();
        updateRemovedHouseHoldLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);
        context.pop();

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        updateRemovedHouseHoldLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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
      updateRemovedHouseHoldLoading(false);
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
      updateRemovedHouseHoldLoading(false);
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
      updateRemovedHouseHoldLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> addHousepropertyManager({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,
    required String desgination,

    required String emergencycontactname,
    required String emergencycontactphone,

    required List<String> specializations,
    required List<String> certifications,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateAddHouseHoldLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addHousepropertymanagement(
            specializations: specializations,
            certifications: certifications,
            educationlevel: state.educationLevel ?? "",
            emergencycontactname: emergencycontactname,
            emergencycontactphone: emergencycontactphone,
            yearsofexperience: state.yearofExperecnandeducation ?? "",
            startDate: state.startdate ?? "",
            desgination: desgination,
            token: token ?? "",
            firstname: firstname,
            lastname: lastname,
            email: email,
            phonenumber: phonenumber,
            propertyId: propertyId,
            role: role,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateAddHouseHoldLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        context.goNamed(AppRoutes.getMemberInfo);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      } else {
        updateAddHouseHoldLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          restaddMemberFillds();
          ref.read(multiSelectProvider('Certifications').notifier).clearAll();
          ref.read(multiSelectProvider('Specializations').notifier).clearAll();
          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();

      if (!context.mounted) return;

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
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);

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
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> addHouseTenant({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,

    required String emergencycontactname,
    required String emergencycontactphone,

    required WidgetRef ref,
  }) async {
    log("START------->");
    updateAddHouseHoldLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addtenant(
            educationlevel: state.educationLevel ?? "",
            emergencycontactname: emergencycontactname,
            emergencycontactphone: emergencycontactphone,

            startDate: state.startdate ?? "",

            token: token ?? "",
            firstname: firstname,
            lastname: lastname,
            email: email,
            phonenumber: phonenumber,
            propertyId: propertyId,
            role: role,
            context: context,
            rentfrequency: state.rentalfrequency?.toLowerCase() ?? "",
            status: 'Active',
            agentFees: int.parse(state.agentFee ?? ""),
            securitydeposit: int.parse(state.securityFees ?? ""),
            emergencyContactrelationshipRole: state.emenergencyRole ?? "",
            employee: state.employer ?? "",
            occupation: state.ocupation ?? "",
            monthlyincome: int.parse(state.montlyIcom ?? ""),
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateAddHouseHoldLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        context.goNamed(AppRoutes.getMemberInfo);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);

        // ref.read(commentProvider.notifier).refreshComment(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      } else {
        updateAddHouseHoldLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          restaddMemberFillds();
          ref.read(multiSelectProvider('Certifications').notifier).clearAll();
          ref.read(multiSelectProvider('Specializations').notifier).clearAll();
          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();

      if (!context.mounted) return;

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
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);

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
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }
  // String getS(String d, WidgetRef ref, String function toTitle) {
  //     final state = ref.watch(notificationProviders);
  //   final t = state.startTimes[toTitle(d)];
  //   if (t == null) return "00:00";
  //   return "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";
  // }

  // String getE(String d) {
  //   final t = state.endTimes[toTitle(d)];
  //   if (t == null) return "00:00";
  //   return "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";
  // }
  String formatTime(TimeOfDay? t) {
    if (t == null) return "00:00";
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }

  Future<void> setCurfew({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGranFacilityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isFacilityEnabled = state.isCurfewEnabled;

      String toTitle(String d) =>
          "${d[0].toUpperCase()}${d.substring(1).toLowerCase()}";

      String getStart(String d) => formatTime(state.startTimes[toTitle(d)]);
      String getEnd(String d) => formatTime(state.endTimes[toTitle(d)]);

      final response = await ref
          .read(profileRepositoryProvider)
          .setCofew(
            token: token!,
            mondaystart: getStart('monday'),
            mondayEnd: getEnd('monday'),
            tusdayStart: getStart('tuesday'),
            tusdayEnd: getEnd('tuesday'),
            wednesdaystart: getStart('wednesday'),
            wednesdayEnd: getEnd('wednesday'),
            thursdayStart: getStart('thursday'),
            thursdayEnd: getEnd('thursday'),
            fridayStart: getStart('friday'),
            fridayEnd: getEnd('friday'),
            saturdayStart: getStart('saturday'),
            saturdayEnd: getEnd('saturday'),
            sundayStart: getStart('sunday'),
            sundayEnd: getEnd('sunday'),
            id: id,
            isEnabale: isFacilityEnabled ?? false,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateGranFacilityPermissionLoading(false);
        notifier.resetForm();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref
            .read(getCurfewSettingProvider.notifier)
            .refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGranFacilityPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
          notifier.resetForm();
        } else {
          notifier.resetForm();
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGranFacilityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGranFacilityPermissionLoading(false);

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
      updateGranFacilityPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setFacilityPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGranFacilityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isFacilityEnabled = state.isFacilityEnabled;
      final facilities = state.facilityConditions?.facilities;
      final reason = state.facilityReason;

      final tr = state.facilityConditions?.timeRestrictions ?? {};
      String getS(String d) => tr[d]?.startTime ?? '00:00';
      String getE(String d) => tr[d]?.endTime ?? '00:00';
      final response = await ref
          .read(profileRepositoryProvider)
          .grantFacilitieAccess(
            reason: reason ?? '',
            token: token!,
            mondaystart: getS('monday'),
            mondayEnd: getE('monday'),
            tusdayStart: getS('tuesday'),
            tusdayEnd: getE('tuesday'),
            wednesdaystart: getS('wednesday'),
            wednesdayEnd: getE('wednesday'),
            thursdayStart: getS('thursday'),
            thursdayEnd: getE('thursday'),
            fridayStart: getS('friday'),
            fridayEnd: getE('friday'),
            saturdayStart: getS('saturday'),
            saturdayEnd: getE('saturday'),
            sundayStart: getS('sunday'),
            sundayEnd: getE('sunday'),

            id: id,

            permissionSlug: "facility_access",
            isEnabale: isFacilityEnabled ?? false,
            facilities: facilities ?? [],
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateGranFacilityPermissionLoading(false);
        notifier.resetForm();
        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGranFacilityPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
          notifier.resetForm();
        } else {
          notifier.resetForm();
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGranFacilityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGranFacilityPermissionLoading(false);

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
      updateGranFacilityPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setGatePermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGrantGatePermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isGateEnabled = state.isGateEnabled;
      final expired = state.expiredDay;
      final reason = state.gateReason;

      final tr = state.gateConditions?.timeRestrictions ?? {};
      String getS(String d) => tr[d]?.startTime ?? '00:00';
      String getE(String d) => tr[d]?.endTime ?? '00:00';
      final response = await ref
          .read(profileRepositoryProvider)
          .grantGateAccess(
            reason: reason ?? '',
            token: token!,
            mondaystart: getS('monday'),
            mondayEnd: getE('monday'),
            tusdayStart: getS('tuesday'),
            tusdayEnd: getE('tuesday'),
            wednesdaystart: getS('wednesday'),
            wednesdayEnd: getE('wednesday'),
            thursdayStart: getS('thursday'),
            thursdayEnd: getE('thursday'),
            fridayStart: getS('friday'),
            fridayEnd: getE('friday'),
            saturdayStart: getS('saturday'),
            saturdayEnd: getE('saturday'),
            sundayStart: getS('sunday'),
            sundayEnd: getE('sunday'),

            id: id,

            expiredDay: int.parse(expired),
            isEnabale: isGateEnabled ?? false,

            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantGatePermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGrantGatePermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantGatePermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantGatePermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantGatePermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setvisitorPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGrantVisitorPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isGateEnabled = state.enableVisitorInvitation;
      bool? requiredApproval = state.requiresApproval;
      final max = state.maxVisitorsPerDay;

      final reason = state.visitorReason;

      final response = await ref
          .read(profileRepositoryProvider)
          .grantvisitorAccess(
            id: id,
            isEnabale: isGateEnabled,
            token: token ?? "",
            requiredApproval: requiredApproval,
            reason: reason ?? "",
            maxvisitorsperday: max,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantVisitorPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGrantVisitorPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantVisitorPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantVisitorPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantVisitorPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setcommnunityForumPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGrantCommunityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? iscommunityEnabled = state.isCommunityEnabel;
      bool? moderated = state.moderated;
      final max = state.totalComment;
      final max2 = state.totalPost;

      final reason = state.otherReason;

      final response = await ref
          .read(profileRepositoryProvider)
          .communityforum(
            id: id,
            isEnabale: iscommunityEnabled ?? false,
            token: token ?? "",
            moderated: moderated ?? false,
            reason: reason ?? "",
            commentLimit: max ?? 0,
            postLimit: max2 ?? 0,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantCommunityPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGrantCommunityPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantCommunityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantCommunityPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantCommunityPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setNightAccesspermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGrantNightPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isNigteEnabled = state.isNightEnable;
      final reason = state.otherReason;
      final response = await ref
          .read(profileRepositoryProvider)
          .nightAccess(
            id: id,
            isEnabale: isNigteEnabled ?? false,
            token: token ?? "",
            reason: reason ?? "",
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantNightPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGrantNightPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantNightPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantNightPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantNightPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setPackAccess({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGrantParkingPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders); // WATCH not READ!
      final notifier = ref.read(notificationProviders.notifier);
      bool? isGateEnabled = state.ispackingEnabled;

      final reason = state.otherReason;

      final response = await ref
          .read(profileRepositoryProvider)
          .packAccess(
            id: id,
            isEnabale: isGateEnabled ?? false,
            token: token ?? "",

            reason: reason ?? "",

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantParkingPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateGrantParkingPermissionLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantParkingPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantParkingPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantParkingPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> setbasicePermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
    required String slug,
    required bool value,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
      notifiers.setLoading(true);
      final token = await ref.watch(accessTokenProvider.future);

      final notifier = ref.read(notificationProviders.notifier);

      final response = await ref
          .read(profileRepositoryProvider)
          .grantpermission(
            token: token ?? "",
            permissionslug: slug,
            isEnabale: value,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();

        notifiers.setLoading(false);

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
            .read(permissionStatusProvider.notifier)
            .refreshPermissionstatus(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();

        notifiers.setLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);

      notifiers.setLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
      notifier.resetForm();
      notifiers.setLoading(false);

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
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
      notifiers.setLoading(false);
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateBasicPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> landlordRestrictions({
    required BuildContext context,
    required int id,
    required WidgetRef ref,

    required bool value,
  }) async {
    log("START------->");

    updateBasicPermissionLoading(true);

    try {
      // final notifiers = ref.read(permissionLoadingProvider(slug).notifier);

      final token = await ref.watch(accessTokenProvider.future);

      final notifier = ref.read(notificationProviders.notifier);

      final response = await ref
          .read(profileRepositoryProvider)
          .landLoardRestriction(
            token: token ?? "",
            reason: state.restrictionReasion ?? "",
            isEnabale: value,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref
            .read(permissionStatusProvider.notifier)
            .refreshPermissionstatus(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      updateBasicPermissionLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);

      notifier.resetForm();

      updateBasicPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateBasicPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> landlordRemoveRestrictions({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");

    updateBasicPermissionLoading(true);

    try {
      // final notifiers = ref.read(permissionLoadingProvider(slug).notifier);

      final token = await ref.watch(accessTokenProvider.future);

      final notifier = ref.read(notificationProviders.notifier);
      final response = await ref
          .read(profileRepositoryProvider)
          .landLoardRemoveRestriction(
            token: token ?? "",

            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        log("TRUE------->");

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref
            .read(permissionStatusProvider.notifier)
            .refreshPermissionstatus(context, ref);

        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
      } else {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      updateBasicPermissionLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();
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
      final notifier = ref.read(notificationProviders.notifier);

      notifier.resetForm();

      updateBasicPermissionLoading(false);

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
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateBasicPermissionLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  ///SECURITY METHOD

  String accessType(String value) {
    switch (value.toLowerCase()) {
      case "gate entry":
        return "gate_entry";
      case "gate exit":
        return "gate_exit";
      case "facility access":
        return "facility_access";
      case "checkin":
        return "checkin";
      case "checkout":
        return "checkout";

      default:
        return "gate_entry";
    }
  }

  Future<void> scanQRCode({
    required BuildContext context,
    required String qrCodeData,
    required String accessTypes,
    required String location,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .validateDigitaIDbyQRCord(
            token: token ?? "",

            qrCodeData: qrCodeData,
            accessType: accessType(accessTypes),
            location: location,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        context.pop();
        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);
        // Log the specific fields you want
        debugPrint('📋 USER DETAILS LOG:');
        debugPrint('─────────────────────────────────────────');
        debugPrint('📸 Media URL: ${userData['media_url'] ?? "N/A"}');
        debugPrint('👤 Role: ${userData['role'] ?? "N/A"}');
        debugPrint('👤 First Name: ${userData['firstname'] ?? "N/A"}');
        debugPrint('👤 Last Name: ${userData['lastname'] ?? "N/A"}');

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: userData['estate_name'] ?? "N/A",
          ref: ref,
          bottom: BottomSheetView.digitalIdConfirm,
          digital_id_code: qrCodeData,
          access_type: accessType(accessTypes),
          location: location,
          additional_notes: "",
          device_id: "",
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> validateDigitalOTP({
    required BuildContext context,
    required String qrCodeData,
    required String accessTypes,
    required String location,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .validateDigitaIDCode(
            token: token ?? "",
            additionalNote: "",
            device_id: "",
            qrCodeData: qrCodeData,
            accessType: accessType(accessTypes),
            location: location,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);
        // Log the specific fields you want
        debugPrint('📋 USER DETAILS LOG:');
        debugPrint('─────────────────────────────────────────');
        debugPrint('📸 Media URL: ${userData['media_url'] ?? "N/A"}');
        debugPrint('👤 Role: ${userData['role'] ?? "N/A"}');
        debugPrint('👤 First Name: ${userData['firstname'] ?? "N/A"}');
        debugPrint('👤 Last Name: ${userData['lastname'] ?? "N/A"}');

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        context.pop();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: userData['estate_name'] ?? "N/A",
          ref: ref,
          bottom: BottomSheetView.digitalIdConfirm,
          digital_id_code: qrCodeData,
          access_type: accessType(accessTypes),
          location: location,
          additional_notes: "",
          device_id: "",
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();

          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> digitalIDApproveDeny({
    required BuildContext context,
    required String qrCodeData,
    required String accessTypes,
    required String location,
    required WidgetRef ref,
    required String approveType,
    required String denial_reason,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .approvedDigitaIDCode(
            denial_reason: denial_reason,
            approveType: approveType,
            token: token ?? "",
            additionalNote: "",
            device_id: "",
            qrCodeData: qrCodeData,
            accessType: accessType(accessTypes),
            location: location,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response['data']['user'];
        context.pop();
        final String jsonString = json.encode(userData);
        // Log the specific fields you want
        debugPrint('📋 USER DETAILS LOG:');
        debugPrint('─────────────────────────────────────────');
        debugPrint('📸 Media URL: ${userData['media_url'] ?? "N/A"}');
        debugPrint('👤 Role: ${userData['role'] ?? "N/A"}');
        debugPrint('👤 First Name: ${userData['firstname'] ?? "N/A"}');
        debugPrint('👤 Last Name: ${userData['lastname'] ?? "N/A"}');

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        if (approveType.contains("deny-access")) {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: userData['estate_name'] ?? "N/A",
            ref: ref,
            bottom: BottomSheetView.digitalIdDenymessage,
          );
        } else {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: userData['estate_name'] ?? "N/A",
            ref: ref,
            bottom: BottomSheetView.digitalIDaprovedMessage,
          );
        }
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();

          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> checkOutOTP({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .checkOutOtp(
            token: token ?? "",
            otpCode: otpCode,
            context: context,
            securityNote: securityNoted,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response;

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.acceptCheckOut,
        );

        // showUserBottomSheet(
        //   id: id,
        //   context: context,
        //   headertitle: jsonString,
        //   headersubtitle: jsonStringdata,
        //   ref: ref,
        //   bottom: BottomSheetView.confirmEntry,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> checkOutOTPwithPermit({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .checkOutOtpwithPermit(
            token: token ?? "",
            otpCode: otpCode,
            context: context,
            securityNote: securityNoted,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response;

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.checkOutWithpermitConfirm,
        );

        // showUserBottomSheet(
        //   id: id,
        //   context: context,
        //   headertitle: jsonString,
        //   headersubtitle: jsonStringdata,
        //   ref: ref,
        //   bottom: BottomSheetView.confirmEntry,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> chekinOtp({
    required BuildContext context,
    required String otpCode,
    required String securityNote,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .checkInOtp(
            token: token ?? "",
            otpCode: otpCode,
            securityNote: securityNote,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> workOrderCheckOut({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .workersCheckOutOtp(
            token: token ?? "",
            otpCode: otpCode,
            context: context,
            securityNote: securityNoted,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.acceptCheckOut,
        );

        // showUserBottomSheet(
        //   id: id,
        //   context: context,
        //   headertitle: jsonString,
        //   headersubtitle: jsonStringdata,
        //   ref: ref,
        //   bottom: BottomSheetView.confirmEntry,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> workOderChekInOtp({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .workOrderCheckInOtp(
            token: token ?? "",
            otpCode: otpCode,
            securityNote: securityNote,
            override_time_window: override_time_window,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> vendorAccessCodeCheckIn({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .vendorAccessCodeCheckIn(
            token: token ?? "",
            otpCode: otpCode,
            securityNote: securityNote,
            override_time_window: override_time_window,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response;

        final String jsonString = json.encode(userData);

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorcheckinMessage,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> vendorAccessCodeCheckOut({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .vendorAccssCodeCheckOut(
            token: token ?? "",
            otpCode: otpCode,
            securityNote: securityNote,
            override_time_window: override_time_window,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response;

        final String jsonString = json.encode(userData);

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorCheckoutmessage,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> vendorAccessCodeDeny({
    required BuildContext context,
    required String otpCode,
    required String dec,
    required String reason,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .vendorAccessCodeDeny(
            token: token ?? "",
            otpCode: otpCode,
            dec: dec,
            reason: reason,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response;

        final String jsonString = json.encode(userData);

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorAccessCodeDeyMessage,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> validateVendorUsingOTP({
    required BuildContext context,
    required Map<String, dynamic> requestData,
    required String vendochekc,
    required WidgetRef ref,
    required String otpCode,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .validateVendorCode(
            token: token ?? "",
            type: vendochekc,
            requestData: requestData,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        context.pop();
        log("TRUE------->");
        final userData = response;

        final String jsonString = json.encode(userData);

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        if (vendochekc.contains("1")) {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: '',
            ref: ref,
            bottom: BottomSheetView.vendorCodeCornfirm,
          );
        } else if (vendochekc.contains("2")) {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: otpCode,
            ref: ref,
            bottom: BottomSheetView.vendoraccesCodConfirm,
          );
        }
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> grantAccess({
    required BuildContext context,
    required String numberofguest,
    required bool requiredEscort,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .approvedEntry(
            token: token ?? "",
            numberofguest: numberofguest,
            requiredEscort: requiredEscort,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response;
        final String jsonString = json.encode(userData);
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "yess",
          ref: ref,
          bottom: BottomSheetView.accesGranted,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> permitGrantAccess({
    required BuildContext context,
    required String code,
    required String note,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .permitapprovedEntry(
            token: token ?? "",
            otpcode: code,
            note: note,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response;
        final String jsonString = json.encode(userData);
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "yess",
          ref: ref,
          bottom: BottomSheetView.checkoutpermitapprovedmessaage,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  ////api/v1/estates/security/workorders/validate validateVendorUsingOTP
  Future<void> denyEntry({
    required BuildContext context,
    required String denyReason,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .denyEntry(
            token: token ?? "",
            denyReason: denyReason,
            securityNote: securityNote,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.denyEntryConfirmation,
        );
        notifier.resetForm();
        log("TRUE------->");
        // showUserBottomSheet(
        //   context: context,
        //   headertitle:
        //       "${userData["firstname"] ?? "N/A"} ${userData["lastname"] ?? "N/A"}",
        //   headersubtitle: "",
        //   ref: ref,
        //   bottom: BottomSheetView.accesGranted,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> permitdenyEntry({
    required BuildContext context,
    required String denyReason,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .permitDenyEntry(
            token: token ?? "",
            denyReason: denyReason,
            securityNote: securityNote,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.cheoutPermitDenymessage,
        );
        notifier.resetForm();
        log("TRUE------->");
        // showUserBottomSheet(
        //   context: context,
        //   headertitle:
        //       "${userData["firstname"] ?? "N/A"} ${userData["lastname"] ?? "N/A"}",
        //   headersubtitle: "",
        //   ref: ref,
        //   bottom: BottomSheetView.accesGranted,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> allWorkersAccess({
    required BuildContext context,
    required String action,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .allWorkersAccess(
            token: token ?? "",
            action: action,
            note: securityNote,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();
        log("TRUE------->");

        if (action.contains("grant")) {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: "",
            ref: ref,
            bottom: BottomSheetView.vendorCodeApprovedMessage,
          );
        } else if (action.contains("reject")) {
          showUserBottomSheet(
            context: context,
            headertitle: jsonString,
            headersubtitle: "",
            ref: ref,
            bottom: BottomSheetView.vendorCodeDenyMessage,
          );
        }

        notifier.resetForm();
        log("TRUE------->");
        // showUserBottomSheet(
        //   context: context,
        //   headertitle:
        //       "${userData["firstname"] ?? "N/A"} ${userData["lastname"] ?? "N/A"}",
        //   headersubtitle: "",
        //   ref: ref,
        //   bottom: BottomSheetView.accesGranted,
        // );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> resolvedViolation({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .resolvedViolation(
            token: token ?? "",
            reason: reason,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(investigatingProvider.notifier).refreshReports(context, ref);
        ref.read(resovedProvider.notifier).refreshReports(context, ref);
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> denyAccessForWorkers({
    required BuildContext context,
    required String code,
    required String reason,
    required String dec,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .denyAccessForWorkers(
            token: token ?? "",
            code: code,
            reason: reason,

            dec: dec,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        log("TRUE------->");
        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);
        // Log the specific fields you want
        debugPrint('📋 USER DETAILS LOG:');
        debugPrint('─────────────────────────────────────────');
        debugPrint('📸 Media URL: ${userData['media_url'] ?? "N/A"}');
        debugPrint('👤 Role: ${userData['role'] ?? "N/A"}');
        debugPrint('👤 First Name: ${userData['firstname'] ?? "N/A"}');
        debugPrint('👤 Last Name: ${userData['lastname'] ?? "N/A"}');

        debugPrint('─────────────────────────────────────────');
        notifier.resetForm();
        log("TRUE------->");
        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: userData['estate_name'] ?? "N/A",
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();

          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(oTpformProvider.notifier);
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      notifiers.updateLoading(false);
      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> dismissedViolation({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(oTpformProvider.notifier);
      final notifier = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .dissmissedViolation(
            token: token ?? "",
            reason: reason,
            id: id,
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
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
        ref.read(investigatingProvider.notifier).refreshReports(context, ref);
        ref.read(dismissProvider.notifier).refreshReports(context, ref);
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifiers.updateLoading(false);
          notifier.resetForm();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetForm();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateReminder({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(reminderProvider);
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .updateReminder(
            id: id,
            token: token ?? "",
            notificationmethod: notifiers.notificationmethod.toLowerCase(),
            title: notifiers.title,
            dec: notifiers.dec,

            time: notifiers.time,

            piority: notifiers.piority.toLowerCase(),

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.resetAll();
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
        ref.read(getReminderProvider.notifier).refreshReminder(context, ref);
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          ref.read(generateNotifierProvider.notifier).resetState();
          notifier.resetAll();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(false);
      ref.read(generateNotifierProvider.notifier).resetState();
      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> cerateReminder({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifiers = ref.read(reminderProvider);
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .creatReminders(
            token: token ?? "",
            reason: reason,
            title: notifiers.title,
            dec: notifiers.dec,
            category: notifiers.category.toLowerCase(),
            remberType: notifiers.remberType.toLowerCase(),
            time: notifiers.time,
            frequence: notifiers.frequence.toLowerCase(),
            piority: notifiers.piority.toLowerCase(),
            isSharedWithHousehold: notifiers.isSharedWithHousehold,
            notificationmethod: notifiers.notificationmethod.toLowerCase(),
            intarver: notifiers.interva,

            id: id,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        ref.read(getReminderProvider.notifier).refreshReminder(context, ref);
        notifier.updateLoading(false);
        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.resetAll();
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
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        ref.read(generateNotifierProvider.notifier).resetState();
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          ref.read(generateNotifierProvider.notifier).resetState();
          notifier.updateLoading(false);
          notifier.resetAll();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);
      ref.read(generateNotifierProvider.notifier).resetState();
      notifier.updateLoading(false);

      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> updateReminderTocomplet({
    required BuildContext context,
    required String type,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .markReminderAsdon(
            id: id,
            token: token ?? "",
            completeOrCancel: type,

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(getReminderProvider.notifier).refreshReminder(context, ref);
        notifier.resetAll();
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
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          notifier.resetAll();
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
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(false);

      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> addToCCalender({
    required BuildContext context,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addToCalender(id: id, token: token ?? "", context: context);

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        ref.read(getCalenderProvider.notifier).refreshEvent(context, ref);
        ref.read(getEventProvider.notifier).refreshEvent(context, ref, "");
        notifier.updateLoading(false);
        refreshRsvp(ref, "going");
        notifier.resetAll();
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
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          notifier.resetAll();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(false);

      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> rsvpEvent({
    required BuildContext context,
    required String goingNotGoin,
    required String reason,
    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .rsvEvent(
            goingOrNotgoing: goingNotGoin,
            id: id,
            token: token ?? "",
            reasion: reason,

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(getEventProvider.notifier).refreshEvent(context, ref, "");
        notifier.resetAll();
        // context.pop();
        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          notifier.resetAll();
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
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(false);

      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> submitWorkOrder({
    required BuildContext context,
    required String file,
    required String name,
    required String dec,
    required String email,
    required String phone,
    required String startDate,
    required String endDate,
    required String dailyWindowTime,
    required String numberofWorkers,
    required String numberofDays,
    required int categorie,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      updateWorkderLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .submitWorkOrders(
            categorie: categorie,
            file: "",
            name: name,
            dec: dec,
            email: email,
            phone: phone,
            startDate: startDate,
            endDate: endDate,
            dailyWindowTime: dailyWindowTime,
            numberofWorkers: numberofWorkers,
            numberofDays: numberofDays,

            token: token ?? "",

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateWorkderLoading(false);
        final data = response['data']["workorder"];

        final String jsonString = json.encode(data);
        context.pop();
        context.pushNamed(
          AppRoutes.vendorAccessCode,
          extra: {"title": jsonString, "share": "", "code": ""},
        );
        notifier.resetAll();
        ref.read(workOrderProvider.notifier).refreshWorkOrders(context, ref);

        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          updateWorkderLoading(false);

          //  final error = response['errors']?['comment']?.first;
          // final message =
          //     response["data"]?["0"]?["email"]?[0] ?? response["message"];

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
      updateWorkderLoading(false);

      if (!context.mounted) return;

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
      updateWorkderLoading(false);

      log("END------->");
    }
  }

  Future<void> uploadeAfterWork({
    required BuildContext context,
    required List<File> file,

    required String id,

    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      updateWorkderLoading(true);

      final response = await ref
          .read(profileRepositoryProvider)
          .uploadAfterWork(id: id, file: file, context: context);

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateWorkderLoading(false);

        ref.read(workImagesProvider.notifier).clear();

        context.pop();

        notifier.resetAll();
        ref.read(workOrderProvider.notifier).refreshWorkOrders(context, ref);

        log("TRUE------->");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          updateWorkderLoading(false);

          //  final error = response['errors']?['comment']?.first;
          // final message =
          //     response["data"]?["0"]?["email"]?[0] ?? response["message"];

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
      updateWorkderLoading(false);

      if (!context.mounted) return;

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
      updateWorkderLoading(false);

      log("END------->");
    }
  }

  Future<void> enableFingerPrint({
    required BuildContext context,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
    log("START------->");

    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
    notifiers.setLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final biometricType = await DeviceInfoHelper.getBiometricType();
      final deviceInfo = await DeviceInfoHelper.getDeviceInfo();

      final isBiometricEnabled = ref.watch(biometricPrefProvider);
      final isBiometricEnableds = ref.read(biometricPrefProvider.notifier);

      // ✅ Step 1: Check if biometrics available
      final canUseBiometric = await DeviceInfoHelper.isBiometricAvailable();
      if (!canUseBiometric) {
        showCustomSuccessToast(
          context: context,
          message: "This device doesn't support biometric authentication.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        return;
      }

      // ✅ Step 2: Ask user to authenticate with fingerprint/face
      final authenticated = await DeviceInfoHelper.authenticateUser(ref);
      if (!authenticated) {
        showCustomSuccessToast(
          context: context,
          message: "Authentication cancelled or failed.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        return;
      }

      // ✅ Step 3: Proceed to setup or enable after authentication
      if (!isBiometricEnabled) {
        final response = await ref
            .read(profileRepositoryProvider)
            .setUpBiometric(
              token: token ?? "",
              device_token: deviceToken ?? "",
              biometricType: biometricType,
              device_name: deviceInfo["device_name"] ?? "",
              os_version: deviceInfo["os_version"] ?? "",
              app_version: deviceInfo["app_version"] ?? "",
              context: context,
            );

        if (!context.mounted) return;

        if (response['status'] == true) {
          await DeviceInfoHelper.saveFirstTimeCheck(false);
          isBiometricEnableds.toggleBiometric(true);
          final biometricId = deviceToken ?? "unknown_device_id";
          final signature = await BiometricSignatureHelper.getOrCreateSignature(
            uniqueBiometricId: biometricId,
          );

          log("✅ Signature created after successful setup: $signature");

          // enabletoggle(context: context, value: value, ref: ref, slug: slug);
        } else {
          final message = response["message"] ?? "Unknown error";
          if (message.contains("Unauthenticated")) {
            ref.read(authProvider.notifier).sessionExpire(context, ref);
          } else {
            showCustomSuccessToast(
              context: context,
              message: "SetUpFingerPrintErrorMessage: $message",
              color: AppColors.instance.error500,
              icon: Icons.error,
              iconColors: AppColors.instance.grey200,
              positionNumber: 70,
            );
          }
        }
      } else {
        log("the value was true");
        enabletoggle(
          context: context,
          value: isBiometricEnabled,
          ref: ref,
          slug: slug,
        );
      }
    } on DioException catch (e) {
      log("DIO ERROR: $e");
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("ERROR-------> $e");
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      notifiers.setLoading(false);
      log("END------->");
    }
  }

  Future<void> enabletoggle({
    required BuildContext context,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
    log("🚀 START enableToggle() | switch current value = $value");

    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
    final biometricPref = ref.read(biometricPrefProvider.notifier);
    notifiers.setLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future) ?? "";

      /// -------------------------------
      /// CASE 1: User currently ENABLED (value = true)
      /// Means → user wants to DISABLE it now
      /// -------------------------------
      log("🧭 Current state: enabled → disabling...");

      final response = await ref
          .read(profileRepositoryProvider)
          .enable_desable_fingal_faceID(
            token: token,
            isEnable: "disable",
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        log("✅ Biometric disabled successfully");
        biometricPref.toggleBiometric(false);

        showCustomSuccessToast(
          context: context,
          message: "Biometric disabled successfully!",
          color: AppColors.instance.teal400,
          icon: Icons.check,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        _handleErrorResponse(context, ref, response["message"]);
      }
    } on DioException catch (e) {
      log("🌐 DIO ERROR: $e");
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("💥 ERROR: $e");
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      notifiers.setLoading(false);
      log("🏁 END enableToggle()");
    }
  }

  Future<void> signInwithFaceID({
    required BuildContext context,
    required WidgetRef ref,
    required String slug,
  }) async {
    log("🚀 START signInwithFaceID()");

    updateloginLodaing(true);
    final isBiometricEnabled = ref.read(biometricPrefProvider.notifier);

    try {
      // 1️⃣ Authenticate user with biometrics (finger/face)
      final authenticated = await DeviceInfoHelper.authenticateUser(ref);

      if (!authenticated) {
        showCustomSuccessToast(
          context: context,
          message: "Biometric authentication failed or cancelled.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        return;
      }

      // 2️⃣ Gather all needed data for the login request
      final email = await BiometricSignatureHelper.getStoredEmail();
      final signature = await BiometricSignatureHelper.getStoredSignature();
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final token = await ref.watch(accessTokenProvider.future) ?? "";

      log('${signature}');

      log("Device EMAIL: $email");

      if (email == null || signature == null) {
        showCustomSuccessToast(
          context: context,
          message:
              "Biometric data not found. Please enable biometric login first.",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        return;
      }

      // 3️⃣ Call API to log in using stored biometric credentials
      final response = await ref
          .read(profileRepositoryProvider)
          .logIngwithFingerPrintAndFaceID(
            token: token,
            email: email,
            device_token: deviceToken ?? "",
            biometric_signature: signature,
            context: context,
          );

      if (!context.mounted) return;

      // 4️⃣ Handle response
      if (response["status"] == true) {
        log("✅ Biometric login successful for user: $email");
        updateloginLodaing(false);

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
          final email = user?["email"] as String?;
          if (firstName != null) {
            await SharedPrefsService().saveSingleUserName(firstName);
          }

          if (email != null) {
            await DeviceInfoHelper.saveUserEmail(email);
          }
        }
        final user = response['data']["user"];
        final userRole = user['role'];
        final biometricenabled = user["biometric_enabled"];

        if (biometricenabled) {
          await DeviceInfoHelper.saveFirstTimeCheck(false);
          isBiometricEnabled.toggleBiometric(true);
        } else {
          await DeviceInfoHelper.saveFirstTimeCheck(true);
          isBiometricEnabled.toggleBiometric(false);
        }
        log(userRole.toString());
        getUserRoleFromString(context, userRole.toString());
        // USING SHAREPREFRENCE FOR LOCAL DATA STORE AND FOR
        //PREVENT USER FROM LEAVE THE DASHBORD AFTER LOGIN
        // context.goNamed(AppRoutes.dashbord);
        // Optionally save token or navigate to dashboard
        // ref.read(authProvider.notifier).handleLoginSuccess(response);
      } else {
        final message = response["message"] ?? "Biometric login failed.";
        log("❌ Login failed: $message");
        updateloginLodaing(false);
        _handleLoginError(context, ref, message);
      }
    } on DioException catch (e) {
      log("🌐 DIO ERROR during biometric login: $e");
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred while logging in.",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("💥 Unexpected ERROR: $e");
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
      log("🏁 END signInwithFaceID()");
    }
  }

  Future<void> addPermitToActiveOTP({
    required BuildContext context,

    required Map<String, dynamic> requestData,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);
      final items = ref.watch(itemListProvider);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addWorkPermit(
            requestData: requestData,
            token: token ?? "",

            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        items.clear();
        notifier.updateLoading(false);

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
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          items.clear();
          notifier.resetAll();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);
      final items = ref.watch(itemListProvider);

      notifier.updateLoading(false);
      items.clear();
      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> requestEventCode({
    required BuildContext context,

    required String event_title,
    required String event_description,
    required String event_type,
    required String event_start_date,
    required String event_end_date,
    required int expected_guests,

    required String event_location,
    required String special_instructions,
    required WidgetRef ref,
  }) async {
    log("START------->");

    try {
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .requestEventCodes(
            token: token ?? "",
            event_title: event_title,
            event_type: event_type,
            event_start_date: event_start_date,
            event_end_date: event_end_date,
            expected_guests: expected_guests,
            event_description: event_description,
            event_location: event_location,
            special_instructions: special_instructions,
            context: context,
          );

      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        notifier.updateLoading(false);

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
        ref.read(getEventCodeProvider.notifier).refreshEventCode(context, ref);
      } else {
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          notifier.updateLoading(false);
          notifier.resetAll();
          //  final error = response['errors']?['comment']?.first;
          final message =
              response["data"]?["0"]?["email"]?[0] ?? response["message"];

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);
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
      final notifier = ref.read(reminderProvider.notifier);
      final items = ref.watch(itemListProvider);

      notifier.updateLoading(false);
      items.clear();
      notifier.resetAll();

      updateOtp('', false);
      log("END------->");
    }
  }

  Future<void> deActiveEventCode({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .deActiveEventCode(
            token: token ?? "",
            id: id,
            reason: state.digiterReason ?? "",
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(getEventCodeProvider.notifier).refreshEventCode(context, ref);
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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
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

  Future<void> casetVote({
    required BuildContext context,
    required String id,
    required WidgetRef ref,
    required Map<String, dynamic> requestData,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .castVote(
            requestData: requestData,
            id: id,
            reason: state.digiterReason ?? "",
            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        ref.read(electionProvider.notifier).clearAll();
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(candidateProvider.notifier).refreshCandidate(context, ref);

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
        ref.read(electionProvider.notifier).clearAll();
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          ref.read(electionProvider.notifier).clearAll();
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
      ref.read(electionProvider.notifier).clearAll();
    }
  }

  Future<void> payDueOutstanding({
    required BuildContext context,
    required List<int> selected_dues,
    required double totalAmout,
    required WidgetRef ref,
  }) async {
    log("START------->");
    updateGenrateMemberIdLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .paydueOutStanding(
            selected_dues: selected_dues,
            totalAmout: totalAmout,

            context: context,
          );
      log(response.toString());
      if (!context.mounted) return; // Always check first

      if (response['status'] == true) {
        updateGenrateMemberIdLoading(false);

        context.pop();
        ref
            .read(paymentDashbordProvider.notifier)
            .refreshPaymentDashbord(context, ref);
        context.pushNamed(
          AppRoutes.paymentSuccess,
          extra: {"fails_succs": false, "ErrorMessage": response["message"]},
        );
        log("TRUE------->");

        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );

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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          context.pop();
          context.pushNamed(
            AppRoutes.paymentSuccess,
            extra: {"fails_succs": true, "ErrorMessage": response["message"]},
          );
          // showCustomSuccessToast(
          //   context: context,
          //   message: response["message"],
          //   color: AppColors.instance.error500,
          //   icon: Icons.error,
          //   iconColors: AppColors.instance.grey200,
          //   positionNumber: 70,
          // );
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

  Future<void> initialisWalletFunding({
    required BuildContext context,
    required String paymentMethod,
    required String refrence,
    required double totalAmout,
    required WidgetRef ref,
  }) async {
    log("START------->");
    log("REQUEST DATA: amount: ${(totalAmout * 100).round()}");
    log("REQUEST DATA: method: $paymentMethod");
    log("REQUEST DATA: reference: $refrence");
    log("Mounted? ${context.mounted}");

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .initialisWalletFunding(
            Amout: totalAmout,
            paymentMethod: paymentMethod,
            paymentRefrenc: refrence,

            context: context,
          );

      log("befor isMouted------->");
      log(response.toString());
      if (!context.mounted) return; // Always check first
      log("after isMouted------->");
      if (response['status'] == true) {
        ref
            .read(paymentDashbordProvider.notifier)
            .refreshPaymentDashbord(context, ref);
        context.pop();
        ref
            .read(paymentHistoryProvider.notifier)
            .refreshPaymentHistory(context, ref);
        showUserBottomSheet(
          context: context,
          headertitle: response["message"].toString(),
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.paymentSuccess,
        );

        // context.pushNamed(
        //   AppRoutes.paymentSuccess,
        //   extra: {"fails_succs": false, "ErrorMessage": response["message"]},
        // );
        log("TRUE------->");

        // showCustomSuccessToast(
        //   context: context,
        //   message: response["message"],
        //   color: AppColors.instance.teal300,
        //   icon: Icons.check_circle,
        //   iconColors: AppColors.instance.grey200,
        //   positionNumber: 70,
        // );

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
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else {
          //  final error = response['errors']?['comment']?.first;
          context.pop();
          // context.pushNamed(
          //   AppRoutes.paymentSuccess,
          //   extra: {"fails_succs": true, "ErrorMessage": response["message"]},
          // );
          showUserBottomSheet(
            context: context,
            headertitle: response["message"].toString(),
            headersubtitle: "hellleo",
            ref: ref,
            bottom: BottomSheetView.paymentSuccess,
          );
          // showCustomSuccessToast(
          //   context: context,
          //   message: response["message"],
          //   color: AppColors.instance.error500,
          //   icon: Icons.error,
          //   iconColors: AppColors.instance.grey200,
          //   positionNumber: 70,
          // );
        }
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

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
      log("END------->");
    }
  }

  Future<void> initialisMessage({
    required BuildContext context,
    required String message,
    required String id,
    required String type,
    required WidgetRef ref,
  }) async {
    log("START------->");

    log("Mounted? ${context.mounted}");

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .sendInitialMessage(
            message: message,
            type: type,
            id: id,
            context: context,
          );

      log("befor isMouted------->");
      log(response.toString());
      if (!context.mounted) return; // Always check first
      log("after isMouted------->");
      if (response['status'] == true) {
        ref
            .read(paymentDashbordProvider.notifier)
            .refreshPaymentDashbord(context, ref);
        context.pop();
        // ref
        //     .read(paymentHistoryProvider.notifier)
        //     .refreshPaymentHistory(context, ref);
        // showUserBottomSheet(
        //   context: context,
        //   headertitle: response["message"].toString(),
        //   headersubtitle: "",
        //   ref: ref,
        //   bottom: BottomSheetView.paymentSuccess,
        // );
      } else {
        updateGenrateMemberIdLoading(false);
        // log(e.toString());
        // ref.read(authProvider.notifier).seassionExpire(context, ref);
        log("FALSE------->");
      }
    } on DioException catch (e) {
      if (!context.mounted) return;

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
      log("END------->");
    }
  }

  Future<void> sendMessage({
    required BuildContext context,
    required String message,
    File? file,
    required WidgetRef ref,
    required int id,
  }) async {
    log("CHAT SEND START");

    // 1️⃣ Create local message
    final localId =
        '${DateTime.now().millisecondsSinceEpoch}_${math.Random().nextInt(999)}';

    final localMessage = ChatMessage(
      localId: localId,
      content: message,
      senderId: "current_user_id", // replace with actual user id
      createdAt: DateTime.now(),
      isSynced: false,
    );

    // 2️⃣ Save locally & update UI immediately
    await ref.read(chatLocalRepositoryProvider).save(localMessage);
    ref.read(chatMessagesProvider.notifier).addLocalMessage(localMessage);

    try {
      // 3️⃣ Check connectivity (optional but recommended)
      final connectivity = await Connectivity().checkConnectivity();
      final isOnline = connectivity != ConnectivityResult.none;

      if (!isOnline) {
        log("OFFLINE — message queued");
        return;
      }

      // 4️⃣ Attempt API send
      final response = await ref
          .read(profileRepositoryProvider)
          .sendMessage(message: message, context: context, file: file, id: id);

      if (!context.mounted) return;

      if (response['status'] == true) {
        // 5️⃣ Mark message as synced
        await ref
            .read(chatLocalRepositoryProvider)
            .markSynced(
              localId: localId,
              serverId: response['data']['id'].toString(),
            );

        ref.read(chatMessagesProvider.notifier).refresh();

        log("CHAT MESSAGE SYNCED");
      } else {
        if (response["message"] ==
            "Unauthenticated. Please login to continue.") {
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        }
      }
    } on DioException catch (e) {
      log("NETWORK ERROR — message kept offline");
      log(e.toString());
    } catch (e) {
      log("UNEXPECTED ERROR");
      log(e.toString());
    } finally {
      log("CHAT SEND END");
    }
  }

  Future<void> markUnreadMessage({required WidgetRef ref}) async {
    log("START------->");

    try {
      final response =
          await ref.read(profileRepositoryProvider).markMessagCount();

      log("befor isMouted------->");
      log(response.toString());

      log("after isMouted------->");
      if (response['status'] == true) {
      } else {}
    } on DioException catch (e) {
      if (e.error is SocketException) {
        log(e.error.toString());
      }
      log(e.toString());
    } catch (e) {
      log("E-ERROR-MESSAGE------->");
      log(e.toString());
    } finally {
      log("END------->");
    }
  }

  Future<void> chattingSetting({
    required BuildContext context,
    required int id,
    required bool do_not_disturb,
    required int dnd_duration_hours,
    required WidgetRef ref,
  }) async {
    updateChatingLoading(true);
    try {
      // 3️⃣ Check connectivity (optional but recommended)

      // 4️⃣ Attempt API send
      final response = await ref
          .read(profileRepositoryProvider)
          .chattingSetting(
            id: id,
            dnd_duration_hours: dnd_duration_hours,
            do_not_disturb: do_not_disturb,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        // 5️⃣ Mark message as synced
        updateChatingLoading(false);
        log("CHAT MESSAGE SYNCED");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateChatingLoading(false);
      }
    } on DioException catch (e) {
      log("NETWORK ERROR — message kept offline");
      updateChatingLoading(false);
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("UNEXPECTED ERROR");
      updateChatingLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log(e.toString());
    } finally {
      log("CHAT SEND END");
      updateChatingLoading(false);
    }
  }

  Future<void> signAgreement({
    required BuildContext context,
    required File signatur,
    required String fullName,
    required WidgetRef ref,
  }) async {
    updateTermsAndPropertyLoading(true);
    try {
      // 3️⃣ Check connectivity (optional but recommended)

      // 4️⃣ Attempt API send
      final response = await ref
          .read(profileRepositoryProvider)
          .agreementsiging(
            signatur: signatur,
            fullName: fullName,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        // 5️⃣ Mark message as synced
        updateTermsAndPropertyLoading(false);
        log("CHAT MESSAGE SYNCED");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      log("NETWORK ERROR — message kept offline");
      updateTermsAndPropertyLoading(false);
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("UNEXPECTED ERROR");
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log(e.toString());
    } finally {
      log("CHAT SEND END");
      updateTermsAndPropertyLoading(false);
    }
  }

  Future<void> rejectAgreement({
    required BuildContext context,
    required bool isProperty,
    required String reason,
    required WidgetRef ref,
  }) async {
    updateTermsAndPropertyLoading(true);
    try {
      // 3️⃣ Check connectivity (optional but recommended)

      // 4️⃣ Attempt API send
      final response = await ref
          .read(profileRepositoryProvider)
          .agreementAndTermsDecline(
            reason: reason,
            isProperty: isProperty,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        // 5️⃣ Mark message as synced
        updateTermsAndPropertyLoading(false);
        log("CHAT MESSAGE SYNCED");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      log("NETWORK ERROR — message kept offline");
      updateTermsAndPropertyLoading(false);
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("UNEXPECTED ERROR");
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log(e.toString());
    } finally {
      log("CHAT SEND END");
      updateTermsAndPropertyLoading(false);
    }
  }

  Future<void> termsAndConditon({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    updateTermsAndPropertyLoading(true);
    try {
      // 3️⃣ Check connectivity (optional but recommended)

      // 4️⃣ Attempt API send
      final response = await ref
          .read(profileRepositoryProvider)
          .termsAndCondition(context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        // 5️⃣ Mark message as synced
        updateTermsAndPropertyLoading(false);
        log("CHAT MESSAGE SYNCED");
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      log("NETWORK ERROR — message kept offline");
      updateTermsAndPropertyLoading(false);
      log(e.toString());
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      log("UNEXPECTED ERROR");
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log(e.toString());
    } finally {
      log("CHAT SEND END");
      updateTermsAndPropertyLoading(false);
    }
  }

  /// 🧩 Handle login error gracefully
  void _handleLoginError(BuildContext context, WidgetRef ref, String? message) {
    final errorMessage = message ?? "Unknown error";
    log("❌ Biometric Login Error: $errorMessage");

    if (errorMessage.contains("Unauthenticated")) {
      ref.read(authProvider.notifier).sessionExpire(context, ref);
    } else {
      showCustomSuccessToast(
        context: context,
        message: errorMessage,
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    }
  }

  /// Helper function for error responses
  void _handleErrorResponse(
    BuildContext context,
    WidgetRef ref,
    String? message,
  ) {
    final errorMessage = message ?? "Unknown error";
    log("❌ API Response Error: $errorMessage");

    if (errorMessage.contains("Unauthenticated")) {
      ref.read(authProvider.notifier).sessionExpire(context, ref);
    } else {
      showCustomSuccessToast(
        context: context,
        message: errorMessage,
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
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
