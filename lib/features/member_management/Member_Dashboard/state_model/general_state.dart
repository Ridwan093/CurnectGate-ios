import 'dart:typed_data';

class FormStates {
  final bool firstNameValid;
  final bool lastNameValid;
  final bool emailValid;
  final bool phoneValid;
  final bool newpassValid;
  final bool confirmpassValid;
  final bool emenergencyNameValid;
  final bool emergencyContactValid;
  final bool yearofExpirenceValid;
  final bool ocupationValid;
  final bool emenergencyRoleValid;
  final bool montlyIconValid;
  final bool employerValid;

  final bool rentalfrequencyValid;
  final bool agentFeeValid;
  final bool securityFeesValid;

  final bool desginationValid;
  final bool educationlevelValid;
  final bool specializeValid;
  final bool certificatteValid;
  final bool timeStateValid;
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
  final bool workOderLoading;
  final bool? facilityLoading;
  final bool? curfewLoading;
  final bool? gateAccessLoading;
  final bool? communityAccessLoading;
  final bool? nightAccessLoading;
  final bool? parkingAccessLoading;
  final bool? visitorAccessLoading;
  final bool? basicPermissionLoading;
  final bool? termsAndCondintionLoading;
  final bool schedulOtpLoading;
  final bool generateOtpWithValidatorLoading;
  final bool revokOtpLoading;
  final bool generateMemberIdLoading;
  final bool addHouseHoldLoading;
  final bool? removedHouseHoldLoading;
  final String? restrictionReasion;
  final bool? restrictionValue;
  final String? restrictionHours;
  final String? restrictionDays;
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
  final String? educationLevel;
  final String? ocupation;
  final String? emenergencyRole;
  final String? montlyIcom;
  final String? employer;
  final String? propertyId;
  final String? property;
  final String? rentalfrequency;
  final String? agentFee;
  final String? securityFees;
  final String? yearofExperecnandeducation;
  final List<String> specializations;
  final List<String> certifications;
  final String? startdate;

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

  FormStates({
    this.ocupationValid = false,
    this.emenergencyRoleValid = false,
    this.montlyIconValid = false,
    this.employerValid = false,
    this.facilityLoading = false,
    this.curfewLoading = false,
    this.gateAccessLoading = false,
    this.communityAccessLoading = false,
    this.nightAccessLoading = false,
    this.parkingAccessLoading = false,
    this.visitorAccessLoading = false,
    this.basicPermissionLoading = false,
    this.rentalfrequencyValid = false,
    this.agentFeeValid = false,
    this.securityFeesValid = false,
    this.emenergencyNameValid = false,
    this.emergencyContactValid = false,
    this.yearofExpirenceValid = false,
    this.desginationValid = false,
    this.educationlevelValid = false,
    this.specializeValid = false,
    this.certificatteValid = false,
    this.timeStateValid = false,
    this.removedHouseHoldLoading = false,
    this.addHouseHoldLoading = false,
    this.schedulOtpLoading = false,
    this.generateOtpWithValidatorLoading = false,
    this.revokOtpLoading = false,
    this.currentPassVaalid = false,
    this.indicatorCheck = false,
    this.restrictionValue = false,
    this.restrictionReasion = "",

    this.restrictionHours = '',
    this.restrictionDays = "",
    this.propertyId = "",
    this.fromTime = '',
    this.toTime = "",
    this.oTpCode = "",
    this.pass = '',
    this.otp = '',
    this.createNewpass = '',
    this.confirmNewpass = "",
    this.currentPass = '',
    this.digiterReason = "",
    this.educationLevel = "",
    this.ocupation = "",
    this.emenergencyRole = "",
    this.montlyIcom = "",
    this.employer = "",
    this.property = "",
    this.rentalfrequency = "",
    this.agentFee = "",
    this.securityFees = "",
    this.specializations = const [],
    this.certifications = const [],
    this.startdate = "",
    this.yearofExperecnandeducation = "",

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
    this.workOderLoading = false,

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
    this.termsAndCondintionLoading = false,
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
      propertyId!.isNotEmpty &&
      lastNameValid &&
      emailValid &&
      phoneValid;

  bool get allValidAddmembermanager =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      propertyId!.isNotEmpty &&
      emenergencyNameValid &&
      emergencyContactValid &&
      yearofExpirenceValid &&
      desginationValid &&
      educationlevelValid &&
      timeStateValid;

  bool get allValidAddTenant =>
      firstNameValid &&
      lastNameValid &&
      (propertyId ?? "").isNotEmpty &&
      emailValid &&
      phoneValid &&
      emenergencyNameValid &&
      emergencyContactValid &&
      emenergencyRoleValid &&
      ocupationValid &&
      timeStateValid &&
      employerValid;

  bool get singinValid => emailValid && passValid && profileImage != null;
  bool get allValid =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      gender?.isNotEmpty == true &&
      agreedToTerms;

  FormStates copyWith({
    bool? facilityLoading,
    bool? curfewLoading,
    bool? gateAccessLoading,
    bool? communityAccessLoading,
    bool? nightAccessLoading,

    bool? parkingAccessLoading,
    bool? termsAndCondintionLoading,
    bool? workOderLoading,
    bool? visitorAccessLoading,
    bool? basicPermissionLoading,
    bool? emenergencyNameValid,
    bool? emergencyContactValid,
    bool? yearofExpirenceValid,
    bool? desginationValid,
    bool? educationlevelValid,
    bool? specializeValid,
    bool? certificatteValid,
    bool? timeStateValid,
    bool? schedulOtpLoading,
    bool? generateOtpWithValidatorLoading,
    bool? generateMemberIdLoading,
    bool? addHouseHoldLoading,
    bool? revokOtpLoading,
    bool? removedHouseHoldLoading,
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
    bool? chattingLoading,
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
    bool? ocupationValid,
    bool? emenergencyRoleValid,
    bool? montlyIconValid,
    bool? employerValid,

    bool? rentalfrequencyValid,
    bool? agentFeeValid,
    bool? securityFeesValid,

    String? educationLevel,
    String? yearofExperecnandeducation,
    List<String>? specializations,
    List<String>? certifications,
    String? propertyId,
    String? property,
    String? startdate,
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
    String? ocupation,
    String? emenergencyRole,
    String? montlyIcom,
    String? employer,
    String? restrictionReasion,
    bool? restrictionValue,
    String? restrictionHours,
    String? restrictionDays,
    String? rentalfrequency,
    String? agentFee,
    String? securityFees,
    Uint8List? profileImage,
    String? profileImagePath,
    String? currentPass,
    bool? isResendOtpEnabled,
    int? resendCountdownTime,
  }) {
    return FormStates(
      termsAndCondintionLoading:
          termsAndCondintionLoading ?? this.termsAndCondintionLoading,
      workOderLoading: workOderLoading ?? this.workOderLoading,
      facilityLoading: facilityLoading ?? this.facilityLoading,
      curfewLoading: curfewLoading ?? this.curfewLoading,
      gateAccessLoading: gateAccessLoading ?? this.gateAccessLoading,
      communityAccessLoading:
          communityAccessLoading ?? this.communityAccessLoading,
      nightAccessLoading: nightAccessLoading ?? this.nightAccessLoading,

      parkingAccessLoading: parkingAccessLoading ?? this.parkingAccessLoading,

      visitorAccessLoading: visitorAccessLoading ?? this.visitorAccessLoading,
      basicPermissionLoading:
          basicPermissionLoading ?? this.basicPermissionLoading,
      restrictionReasion: restrictionReasion ?? this.restrictionReasion,
      restrictionValue: restrictionValue ?? this.restrictionValue,
      restrictionHours: restrictionHours ?? this.restrictionHours,
      restrictionDays: restrictionDays ?? this.restrictionDays,
      propertyId: propertyId ?? this.propertyId,
      property: property ?? this.property,
      ocupationValid: ocupationValid ?? this.ocupationValid,
      emenergencyRoleValid: emenergencyRoleValid ?? this.emenergencyRoleValid,
      montlyIconValid: montlyIconValid ?? this.montlyIconValid,
      employerValid: employerValid ?? this.employerValid,
      rentalfrequencyValid: rentalfrequencyValid ?? this.rentalfrequencyValid,
      agentFeeValid: agentFeeValid ?? this.agentFeeValid,
      securityFeesValid: securityFeesValid ?? this.securityFeesValid,
      ocupation: ocupation ?? this.ocupation,
      emenergencyRole: emenergencyRole ?? this.emenergencyRole,
      montlyIcom: montlyIcom ?? this.montlyIcom,
      employer: employer ?? this.employer,
      agentFee: agentFee ?? this.agentFee,
      securityFees: securityFees ?? this.securityFees,
      rentalfrequency: rentalfrequency ?? this.rentalfrequency,
      specializations: specializations ?? this.specializations,
      certifications: certifications ?? this.certifications,
      startdate: startdate ?? this.startdate,
      educationLevel: educationLevel ?? this.educationLevel,
      yearofExperecnandeducation:
          yearofExperecnandeducation ?? this.yearofExperecnandeducation,

      emenergencyNameValid: emenergencyNameValid ?? this.emenergencyNameValid,
      emergencyContactValid:
          emergencyContactValid ?? this.emergencyContactValid,
      yearofExpirenceValid: yearofExpirenceValid ?? this.yearofExpirenceValid,
      desginationValid: desginationValid ?? this.desginationValid,
      educationlevelValid: educationlevelValid ?? this.educationlevelValid,
      specializeValid: specializeValid ?? this.specializeValid,
      certificatteValid: certificatteValid ?? this.certificatteValid,
      timeStateValid: timeStateValid ?? this.timeStateValid,
      removedHouseHoldLoading:
          removedHouseHoldLoading ?? this.removedHouseHoldLoading,
      addHouseHoldLoading: addHouseHoldLoading ?? this.addHouseHoldLoading,
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
      privacyLoading: chattingLoading ?? this.privacyLoading,
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
