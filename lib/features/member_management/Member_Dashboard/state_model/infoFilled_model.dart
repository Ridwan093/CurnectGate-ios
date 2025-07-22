import 'dart:typed_data';

class FormStates {
  final bool firstNameValid;
  final bool lastNameValid;
  final bool emailValid;
  final bool phoneValid;
  final bool newpassValid;
  final bool confirmpassValid;
  final bool? currentPassVaalid;
  final bool notificationsettingerror;
  final bool privacysettingerror;
  final bool prvencyettingerror;
  final bool allNotificationsettingerror;
  final bool indicatorCheck;
  final bool loginLodaing;
  final bool estateIdCheckLoadin;
  final bool memberIdcheckLoading;
  final bool creatPassLoading;
  final bool otpVerifyLoading;
  final bool changPassLoading;
  final bool forgetPaSsLoading;
  final bool forgotOtpLoading;
  final bool changTemporyPassLoading;
  final bool logOutLoading;
  final bool notificationSettingLoading;
  final bool prevencyLoading;
  final bool privacyLoading;
  final bool reportLoading;
  final bool commentLoading;
  final bool changProfileInfoLoading;
  final bool changProfilePicLoading;
  final bool changProfilePassLoading;
  final bool deActivatAccountLoading;
  final bool schedulOtpLoading;
  final bool generateOtpWithValidatorLoading;
  final bool revokOtpLoading;
  final bool generateMemberIdLoading;

  final String otp;
  final bool isOtpComplete;

  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? pass;
  final String? oTpCode;
  final String? gender;
  final String createNewpass;
  final String confirmNewpass;
  final String? currentPass;
  final String? digiterReason;

  final String? fromTime;
  final String? toTime;

  final bool isResendOtpEnabled; // New: Tracks if resend button is enabled
  final int resendCountdownTime; // New: Tracks remaining seconds

  final bool agreedToTerms;
  final bool passValid;
  final Uint8List? profileImage; // Add this field
  final String? profileImagePath; // Optional: store file path
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  const FormStates({
    this.schedulOtpLoading = false,
    this.generateOtpWithValidatorLoading = false,
    this.revokOtpLoading = false,
    this.currentPassVaalid = false,
    this.indicatorCheck = false,
    this.fromTime = '',
    this.toTime = "",
    this.oTpCode = "",
    this.pass = '',
    this.otp = '',
    this.createNewpass = '',
    this.confirmNewpass = "",
    this.currentPass = '',
    this.digiterReason = "",

    this.isResendOtpEnabled = true,
    this.resendCountdownTime = 30,
    this.privacysettingerror = false,
    this.prvencyettingerror = false,
    this.allNotificationsettingerror = false,
    this.notificationsettingerror = false,
    this.isOtpComplete = false,
    this.passValid = false,
    this.agreedToTerms = false,
    this.firstNameValid = false,
    this.lastNameValid = false,
    this.emailValid = false,
    this.phoneValid = false,
    this.logOutLoading = false,
    this.notificationSettingLoading = false,
    this.prevencyLoading = false,
    this.privacyLoading = false,
    this.reportLoading = false,
    this.commentLoading = false,
    this.changProfileInfoLoading = false,
    this.changProfilePicLoading = false,
    this.changProfilePassLoading = false,
    this.deActivatAccountLoading = false,
    this.generateMemberIdLoading = false,

    this.hasMinLength = false,
    this.hasNumber = false,
    this.hasSpecialChar = false,
    this.confirmpassValid = false,
    this.newpassValid = false,
    this.loginLodaing = false,
    this.estateIdCheckLoadin = false,
    this.memberIdcheckLoading = false,
    this.creatPassLoading = false,
    this.otpVerifyLoading = false,
    this.changPassLoading = false,
    this.forgetPaSsLoading = false,
    this.forgotOtpLoading = false,
    this.changTemporyPassLoading = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.gender,
    this.profileImage,
    this.profileImagePath,
  });
  bool get allNewpassValid => newpassValid && confirmpassValid;
  bool get alltemptpassValid =>
      newpassValid && confirmpassValid && currentPassVaalid!;
  bool get allValidAddmember =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      profileImage != null;

  bool get singinValid => emailValid && passValid && profileImage != null;
  bool get allValid =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      gender?.isNotEmpty == true &&
      agreedToTerms;

  FormStates copyWith({
    bool? schedulOtpLoading,
    bool? generateOtpWithValidatorLoading,
    bool? generateMemberIdLoading,
    bool? revokOtpLoading,
    bool? currentPassVaalid,
    bool? loginLodaing,
    bool? estateIdCheckLoadin,
    bool? memberIdcheckLoading,
    bool? creatPassLoading,
    bool? otpVerifyLoading,
    bool? changPassLoading,
    bool? forgetPaSsLoading,
    bool? forgotOtpLoading,
    bool? changTemporyPassLoading,
    bool? passValid,
    bool? agreedToTerms,
    bool? firstNameValid,
    bool? lastNameValid,
    bool? emailValid,
    bool? phoneValid,
    bool? logOutLoading,
    bool? notificationSettingLoading,
    bool? prevencyLoading,
    bool? privacyLoading,
    bool? reportLoading,
    bool? commentLoading,
    bool? changProfileInfoLoading,
    bool? changProfilePicLoading,
    bool? changProfilePassLoading,
    bool? deActivatAccountLoading,
    bool? hasMinLength,
    bool? hasNumber,
    bool? hasSpecialChar,
    bool? isOtpComplete,
    bool? newpassValid,
    bool? confirmpassValid,
    bool? notificationsettingerror,
    bool? privacysettingerror,
    bool? prvencyettingerror,
    bool? allNotificationsettingerror,
    bool? indicatorCheck,

    String? createNewpass,
    String? confirmNewpass,
    String? otp,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
    String? gender,
    String? pass,
    String? oTpCode,
    String? fromTime,
    String? toTime,
    String? digiterReason,
    Uint8List? profileImage,
    String? profileImagePath,
    String? currentPass,
    bool? isResendOtpEnabled,
    int? resendCountdownTime,
  }) {
    return FormStates(
      digiterReason: digiterReason ?? this.digiterReason,
      generateMemberIdLoading:
          generateMemberIdLoading ?? this.generateMemberIdLoading,
      indicatorCheck: indicatorCheck ?? this.indicatorCheck,
      currentPassVaalid: currentPassVaalid ?? this.currentPassVaalid,
      currentPass: currentPass ?? this.currentPass,
      revokOtpLoading: revokOtpLoading ?? this.revokOtpLoading,
      generateOtpWithValidatorLoading:
          generateOtpWithValidatorLoading ??
          this.generateOtpWithValidatorLoading,
      schedulOtpLoading: schedulOtpLoading ?? this.schedulOtpLoading,
      logOutLoading: logOutLoading ?? this.logOutLoading,
      notificationSettingLoading:
          notificationSettingLoading ?? this.notificationSettingLoading,
      prevencyLoading: prevencyLoading ?? this.prevencyLoading,
      privacyLoading: privacyLoading ?? this.privacyLoading,
      reportLoading: reportLoading ?? this.reportLoading,
      commentLoading: commentLoading ?? this.commentLoading,
      changProfileInfoLoading:
          changProfileInfoLoading ?? this.changProfileInfoLoading,
      changProfilePicLoading:
          changProfilePicLoading ?? this.changProfilePicLoading,
      changProfilePassLoading:
          changProfilePassLoading ?? this.changProfilePassLoading,
      deActivatAccountLoading:
          deActivatAccountLoading ?? this.deActivatAccountLoading,
      loginLodaing: loginLodaing ?? this.loginLodaing,
      estateIdCheckLoadin: estateIdCheckLoadin ?? this.estateIdCheckLoadin,
      memberIdcheckLoading: memberIdcheckLoading ?? this.memberIdcheckLoading,

      creatPassLoading: creatPassLoading ?? this.creatPassLoading,
      otpVerifyLoading: otpVerifyLoading ?? this.otpVerifyLoading,
      changPassLoading: changPassLoading ?? this.changPassLoading,
      forgetPaSsLoading: forgetPaSsLoading ?? this.forgetPaSsLoading,
      forgotOtpLoading: forgotOtpLoading ?? this.forgotOtpLoading,
      changTemporyPassLoading:
          changTemporyPassLoading ?? this.changTemporyPassLoading,
      notificationsettingerror:
          notificationsettingerror ?? this.notificationsettingerror,
      allNotificationsettingerror:
          allNotificationsettingerror ?? this.allNotificationsettingerror,
      privacysettingerror: privacysettingerror ?? this.privacysettingerror,
      prvencyettingerror: prvencyettingerror ?? this.prvencyettingerror,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      otp: otp ?? this.otp,
      isOtpComplete: isOtpComplete ?? this.isOtpComplete,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasNumber: hasNumber ?? this.hasNumber,
      hasSpecialChar: hasSpecialChar ?? this.hasSpecialChar,
      passValid: passValid ?? this.passValid,
      firstNameValid: firstNameValid ?? this.firstNameValid,
      lastNameValid: lastNameValid ?? this.lastNameValid,
      emailValid: emailValid ?? this.emailValid,
      phoneValid: phoneValid ?? this.phoneValid,

      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      gender: gender ?? this.gender,
      pass: pass ?? this.pass,
      oTpCode: oTpCode ?? this.oTpCode,
      confirmNewpass: confirmNewpass ?? this.confirmNewpass,
      createNewpass: createNewpass ?? this.confirmNewpass,
      profileImage: profileImage ?? this.profileImage,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      isResendOtpEnabled: isResendOtpEnabled ?? this.isResendOtpEnabled,
      resendCountdownTime: resendCountdownTime ?? this.resendCountdownTime,
      newpassValid: newpassValid ?? this.newpassValid,
      confirmpassValid: confirmpassValid ?? this.confirmpassValid,
    );
  }
}
