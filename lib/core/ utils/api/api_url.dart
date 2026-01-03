const String estateCodeValidation = "/api/v1/auth/onboarding/validate-estate";
const String memberCodeValidation = "/api/v1/auth/onboarding/validate-member";
const String onbordinguserInfo =
    "/api/v1/auth/onboarding/complete-registration";
const String verifyOTPcodes = "/api/v1/auth/onboarding/verify-email";
const String requestOTPcodes = "/api/v1/auth/onboarding/resend-verification";
const String loginUrl = "/api/v1/auth/login";
const String forgetPass = "/api/v1/auth/forgot-password";
const String forgetpassOtpverify = "/api/v1/auth/verify-reset-code";
const String createNewpass = "/api/v1/auth/reset-password";
const String changetemporaryPass = "/api/v1/auth/change-password";
const String biometricLogin = "/api/v1/auth/biometric-login";
const String removedDeviceToken = "/api/v1/auth/device-tokens/1";
const String registerDeviceToken = "/api/v1/auth/device-tokens/register";
const String refresToken = "/api/v1/auth/refresh-token";
const String setUpBiometri = "/api/v1/auth/biometric/setup";
const String enableBiometric = "/api/v1/auth/biometric/disable";
//NEXT CREATE NEW PASSWORD API URL
const String onboardingHouseHold =
    "/api/v1/estates/owner-portal/households/onboarding";

const String markNotificationAsRead =
    "/api/v1/estates/general/notifications/mark-all-read";
const String markSingleNotificationAsRead =
    "/api/v1/estates/notifications/1/read";
// VIOLATION POST API LINK

const String creatViolation = "/api/v1/estates/general/violations/create";
const String updateViolation = "/api/v1/estates/general/violations/";
const String makeCommentViolation =
    "/api/v1/estates/general/violations/1/comments";

/// WORKODER POST

const String submitWorkOrder = "/api/v1/estates/general/workorders";

/// SETTING/PROFILE POST API

const String updateNotificationSetting =
    "/api/v1/estates/general/profile/settings/notifications";
const String updatePrivacySetting =
    "/api/v1/estates/general/profile/settings/privacy";
const String upadateSettingPreferences =
    "/api/v1/estates/general/profile/settings/preferences";

const String resetAllSetting =
    "/api/v1/estates/general/profile/settings/reset-defaults";
const String updateUserProfile = "/api/v1/estates/general/profile/update";
const String updateuserPicture =
    "/api/v1/estates/general/profile/upload-picture";
const String updateUserpassWord =
    "/api/v1/estates/general/profile/change-password";
const String accountDetactive = "/api/v1/estates/general/profile/deactivate";
// ADDHOUSEHOLD//SET PERMMISION/SET CURFEW/POST
const String addhousedHol =
    "/api/v1/estates/owner-portal/households/onboarding";

const String grantAccessPermission =
    "/api/v1/estates/owner-portal/households/members/permission/9/grant";
const String grantbuilkpermission =
    "/api/v1/estates/owner-portal/households/members/permission/9/bulk";
const String permissionRevoked =
    "/api/v1/estates/owner-portal/households/members/permission/9/revoke";
//MEMEBERID POST URL

const String generateMemberid =
    "/api/v1/estates/general/digital-member-id/generate";
const String regenerateMemberID =
    "/api/v1/estates/general/digital-member-id/regenerate";
const String deActiveMemberID =
    "/api/v1/estates/general/digital-member-id/deactivate";
const String reActiveMemberID =
    "/api/v1/estates/general/digital-member-id/reactivate";

/// GENERATE OTP FOR VISITOR POST URL

const String generateOtpWithValidator =
    "/api/v1/estates/general/visitor-otps/generate";
const String schedulOtp = "/api/v1/estates/general/visitor-otps/generate";
const String createinstantPermit =
    "/api/v1/estates/general/clearance-permits/create-for-otp";

/// PAYMENT POST API --------.

const String payduePayment = "/api/v1/estates/general/payments/pay-custom";
const String payFullPayment = "/api/v1/estates/general/payments/pay-full";
const String initialFundWallet =
    "/api/v1/estates/general/wallet/fund/initialize";

//SECURITY POST API URL

const String addviolationComment =
    "/api/v1/estates/general/violations/2/comments";
const String dismissedViolation =
    "/api/v1/estates/security/violations/1/dismiss";
const String validateOtpByManual =
    "/api/v1/estates/security/validations/validate-otp-manual";
const String validateOtpBybarcode =
    "/api/v1/estates/security/validations/validate-otp-barcode";
const String validateOtpByQr =
    "/api/v1/estates/security/validations/validate-otp-qr";
const String checkOutValidatorOtpBymanual =
    "/api/v1/estates/security/validations/checkout-with-otp";
const String checkInValidatorwithOtpbymanual =
    "/api/v1/estates/security/validations/validate-otp-manual";
const String ckeckOutWithPermit =
    "/api/v1/estates/security/clearance-permits/validate-checkout";
const String approveEntry = "/api/v1/estates/security/validations/5/approve";
const String denyEntry = "/api/v1/estates/security/validations/5/deny";
const String validateDigitaIDbyManul =
    "/api/v1/estates/security/digital-member-id/validate/manual";
const String validateDigitalIdByQrcode =
    "/api/v1/estates/security/digital-member-id/validate/qr-code";

const String validateVendorCodes =
    "/api/v1/estates/security/workorders/validate";

const String checkInWorkOrder = "/api/v1/estates/security/workorders/check-in";
const String checkOutWorkOrder =
    "/api/v1/estates/security/workorders/check-out";
const String validateWokers =
    "/api/v1/estates/security/workorders/validate-worker";
const String denyingAccess =
    "/api/v1/estates/security/workorders/deny-behavior";

/////. ALL GET APURL
///  /// SETTING/PROFILE GET API
const String getSettingPrivacy =
    "/api/v1/estates/general/profile/settings/privacy";
const String getAllSettingPreferences =
    "/api/v1/estates/general/profile/settings";
const String getSettingPreferences =
    "/api/v1/estates/general/profile/settings/preferences";
const String getUserprofile = "/api/v1/estates/general/profile";
const String getNotification =
    "/api/v1/estates/general/profile/settings/notifications";
const String appLogOut = "/api/v1/auth/logout";

const String getNotificationApi = "/api/v1/estates/general/notifications";

/// VIOLATION GET URL
const String listOfViolation = "/api/v1/estates/general/violations";

const String getSpesicificViolation = "/api/v1/estates/general/violations/1";
const String getViolationLocation =
    "/api/v1/estates/general/violations/locations";
const String getViolationCount = "/api/v1/estates/security/violations/counts";
const String getViolationCategorys =
    "/api/v1/estates/general/violations/categories";
const String getViolationComment =
    "/api/v1/estates/general/violations/1/comments";

const String getViolationHistotyStatus =
    "/api/v1/estates/general/violations/1/history";

/// GET ALL VISITO  ACCESS CODE/ GET PERMIT
const String getVisitorByfirter = "/api/v1/estates/general/visitor-otps";
const String getVisitorDetail = "/api/v1/estates/general/visitor-otps/1";
const String getWorkpermit =
    "/api/v1/estates/general/clearance-permits/my-permits";
// GET DIGITALID CODE

const String getDigitalIDCode =
    "/api/v1/estates/general/digital-member-id/printable";
const String activeCount = "/api/v1/estates/general/visitor-otps/counts/";

const String getDigitalStatus =
    "/api/v1/estates/general/digital-member-id/my-digital-id";
// ADDHOUSEHOLD//SET PERMMISION/SET CURFEW/GET
const String getHouseHold = "/api/v1/estates/owner-portal/households/members";
const String getPropertya =
    "/api/v1/estates/owner-portal/households/properties";
const String getPropeertyUser =
    "/api/v1/estates/owner-portal/households/property-users";

// VOTING UR
const String getVoteHistory = "/api/v1/estates/general/voting/history";
final String votingPoll = "/api/v1/estates/general/voting/polls?status=all";
const String votingSetting = "/api/v1/estates/general/voting/settings";

/// NOTIFICATION/REMINDER/EVENT
const String createReminder = "/api/v1/estates/general/reminders";
const String requestEventCode = "/api/v1/estates/general/event-codes/request";

const String notificationCount = "/api/v1/estates/general/notifications/count";
const String getCalenders = "/api/v1/estates/general/events/calendar";
const String getEventCodes = "/api/v1/estates/general/event-codes/my-codes";
const String getEventRsvp = "/api/v1/estates/general/events/my-rsvp";

/// REMOVE HOUSEOLD DELETE

/// REMOVE HOUSEOLD DELETE
const String removeHouseHold =
    "/api/v1/estates/owner-portal/households/members/23";

//// SECURITY GET API URL
const String getCheckInVisitor =
    "/api/v1/estates/security/validations/checked-in";
const String getCheckOutVisitor =
    "/api/v1/estates/security/validations/checked-out";
const String getPendingValidator =
    "/api/v1/estates/security/validations/pending";
const String getValidatorHistory =
    "/api/v1/estates/security/validations/history";
const String getAllviolation = "/api/v1/estates/general/violations";
const String deleteViolation = "/api/v1/estates/violations/4";

/// RESINDE/COMMITTEE
/// /api/v1/estates/general/committees
const String getCommitt = "/api/v1/estates/general/committees";
const String getResinde = "/api/v1/estates/general/directory";

// WORKODER GET API

const String getworkOrder = "/api/v1/estates/general/workorders";
const String workOrdercategorie =
    "/api/v1/estates/general/workorders/categories";
//// PAYMENT GET API

const String getPaymentDashbords = "/api/v1/estates/general/payments/dashboard";
const String getDuePayments =
    "/api/v1/estates/general/payments/outstanding-dues";
const String getWalletHistorys =
    "/api/v1/estates/general/wallet/history?type=credit";
const String getPaymentHistorys = "/api/v1/estates/general/payments/history";
const String getPaymentMethod =
    "/api/v1/estates/general/payment-config/methods";

const String emergencyContact =
    "/api/v1/estates/general/settings/user-management";
/// CHATING URL

/// GET API
const String getAvailableAdmin = "/api/v1/estates/general/messaging/contacts/admins";
const String getAvailabeCommeti =
    "/api/v1/estates/general/messaging/contacts/committee";
const String getAvailableScurity =
    "/api/v1/estates/general/messaging/contacts/security";
const String getAvailableConversation = "/api/v1/estates/general/messaging/conversations";
const String getUnredCounts =
    "/api/v1/estates/general/messaging/unread-counts";

/// POST API
const String startConversation = "/api/v1/estates/general/messaging/conversations/start";
const String markUnreadCount =
    "/api/v1/estates/general/messaging/mark-all-read";
// const String getPaymentHistorys = "/api/v1/estates/general/payments/history";
// const String getPaymentMethod =
//     "/api/v1/estates/general/payment-config/methods";
// const String getPaymentHistorys = "/api/v1/estates/general/payments/history";
// const String getPaymentMethod =
//     "/api/v1/estates/general/payment-config/methods";