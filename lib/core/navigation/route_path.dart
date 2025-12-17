class AppRoutes {
  // ------------------------------------------------------------------
  // Initialization Flow (Keep your exact names)
  static const String estatateOnbording = '/';
  static const String estateCodeVerificationScreen = 'codeverify';
  static const String confirmInfomation = 'Onbordinfo';
  static const String estategetstart = 'estate';

  // ------------------------------------------------------------------
  // Auth Flow (Grouped with prefix)
  static const String signIN = 'auth_signIn';
  static const String passForgot = 'auth_passForgot';
  static const String passReset = 'auth_resetPass';
  static const String changeTemporarypass = 'auth_temp_pass';
  static const String oTPCode = 'auth_otpCode';
  static const String activateOTP = 'auth_activateOtp';
  static const String passRestOtpVerify = 'pass_otp_verify';

  static const String splasScreen = '/splac_page';

  // ------------------------------------------------------------------
  // Member Management (Your original names + slight grouping)
  static const String memberIdCheck = 'member_idCheck';
  static const String getMemberInfo = 'member_info';
  static const String memberPassCreated = 'pass_created';
  static const String manageLoging = 'login_setting';
  static const String selectedMemeber = 'member_selected';
  static const String filleMemberInfo = 'member_fillInfo';
  static const String residentDirectory = 'resident';
  // static const String memeberPage = 'member_page';

  // ------------------------------------------------------------------
  // Estate Operations (Keep your exact flat names)
  static const String addHoused_CoOnwner = 'addMembers';
  static const String dashbord = 'dashboard';
  static const String electionDasbord = "election_dashbord";
  static const String eventSet = 'eventSet';
  static const String userNotificationSetting = "notification_settings";
  // static const String termsOfService = "termsOfservices";
  static const String setPreferences = "setPreferencess";
  static const String setPrivacy = "setPrivacy";
  static const String notification = "notification";
  static const String securitynotification = "securitynotification";
  // ------------------------------------------------------------------

  //SECUTIY PATH
  static const String securityguide = 'security';
  static const String securityViolationDeatails = "violation_details_s";
  // ------------------------------------------------------------------
  // Digital Features
  static const String digitalIDStarter = 'digitalID_starter';
  static const String digitalIDMember = 'digitalID';
  static const String digitalIDsuccessScreen = 'digitalID_success';

  // ------------------------------------------------------------------
  // Vendor/Visitor (Grouped)
  static const String vendorAccessCode = 'vendor_accessCode';
  static const String vendorLog = 'vendor_log';
  static const String visitorAccessCode = 'visitor_accessCode';
  static const String violation = 'violation';
  static const String workSubmit = 'Add_workOrder';
  static const String workOrder = 'workOrder';

  // ------------------------------------------------------------------
  // Payments (Grouped)
  static const String paymentMethod = 'payment_method';
  static const String virtualAccount = 'payment_virtualAccount';
  static const String paymentReview = 'payment_review';
  static const String payallduePayment = 'due_payAll';

  static const String paymentSuccess = 'payment_success';
  static const String selectedDueTopay = 'payment_due';
  static const String paymentHistory = 'payment_history';
}
