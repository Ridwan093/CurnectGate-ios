import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
import 'package:curnectgate/features/%20operations/property_agreement/provider/complince_provider.dart';
import 'package:curnectgate/features/auth/data/auth_model/OnboardingProgressManager.dart';
import 'package:curnectgate/features/auth/data/auth_model/onbording_enum.dart';
import 'package:curnectgate/features/auth/widget/tmporarypassword_dialog.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_chat_settings.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/unread_counts_provider.dart';
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
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/estate_admin_dialog.dart';
import 'package:curnectgate/features/member_management/profile_form/validator/password_validator.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getPermittactive_permitt.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/EventCode_provider/getlistofEventCode_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getCalender_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/going_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/limit_event_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notification_Count_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/reminder_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/comment_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/payment/provider/dashbord_provider.dart';
import 'package:curnectgate/features/payment/provider/payment_History_provider.dart';
import 'package:curnectgate/features/security/model/close_all.dart';
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
        break;
    }
  }

  void updateSpecializations(List<String>? value) {
    state = state.copyWith(
      specializations: value,
      specializeValid: value?.isNotEmpty,
    );
  }

  void updateCertifications(List<String>? value) {
    state = state.copyWith(
      certifications: value,
      certificatteValid: value?.isNotEmpty,
    );
  }

  void updatestartDate(String? value) {
    state = state.copyWith(startdate: value, timeStateValid: value?.isNotEmpty);
  }

  void updateAgreement(bool? agreed) {
    state = state.copyWith(agreedToTerms: agreed ?? false);
  }

  void updatepassValid(bool? valide) {
    state = state.copyWith(passValid: valide ?? false);
  }

  void updateloginLodaing(bool isLoading) {
    state = state.copyWith(loginLodaing: isLoading);
  }

  void updateEstateIdCheckLoadin(bool isLoading) {
    state = state.copyWith(estateIdCheckLoadin: isLoading);
  }

  void updateMemberIdcheckLoading(bool isLoading) {
    state = state.copyWith(memberIdcheckLoading: isLoading);
  }

  void updateCreatPassLoading(bool isLoading) {
    state = state.copyWith(creatPassLoading: isLoading);
  }

  void updateOtpVerifyLoading(bool isLoading) {
    state = state.copyWith(otpVerifyLoading: isLoading);
  }

  void updateChangPassLoading(bool isLoading) {
    state = state.copyWith(changPassLoading: isLoading);
  }

  void updatForgetPaSsLoading(bool isLoading) {
    state = state.copyWith(forgetPaSsLoading: isLoading);
  }

  void updateChangTemporyPassLoading(bool isLoading) {
    state = state.copyWith(changTemporyPassLoading: isLoading);
  }

  void updateLogOutLoadin(bool isLoading) {
    state = state.copyWith(logOutLoading: isLoading);
  }

  void updatePrivacyLoading(bool isLoading) {
    state = state.copyWith(chattingLoading: isLoading);
  }

  void updatePrevencyLoading(bool isLoading) {
    state = state.copyWith(prevencyLoading: isLoading);
  }

  void updateNotificationSettingLoading(bool isLoading) {
    state = state.copyWith(notificationSettingLoading: isLoading);
  }

  void updateReportLoading(bool isLoading) {
    state = state.copyWith(reportLoading: isLoading);
  }

  void updateCommentLoading(bool isLoading) {
    state = state.copyWith(commentLoading: isLoading);
  }

  void updateChangProfileInfoLoading(bool isLoading) {
    state = state.copyWith(changProfileInfoLoading: isLoading);
  }

  void updateChangProfilePicLoading(bool isLoading) {
    state = state.copyWith(changProfilePicLoading: isLoading);
  }

  void updateChangProfilePassLoading(bool isLoading) {
    state = state.copyWith(changProfilePassLoading: isLoading);
  }

  void updatedeActivatAccountLoading(bool isLoading) {
    state = state.copyWith(deActivatAccountLoading: isLoading);
  }

  void updatedeSchedulOtpLoading(bool isLoading) {
    state = state.copyWith(schedulOtpLoading: isLoading);
  }

  void updatedeGenerateOtpLoading(bool isLoading) {
    state = state.copyWith(generateOtpWithValidatorLoading: isLoading);
  }

  void updatedeRevorkOtpLoading(bool isLoading) {
    state = state.copyWith(revokOtpLoading: isLoading);
  }

  void updateGenrateMemberIdLoading(bool isLoading) {
    state = state.copyWith(generateMemberIdLoading: isLoading);
  }

  void updateChatLoading(bool value) {
    state = state.copyWith(chattingLoading: value);
  }

  void updateInitMessageLoading(bool value) {
    state = state.copyWith(initMessageLoading: value);
  }

  void updateAddHouseHoldLoading(bool isLoading) {
    state = state.copyWith(addHouseHoldLoading: isLoading);
  }

  void updateGranFacilityPermissionLoading(bool isLoading) {
    state = state.copyWith(facilityLoading: isLoading);
  }

  void updateGrantCurfewPermissionLoading(bool isLoading) {
    state = state.copyWith(curfewLoading: isLoading);
  }

  void updateGrantGatePermissionLoading(bool isLoading) {
    state = state.copyWith(gateAccessLoading: isLoading);
  }

  void updateGrantCommunityPermissionLoading(bool isLoading) {
    state = state.copyWith(communityAccessLoading: isLoading);
  }

  void updateGrantNightPermissionLoading(bool isLoading) {
    state = state.copyWith(nightAccessLoading: isLoading);
  }

  void updateGrantParkingPermissionLoading(bool isLoading) {
    state = state.copyWith(parkingAccessLoading: isLoading);
  }

  void updateGrantVisitorPermissionLoading(bool isLoading) {
    state = state.copyWith(visitorAccessLoading: isLoading);
  }

  void updateBasicPermissionLoading(bool isLoading) {
    state = state.copyWith(basicPermissionLoading: isLoading);
  }

  void updateRemovedHouseHoldLoading(bool isLoading) {
    state = state.copyWith(removedHouseHoldLoading: isLoading);
  }

  void updateWorkderLoading(bool isLoading) {
    state = state.copyWith(workOderLoading: isLoading);
  }

  void updateOtp(String otp, bool isComplete) {
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
    state = state.copyWith(isResendOtpEnabled: false, resendCountdownTime: 30);

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

  String extractValidationMessage(Map<String, dynamic> response) {
    final List<String> messages = [];

    void extract(dynamic value) {
      if (value == null) return;

      if (value is String) {
        messages.add(value);
        return;
      }

      if (value is List) {
        for (final item in value) {
          extract(item);
        }
        return;
      }

      if (value is Map) {
        value.forEach((key, val) {
          if ([
            "status",
            "code",
            "type",
            "existing_user",
            "suggestion",
            "error_type",
          ].contains(key)) {
            return;
          }

          extract(val);
        });
      }
    }

    extract(response["data"]);
    extract(response["errors"]);

    if (messages.isNotEmpty) {
      return messages.join(" ");
    }

    return response["message"] ?? "Validation error occurred.";
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
    } catch (e) {
      updateCreatPassLoading(false);

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
      return;
    }

    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPcode(
            email: email.isEmpty ? emails : email,
            code: state.otp,
            context: context,
          );

      if (response['status'] == true) {
        updateOtpVerifyLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        await OnboardingProgressManager.clearProgress();

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
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);

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
    }
  }

  void getUserRoleFromString(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case 'landlord':
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
      return;
    }

    updateloginLodaing(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .logIn(email: email, pass: password, context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateloginLodaing(false);

        if (response["data"]["password_change_required"] == true) {
          showForcePasswordChangeDialog(
            context: context,
            message: response['message'] ?? "Password change required",
            onChangeNow: () {
              context.pushNamed(
                AppRoutes.changeTemporarypass,
                extra: {"token": response['data']['access_token'] ?? ""},
              );
            },
          );
          return;
        }

        await _handlePostLoginSuccess(
          context: context,
          ref: ref,
          data: response['data'],
          message: response["message"] ?? "",
        );
      } else {
        updateloginLodaing(false);

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
          message: e.message ?? "An error occurred",
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      updateloginLodaing(false);

      showCustomSuccessToast(
        context: context,
        message: "Unexpected error occurred",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateloginLodaing(false);
      updateOtp('', false);
    }
  }

  Future<void> signInwithFaceID({
    required BuildContext context,
    required WidgetRef ref,
    required String slug,
  }) async {
    updateloginLodaing(true);

    try {
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

      final email = await BiometricSignatureHelper.getStoredEmail();
      final signature = await BiometricSignatureHelper.getStoredSignature();
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final token = await ref.watch(accessTokenProvider.future) ?? "";

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

      if (response["status"] == true) {
        updateloginLodaing(false);

        await _handlePostLoginSuccess(
          context: context,
          ref: ref,
          data: response['data'],
          message: response["message"] ?? "",
        );
      } else {
        final message = response["message"] ?? "Biometric login failed.";

        updateloginLodaing(false);
        _handleLoginError(context, ref, message);
      }
    } on DioException {
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred while logging in.",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
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
    }
  }

  Future<bool> registerToken({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    try {
      final data = await DeviceInfoHelper.deviceInfo();

      final response = await ref
          .read(profileRepositoryProvider)
          .registerDeviceTokens(requestData: data, context: context);

      if (!context.mounted) return false;

      if (response["status"] == true) {
        return true;
      } else {
        final message = response["message"] ?? "Token not registered yet.";

        _handleLoginError(context, ref, message);
        return false;
      }
    } on DioException {
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
    }
  }

  Future<void> _handlePostLoginSuccess({
    required BuildContext context,
    required WidgetRef ref,
    required Map<String, dynamic> data,
    required String message,
  }) async {
    final prefs = SharedPrefsService();
    final isBiometricEnabled = ref.read(biometricPrefProvider.notifier);

    final user = data['user'] as Map<String, dynamic>? ?? {};
    final token = data["access_token"] as String?;
    final userRole = user['role']?.toString() ?? "";
    final biometricenabled = user["biometric_enabled"] == true;

    if (userRole.contains("estate_admin") ||
        userRole.contains("service_provider")) {
      showEstateAdminBlockedDialog(context);
      return;
    }

    await prefs.saveAuthData(data);

    if (token != null) {
      prefs.saveUserToken(token);
    }

    final firstName = user['firstname'];
    final lastName = user['lastname'];
    final email = user['email'];
    final mediaUrl = user['media_url'];

    if (mediaUrl != null) {
      await prefs.saveMedialUrl(mediaUrl);
      ref.read(profilePicProvider.notifier).refreshProfilePic();
      ref.invalidate(profilePicProvider);
    }

    if (firstName != null && lastName != null) {
      await prefs.saveFullName("$firstName $lastName");
      await prefs.saveSingleUserName(firstName);
      ref.read(authState.authProvider.notifier).loadfullName();
    }

    if (email != null) {
      await DeviceInfoHelper.saveUserEmail(email);
    }

    await registerToken(context: context, ref: ref);

    if (biometricenabled) {
      await DeviceInfoHelper.saveFirstTimeCheck(false);
      isBiometricEnabled.toggleBiometric(true);
    } else {
      await DeviceInfoHelper.saveFirstTimeCheck(true);
      isBiometricEnabled.toggleBiometric(false);
    }
    final int id = user['id'] ?? 0;

    if (id != 0) {
      try {
        await openMessagesBox(id.toString());
        await getConversationsBox(id.toString());
      } catch (e) {}
    }

    ref.read(authState.authProvider.notifier).loadAuthData();

    showCustomSuccessToast(
      context: context,
      message: message,
      color: AppColors.instance.teal300,
      icon: Icons.check_circle,
      iconColors: AppColors.instance.grey200,
      positionNumber: 70,
    );

    getUserRoleFromString(context, userRole);
  }

  Future<void> forgetPass({
    required BuildContext context,
    required String email,
    bool isrequst = false,
    required WidgetRef ref,
  }) async {
    updatForgetPaSsLoading(false);

    if (email.isEmpty) {
      return;
    }

    updatForgetPaSsLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .forgetPaSs(email: email, context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        if (isrequst) {
          startResendCountdown();
        }
        updatForgetPaSsLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        context.pushNamed(AppRoutes.passRestOtpVerify, extra: {"email": email});
      } else {
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
    } catch (e) {
      if (!context.mounted) return;

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
      return;
    }

    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .verifyOTPForget(email: email, code: state.otp);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateOtpVerifyLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        final responseData = response['data'] as Map<String, dynamic>;

        context.pushNamed(
          AppRoutes.passReset,
          extra: {
            ...responseData,
            'local_email': email,
            'original_response': response,
          },
        );
      } else {
        updateOtpVerifyLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);

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
      return;
    }

    updateOtpVerifyLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .requestOTPcode(email: email.isEmpty ? emails : email);

      if (!context.mounted) return;

      if (response['status'] == true) {
        startResendCountdown();
        updateOtpVerifyLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;
      updateOtpVerifyLoading(false);

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
      return;
    }

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateCreatPassLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        context.pushNamed(AppRoutes.signIN);
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
    } catch (e) {
      updateCreatPassLoading(false);
      if (!context.mounted) return;

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
    }
  }

  Future<void> changeTemporaryPass({
    required BuildContext context,
    required String token,
    required WidgetRef ref,
  }) async {
    updateChangTemporyPassLoading(false);

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateChangTemporyPassLoading(false);

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

        context.pop();
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
    } catch (e) {
      updateChangTemporyPassLoading(false);
      if (!context.mounted) return;

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
      return;
    }

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateChangProfileInfoLoading(false);

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
    } catch (e) {
      updateChangProfileInfoLoading(false);
      if (!context.mounted) return;

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
      return;
    }

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateChangProfilePassLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        context.pop();
      } else {
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
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
    } catch (e) {
      updateChangProfilePassLoading(false);
      if (!context.mounted) return;

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
    }
  }

  Future<void> deactiveAccount({
    required BuildContext context,
    required String currentPassword,
    required String reason,

    required WidgetRef ref,
  }) async {
    if (currentPassword.isEmpty && reason.isEmpty) {
      return;
    }

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatedeActivatAccountLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(userProfileProvider.notifier).refreshProfile(context, ref);

        context.pop();
      } else {
        updatedeActivatAccountLoading(false);
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
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
    } catch (e) {
      updatedeActivatAccountLoading(false);
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateUserPix({
    required BuildContext context,
    required File file,

    required WidgetRef ref,
  }) async {
    updateChangProfilePicLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updateUserProfilespix(file: file, context: context, token: token!);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateChangProfilePicLoading(false);

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

        context.pop();
      } else {
        updateChangProfilePicLoading(false);

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
    } catch (e) {
      updateChangProfilePicLoading(false);
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateAppNotification({
    required BuildContext context,
    required String key,
    required bool value,
    required String slug,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateNotificationSettingLoading(false);

        notifiers.setLoading(false);

        ref
            .read(userNotificationSettinProvider.notifier)
            .refreshSettings(context, ref);
      } else {
        updateNotificationSettingLoading(false);
        notifiers.setLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;
      updateNotificationSettingLoading(false);
      notifiers.setLoading(false);

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
    }
  }

  Future<void> updateAppPrivacy({
    required BuildContext context,
    required String key,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatePrivacyLoading(false);
        notifiers.setLoading(false);

        ref.read(userPrivacyprovider.notifier).refreshSettings(context, ref);
      } else {
        updatePrivacyLoading(false);
        notifiers.setLoading(false);

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
    } catch (e) {
      updatePrivacyLoading(false);
      notifiers.setLoading(false);
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateAppPrefernce({
    required BuildContext context,
    required String key,
    required String value,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatePrevencyLoading(false);

        ref.read(userPrefrenceprovider.notifier).refreshSettings(context, ref);
        context.pop();
      } else {
        updatePrevencyLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;
      updatePrevencyLoading(false);
      context.pop();

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
    }
  }

  Future<void> updateNotificationRead({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    try {
      final token = await ref.watch(accessTokenProvider.future);
      final response = await ref
          .read(profileRepositoryProvider)
          .updateuserNotificationRead(context: context, token: token!);

      if (!context.mounted) return;

      if (response['status'] == true) {
        ref.read(getNotificationCount.notifier).refreshCount(context, ref);
      } else {
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
    } catch (e) {
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> createReport({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
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
            isAnonymous: report.isAnonymous,
            priority: "high",
            pickedFiles: report.pickedFiles ?? {},
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateReportLoading(false);

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
      } else {
        updateReportLoading(false);

        reportStatess.resetState();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateReportLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();
      context.pop();
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
    } catch (e) {
      updateReportLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> makeACommentonReport({
    required BuildContext context,
    required String id,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateCommentLoading(false);

        ref
            .read(commentProvider.notifier)
            .refreshComment(context, ref, int.parse(id));
        reportStatess.resetState();
      } else {
        updateCommentLoading(false);

        reportStatess.resetState();

        showCustomSuccessToast(
          context: context,
          message: response["data"],
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateCommentLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      updateCommentLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);
      reportStatess.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> generateOtpWithValidity({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatedeGenerateOtpLoading(false);
        closeAllBottomSheets(context);

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
            extra: {'title': title, "code": otpCode, 'share': shareContent},
          );
        } else {}

        visitors.resetState();
      } else {
        updatedeGenerateOtpLoading(false);

        visitors.resetState();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updatedeGenerateOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      updatedeGenerateOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> scheduleOtpWithValidation({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatedeSchedulOtpLoading(false);
        context.pop();

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
          String shareContent = "Here's your vistor access codes:";
          context.pushNamed(
            AppRoutes.vendorAccessCode,
            extra: {'title': title, "code": otpCode, 'share': shareContent},
          );
        } else {}

        visitors.resetState();
      } else {
        updatedeSchedulOtpLoading(false);

        visitors.resetState();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updatedeSchedulOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      updatedeSchedulOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> revorkActiveOTP({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updatedeRevorkOtpLoading(false);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        visitors.resetState();
      } else {
        updatedeRevorkOtpLoading(false);

        visitors.resetState();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updatedeSchedulOtpLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      updatedeRevorkOtpLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> revorkWorkOder({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    try {
      final state = ref.read(workOrderFormProvider.notifier);

      state.setLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .revoWorkOder(token: token ?? "", id: id, context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        state.setLoading(false);
        ref.read(workOrderProvider.notifier).refreshWorkOrders(context, ref);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        state.setLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final state = ref.read(workOrderFormProvider.notifier);
      state.setLoading(false);

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
    } catch (e) {
      final state = ref.read(workOrderFormProvider.notifier);
      state.setLoading(false);
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> generateMemberIDForStat({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .generateMemberIDForStart(token: token ?? "", context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateGenrateMemberIdLoading(false);
        // ignore: unused_result
        ref.refresh(digitalIdStatusProvider);

        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        context.pop();
        ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);
        context.pushNamed(AppRoutes.digitalIDMember);
      } else {
        updateGenrateMemberIdLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> reGenerateMemberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);

        context.pop();
ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

      } else {
        updateGenrateMemberIdLoading(false);

        resteRasion();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> deActivememberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        updateGenrateMemberIdLoading(false);

        resteRasion();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> reActivememberID({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    updateGenrateMemberIdLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .reActiveMemberDigiterID(token: token ?? "", context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(digitMemberIDprovider.notifier).refreshDigitalID(context, ref);
      } else {
        updateGenrateMemberIdLoading(false);

        resteRasion();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        restaddMemberFillds();
        updateAddHouseHoldLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        closeAllBottomSheets(context);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);
      } else {
        updateAddHouseHoldLoading(false);

        restaddMemberFillds();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      restaddMemberFillds();
      updateAddHouseHoldLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> removedHouseHoold({
    required BuildContext context,

    required int id,

    required WidgetRef ref,
  }) async {
    updateRemovedHouseHoldLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .removedHouseHold(token: token ?? "", id: id, context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        resteRasion();
        updateRemovedHouseHoldLoading(false);

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
      } else {
        updateRemovedHouseHoldLoading(false);

        resteRasion();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateRemovedHouseHoldLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateRemovedHouseHoldLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateAddHouseHoldLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        closeAllBottomSheets(context);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);

        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      } else {
        updateAddHouseHoldLoading(false);

        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();

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
    } catch (e) {
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);

      if (!context.mounted) return;

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
            agentFees:
                (state.agentFee ?? "").isNotEmpty
                    ? int.parse(state.agentFee ?? "")
                    : 0,
            securitydeposit:
                (state.securityFees ?? "").isNotEmpty
                    ? int.parse(state.securityFees ?? "")
                    : 0,
            emergencyContactrelationshipRole: state.emenergencyRole ?? "",
            employee: state.employer ?? "",
            occupation: state.ocupation ?? "",
            monthlyincome:
                (state.montlyIcom ?? "").isNotEmpty
                    ? int.parse(state.montlyIcom ?? "")
                    : 0,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateAddHouseHoldLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        closeAllBottomSheets(context);

        ref.read(houseProvider.notifier).refreshHuseHold(context, ref);

        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      } else {
        updateAddHouseHoldLoading(false);

        restaddMemberFillds();
        ref.read(multiSelectProvider('Certifications').notifier).clearAll();
        ref.read(multiSelectProvider('Specializations').notifier).clearAll();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateAddHouseHoldLoading(false);
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();

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
    } catch (e) {
      restaddMemberFillds();
      ref.read(multiSelectProvider('Certifications').notifier).clearAll();
      ref.read(multiSelectProvider('Specializations').notifier).clearAll();
      updateAddHouseHoldLoading(false);

      if (!context.mounted) return;

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
    }
  }

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
    updateGranFacilityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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
            isEnabale: isFacilityEnabled,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateGranFacilityPermissionLoading(false);
        notifier.resetForm();

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
      } else {
        notifier.resetForm();
        updateGranFacilityPermissionLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGranFacilityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGranFacilityPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setFacilityPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGranFacilityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateGranFacilityPermissionLoading(false);
        notifier.resetForm();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGranFacilityPermissionLoading(false);

        notifier.resetForm();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGranFacilityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGranFacilityPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setGatePermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGrantGatePermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantGatePermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGrantGatePermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantGatePermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantGatePermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setvisitorPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGrantVisitorPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantVisitorPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGrantVisitorPermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantVisitorPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantVisitorPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setcommnunityForumPermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGrantCommunityPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantCommunityPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGrantCommunityPermissionLoading(false);

        notifier.resetForm();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantCommunityPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantCommunityPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setNightAccesspermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGrantNightPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantNightPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGrantNightPermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantNightPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantNightPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setPackAccess({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateGrantParkingPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final state = ref.watch(notificationProviders);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateGrantParkingPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );

        ref.read(statisticProvider.notifier).refreshPermission(context, ref);
      } else {
        notifier.resetForm();
        updateGrantParkingPermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      updateGrantParkingPermissionLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      notifier.resetForm();
      updateGrantParkingPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> setbasicePermission({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
    required String slug,
    required bool value,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();

        notifiers.setLoading(false);

        ref
            .read(permissionStatusProvider.notifier)
            .refreshPermissionstatus(context, ref);
      } else {
        notifier.resetForm();

        notifiers.setLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);

      notifiers.setLoading(false);
      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);
      final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
      notifier.resetForm();
      notifiers.setLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> landlordRestrictions({
    required BuildContext context,
    required int id,
    required WidgetRef ref,

    required bool value,
  }) async {
    updateBasicPermissionLoading(true);

    try {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      updateBasicPermissionLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      notifier.resetForm();

      updateBasicPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

  Future<void> landlordRemoveRestrictions({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
    updateBasicPermissionLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);

      final notifier = ref.read(notificationProviders.notifier);
      final response = await ref
          .read(profileRepositoryProvider)
          .landLoardRemoveRestriction(
            token: token ?? "",

            id: id,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        notifier.resetForm();
        updateBasicPermissionLoading(false);

        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      updateBasicPermissionLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifier.resetForm();

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
    } catch (e) {
      final notifier = ref.read(notificationProviders.notifier);

      notifier.resetForm();

      updateBasicPermissionLoading(false);

      if (!context.mounted) return;

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
    }
  }

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        context.pop();
        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);

        notifier.resetForm();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> validateDigitalOTP({
    required BuildContext context,
    required String qrCodeData,
    required String accessTypes,
    required String location,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);

        notifier.resetForm();
        context.pop();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response['data']['user'];
        closeAllBottomSheets(context);
        final String jsonString = json.encode(userData);

        notifier.resetForm();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> checkOutOTP({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response;

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        notifier.resetForm();

        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.acceptCheckOut,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> checkOutOTPwithPermit({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response;

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']);
        final hasClearance = userData["data"]["has_clearance_permit"];
        final message = response["message"];
        if (hasClearance == false) {
          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        } else {
          final int id = response['data']["permit_id"];

          notifier.resetForm();

          showUserBottomSheet(
            id: id,
            context: context,
            headertitle: jsonString,
            headersubtitle: jsonStringdata,
            ref: ref,
            bottom: BottomSheetView.checkOutWithpermitConfirm,
          );
        }
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> chekinOtp({
    required BuildContext context,
    required String otpCode,
    required String securityNote,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["validation"]["id"];

        notifier.resetForm();

        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> workOrderCheckOut({
    required BuildContext context,
    required String otpCode,
    required String securityNoted,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();
        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        notifier.resetForm();

        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.acceptCheckOut,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> workOderChekInOtp({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response['data']["otp"]["generated_by"];

        final String jsonString = json.encode(userData);
        final String jsonStringdata = json.encode(response['data']["otp"]);

        final int id = response['data']["otp"]["id"];

        notifier.resetForm();

        showUserBottomSheet(
          id: id,
          context: context,
          headertitle: jsonString,
          headersubtitle: jsonStringdata,
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> vendorAccessCodeCheckIn({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response;

        final String jsonString = json.encode(userData);

        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorcheckinMessage,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> vendorAccessCodeCheckOut({
    required BuildContext context,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response;

        final String jsonString = json.encode(userData);

        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorCheckoutmessage,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> vendorAccessCodeDeny({
    required BuildContext context,
    required String otpCode,
    required String dec,
    required String reason,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response;

        final String jsonString = json.encode(userData);

        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: '',
          ref: ref,
          bottom: BottomSheetView.vendorAccessCodeDeyMessage,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> validateVendorUsingOTP({
    required BuildContext context,
    required Map<String, dynamic> requestData,
    required String vendochekc,
    required WidgetRef ref,
    required String otpCode,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        context.pop();

        final userData = response;

        final String jsonString = json.encode(userData);

        notifier.resetForm();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> grantAccess({
    required BuildContext context,
    required String numberofguest,
    required bool requiredEscort,
    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);

        notifier.resetForm();

        final userData = response;
        closeAllBottomSheets(context);
        final String jsonString = json.encode(userData);
        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "yess",
          ref: ref,
          bottom: BottomSheetView.accesGranted,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> permitGrantAccess({
    required BuildContext context,
    required String code,
    required String note,
    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response;
        final String jsonString = json.encode(userData);
        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "yess",
          ref: ref,
          bottom: BottomSheetView.checkoutpermitapprovedmessaage,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> denyEntry({
    required BuildContext context,
    required String denyReason,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        closeAllBottomSheets(context);
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.denyEntryConfirmation,
        );
        notifier.resetForm();
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> permitdenyEntry({
    required BuildContext context,
    required String denyReason,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.cheoutPermitDenymessage,
        );
        notifier.resetForm();
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> allWorkersAccess({
    required BuildContext context,
    required String action,
    required String securityNote,
    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        final userData = response;

        final String jsonString = json.encode(userData);
        notifier.resetForm();

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
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> resolvedViolation({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        context.pop();
        notifiers.updateLoading(false);
        notifier.resetForm();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> denyAccessForWorkers({
    required BuildContext context,
    required String code,
    required String reason,
    required String dec,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final userData = response['data']['user'];

        final String jsonString = json.encode(userData);

        notifier.resetForm();

        showUserBottomSheet(
          context: context,
          headertitle: jsonString,
          headersubtitle: userData['estate_name'] ?? "N/A",
          ref: ref,
          bottom: BottomSheetView.confirmEntry,
        );
      } else {
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> dismissedViolation({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifiers.updateLoading(false);
        notifier.resetForm();
        context.pop();

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
        notifiers.updateLoading(false);
        notifier.resetForm();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifier = ref.read(oTpformProvider.notifier);

      final notifiers = ref.read(oTpformProvider.notifier);

      notifiers.updateLoading(false);

      notifier.resetForm();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateReminder({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.resetAll();
        context.pop();

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
        notifier.updateLoading(false);
        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> cerateReminder({
    required BuildContext context,
    required String reason,

    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        ref.read(getReminderProvider.notifier).refreshReminder(context, ref);
        notifier.updateLoading(false);
        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.resetAll();
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        ref.read(generateNotifierProvider.notifier).resetState();

        ref.read(generateNotifierProvider.notifier).resetState();
        notifier.updateLoading(false);
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateReminderTocomplet({
    required BuildContext context,
    required String type,

    required String id,

    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(getReminderProvider.notifier).refreshReminder(context, ref);
        notifier.resetAll();
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        notifier.updateLoading(false);
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> addToCCalender({
    required BuildContext context,

    required String id,

    required WidgetRef ref,
  }) async {
    try {
      final notifier = ref.read(reminderProvider.notifier);

      notifier.updateLoading(true);

      final token = await ref.watch(accessTokenProvider.future);

      final response = await ref
          .read(profileRepositoryProvider)
          .addToCalender(id: id, token: token ?? "", context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        ref.read(getCalenderProvider.notifier).refreshEvent(context, ref);
        ref.read(getEventProvider.notifier).refreshEvent(context, ref, "");
        notifier.updateLoading(false);
        refreshRsvp(ref, "going");
        notifier.resetAll();
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        notifier.updateLoading(false);
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> rsvpEvent({
    required BuildContext context,
    required String goingNotGoin,
    required String reason,
    required String id,

    required WidgetRef ref,
  }) async {
    try {
      final notifier = ref.read(reminderProvider.notifier);
      final isPop = ref.watch(isPopProvider);
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.updateLoading(false);
        ref.read(getEventProvider.notifier).refreshEvent(context, ref, "");
        ref.read(getEventLimitProvider.notifier).refreshEvent(context, ref);
        refreshRsvp(ref, "going");
        refreshRsvp(ref, "not_going");

        notifier.resetAll();
        if (isPop) {
          context.pop();
          ref.read(isPopProvider.notifier).state = false;
        }

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        notifier.updateLoading(false);
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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

      if (!context.mounted) return;

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

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        updateWorkderLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateWorkderLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> updateWorkOrder({
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
    required String id,

    required WidgetRef ref,
  }) async {
    try {
      final notifier = ref.read(reminderProvider.notifier);

      updateWorkderLoading(true);

      final response = await ref
          .read(profileRepositoryProvider)
          .updateWorkOrders(
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

            id: id,

            context: context,
          );

      if (!context.mounted) return;

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

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        updateWorkderLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateWorkderLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> uploadeAfterWork({
    required BuildContext context,
    required List<File> file,

    required String id,

    required WidgetRef ref,
  }) async {
    try {
      final notifier = ref.read(reminderProvider.notifier);

      updateWorkderLoading(true);

      final response = await ref
          .read(profileRepositoryProvider)
          .uploadAfterWork(id: id, file: file, context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateWorkderLoading(false);

        ref.read(workImagesProvider.notifier).clear();

        context.pop();

        notifier.resetAll();
        ref.read(workOrderProvider.notifier).refreshWorkOrders(context, ref);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        updateWorkderLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateWorkderLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> enableFingerPrint({
    required BuildContext context,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
    notifiers.setLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future);
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final biometricType = await DeviceInfoHelper.getBiometricType();
      final deviceInfo = await DeviceInfoHelper.getDeviceInfo();

      final isBiometricEnabled = ref.watch(biometricPrefProvider);
      final isBiometricEnableds = ref.read(biometricPrefProvider.notifier);

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
        } else {
          final message = extractValidationMessage(response);

          showCustomSuccessToast(
            context: context,
            message: message,
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );
        }
      } else {
        enabletoggle(
          context: context,
          value: isBiometricEnabled,
          ref: ref,
          slug: slug,
        );
      }
    } on DioException {
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
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
    }
  }

  Future<void> enabletoggle({
    required BuildContext context,
    required bool value,
    required WidgetRef ref,
    required String slug,
  }) async {
    final notifiers = ref.read(permissionLoadingProvider(slug).notifier);
    final biometricPref = ref.read(biometricPrefProvider.notifier);
    notifiers.setLoading(true);

    try {
      final token = await ref.watch(accessTokenProvider.future) ?? "";

      final response = await ref
          .read(profileRepositoryProvider)
          .enable_desable_fingal_faceID(
            token: token,
            isEnable: "disable",
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
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
    } on DioException {
      showCustomSuccessToast(
        context: context,
        message: "Network error occurred",
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
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
    }
  }

  Future<void> addPermitToActiveOTP({
    required BuildContext context,

    required Map<String, dynamic> requestData,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        items.clear();
        notifier.updateLoading(false);

        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(getActivePermit.notifier).refreshActive(context, ref);
      } else {
        notifier.updateLoading(false);
        items.clear();
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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

      if (!context.mounted) return;

      if (response['status'] == true) {
        notifier.updateLoading(false);

        context.pop();

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
        notifier.updateLoading(false);
        notifier.resetAll();

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      final notifiers = ref.read(reminderProvider.notifier);

      notifiers.updateLoading(false);

      notifiers.resetAll();
      if (!context.mounted) return;

      if (e.error is SocketException) {
        notifiers.updateLoading(false);

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
    } catch (e) {
      if (!context.mounted) return;

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
    }
  }

  Future<void> deActiveEventCode({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(getEventCodeProvider.notifier).refreshEventCode(context, ref);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        updateGenrateMemberIdLoading(false);

        resteRasion();
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> casetVote({
    required BuildContext context,
    required String id,
    required WidgetRef ref,
    required Map<String, dynamic> requestData,
  }) async {
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

      if (!context.mounted) return;

      if (response['status'] == true) {
        ref.read(electionProvider.notifier).clearAll();
        resteRasion();
        updateGenrateMemberIdLoading(false);
        ref.read(candidateProvider.notifier).refreshCandidate(context, ref);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        ref.read(electionProvider.notifier).clearAll();
        updateGenrateMemberIdLoading(false);

        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref.read(electionProvider.notifier).clearAll();

        resteRasion();
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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

      ref.read(electionProvider.notifier).clearAll();
    }
  }

  Future<void> payDueOutstanding({
    required BuildContext context,
    required List<int> selected_dues,
    required double totalAmout,
    required WidgetRef ref,
  }) async {
    updateGenrateMemberIdLoading(true);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .paydueOutStanding(
            selected_dues: selected_dues,
            totalAmout: totalAmout,

            context: context,
          );

      if (!context.mounted) return;

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
      } else {
        updateGenrateMemberIdLoading(false);

        context.pop();
        context.pushNamed(
          AppRoutes.paymentSuccess,
          extra: {"fails_succs": true, "ErrorMessage": response["message"]},
        );
      }
    } on DioException catch (e) {
      updateGenrateMemberIdLoading(false);
      resteRasion();
      final reportStatess = ref.watch(reportProvider.notifier);

      if (!context.mounted) return;
      reportStatess.resetState();

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
    } catch (e) {
      resteRasion();
      updateGenrateMemberIdLoading(false);
      final visitor = ref.watch(generateNotifierProvider.notifier);
      visitor.resetState();
      if (!context.mounted) return;
      context.pop();

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
    }
  }

  Future<void> initialisWalletFunding({
    required BuildContext context,
    required String paymentMethod,
    required String refrence,
    required double totalAmout,
    required WidgetRef ref,
  }) async {
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .initialisWalletFunding(
            Amout: totalAmout,
            paymentMethod: paymentMethod,
            paymentRefrenc: refrence,

            context: context,
          );

      if (!context.mounted) return;

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
      } else {
        updateGenrateMemberIdLoading(false);

        context.pop();

        final message = extractValidationMessage(response);

        showUserBottomSheet(
          context: context,
          headertitle: message,
          headersubtitle: "hellleo",
          ref: ref,
          bottom: BottomSheetView.paymentSuccess,
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
    } catch (e) {
      if (!context.mounted) return;
      context.pop();

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {}
  }

  Future<void> initialisMessage({
    required BuildContext context,
    required String message,
    required String id,
    required String type,
    required WidgetRef ref,
  }) async {
    updateInitMessageLoading(true);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .sendInitialMessage(
            message: message,
            type: type,
            id: id,
            context: context,
          );

      if (!context.mounted) return;

      if (response['success'] == true) {
        updateInitMessageLoading(false);

        final String message = response["message"] ?? "A/N";

        if (message.toLowerCase().contains("conversation already exists")) {
          final raw = response['data']["conversation"];
          final List participants = raw["participants"];

          final receiver = participants.firstWhere(
            (user) => user["user_id"].toString() == id.toString(),
          );

          final int convId = int.tryParse(raw["id"].toString()) ?? 0;

          context.pop();

          context.pushNamed(
            AppRoutes.messageBody,
            extra: {
              "id": convId,
              "username": receiver["full_name"] ?? "",
              "isOnline": receiver["online_status"] ?? "offline",
              "url": receiver["avatar_url"] ?? "",
              "userRole": receiver["role"] ?? "",
            },
          );
        } else {
          final raw = response['data']["conversation"];
          final List participants = raw["participants"];

          final receiver = participants.firstWhere(
            (user) => user["user_id"].toString() == id.toString(),
          );

          final int convId = int.tryParse(raw["id"].toString()) ?? 0;

          context.pop();

          context.pushNamed(
            AppRoutes.messageBody,
            extra: {
              "id": convId,
              "username": receiver["full_name"] ?? "",
              "isOnline": receiver["online_status"] ?? "offline",
              "url": receiver["avatar_url"] ?? "",
              "userRole": receiver["role"] ?? "",
            },
          );
        }
        showCustomSuccessToast(
          context: context,
          message:
              response['message']?.toString() ??
              "Chat initialized successfully!",
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        await ref
            .read(conversationListProvider.notifier)
            .refreshConversations();
      } else {
        updateInitMessageLoading(false);
        final message = extractValidationMessage(response);
       
        showCustomSuccessToast(
          context: context,
          message: message,
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
    } catch (e) {
      if (!context.mounted) return;
      context.pop();

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateInitMessageLoading(false);
    }
  }

  Future<void> markUnreadMessage({required WidgetRef ref}) async {
    try {
      final response =
          await ref.read(profileRepositoryProvider).markMessagCount();

      if (response['status'] == true) {
      } else {}
    } on DioException catch (e) {
      if (e.error is SocketException) {}
    } catch (e) {
    } finally {}
  }

  Future<void> markMessageRead({
    required WidgetRef ref,
    required int id,
  }) async {
    try {
      try {
        ref.read(messagesProvider(id).notifier).markMessagesAsReadLocally();
        ref
            .read(conversationListProvider.notifier)
            .markConversationAsReadLocally(id);
      } catch (e) {}

      final response = await ref
          .read(profileRepositoryProvider)
          .markMessageRead(id: id);
      if (response["success"] == true) {
        ref.read(conversationListProvider.notifier).refreshConversations();
        await ref.read(unreadCountsProvider.notifier).refreshCounts();
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {}
    } catch (e) {
    } finally {}
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
      final response = await ref
          .read(profileRepositoryProvider)
          .chattingSetting(
            id: id,
            dnd_duration_hours: dnd_duration_hours,
            do_not_disturb: do_not_disturb,
            context: context,
          );

      if (!context.mounted) return;

      if (response['success'] == true) {
        updateChatingLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        ref
            .read(getChatSettings(id).notifier)
            .refreshChatSetting(context, ref, id);
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
      updateChatingLoading(false);

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      updateChatingLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateChatingLoading(false);
    }
  }

  Future<void> signAgreement({
    required BuildContext context,
    required String signatur,
    required String fullName,
    required WidgetRef ref,
  }) async {
    updateTermsAndPropertyLoading(true);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .agreementsiging(
            signatur: signatur,
            fullName: fullName,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateTermsAndPropertyLoading(false);
        context.pop();
        ref.read(complianceprovider.notifier).refreshCompliance(context, ref);
        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      updateTermsAndPropertyLoading(false);

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
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
      final response = await ref
          .read(profileRepositoryProvider)
          .agreementAndTermsDecline(
            reason: reason,
            isProperty: isProperty,
            context: context,
          );

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateTermsAndPropertyLoading(false);

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      updateTermsAndPropertyLoading(false);

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateTermsAndPropertyLoading(false);
    }
  }

  Future<void> termsAndConditon({
    required BuildContext context,

    required WidgetRef ref,
  }) async {
    updateTermsAndPropertyLoading(true);
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .termsAndCondition(context: context);

      if (!context.mounted) return;

      if (response['status'] == true) {
        updateTermsAndPropertyLoading(false);
        context.pop();

        showCustomSuccessToast(
          context: context,
          message: response["message"],
          color: AppColors.instance.teal300,
          icon: Icons.check_circle,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
      } else {
        final message = extractValidationMessage(response);

        showCustomSuccessToast(
          context: context,
          message: message,
          color: AppColors.instance.error500,
          icon: Icons.error,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        updateTermsAndPropertyLoading(false);
      }
    } on DioException catch (e) {
      updateTermsAndPropertyLoading(false);

      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } catch (e) {
      updateTermsAndPropertyLoading(false);
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.error500,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
    } finally {
      updateTermsAndPropertyLoading(false);
    }
  }

  void _handleLoginError(BuildContext context, WidgetRef ref, String? message) {
    final errorMessage = message ?? "Unknown error";

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

  void _handleErrorResponse(
    BuildContext context,
    WidgetRef ref,
    String? message,
  ) {
    final errorMessage = message ?? "Unknown error";

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
    _resendTimer?.cancel();
    super.dispose();
  }
}

final formProvider = StateNotifierProvider<FormNotifier, FormStates>((ref) {
  return FormNotifier();
});
