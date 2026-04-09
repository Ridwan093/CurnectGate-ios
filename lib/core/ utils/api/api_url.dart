const String estateCodeValidation = "auth/onboarding/validate-estate";
const String memberCodeValidation = "auth/onboarding/validate-member";
const String onbordinguserInfo = "auth/onboarding/complete-registration";
const String verifyOTPcodes = "auth/onboarding/verify-email";
const String requestOTPcodes = "auth/onboarding/resend-verification";
const String loginUrl = "auth/login";
const String forgetPass = "auth/forgot-password";
const String forgetpassOtpverify = "auth/verify-reset-code";
const String createNewpass = "auth/reset-password";
const String changetemporaryPass = "auth/change-password";
const String biometricLogin = "auth/biometric-login";
const String removedDeviceToken = "auth/device-tokens/1";
const String registerDeviceToken = "auth/device-tokens/register";
const String refresToken = "auth/refresh-token";
const String setUpBiometri = "auth/biometric/setup";
const String enableBiometric = "auth/biometric/disable";
const String reverb = "config/reverb";
const String sliderEnpoint = "app-sliders";

const String onboardingHouseHold = "estates/owner-portal/households/onboarding";

const String aGREEMENT = "estates/general/agreements";
const String agreementSign = "estates/general/agreements/sign-property";
const String termAccept = "estates/general/agreements/accept-terms";
const String decline = "estates/general/agreements/decline";
const String compliance = "estates/general/agreements/status";
const String markNotificationAsRead =
    "estates/general/notifications/mark-all-read";
const String markSingleNotificationAsRead = "estates/notifications/1/read";

const String creatViolation = "estates/general/violations/create";
const String updateViolation = "estates/general/violations/";
const String makeCommentViolation = "estates/general/violations/1/comments";

const String submitWorkOrder = "estates/general/workorders";

const String updateNotificationSetting =
    "estates/general/profile/settings/notifications";
const String updatePrivacySetting = "estates/general/profile/settings/privacy";
const String upadateSettingPreferences =
    "estates/general/profile/settings/preferences";

const String resetAllSetting =
    "estates/general/profile/settings/reset-defaults";
const String updateUserProfile = "estates/general/profile/update";
const String updateuserPicture = "estates/general/profile/upload-picture";
const String updateUserpassWord = "estates/general/profile/change-password";
const String accountDetactive = "estates/general/profile/deactivate";
const String addhousedHol = "estates/owner-portal/households/onboarding";

const String grantAccessPermission =
    "estates/owner-portal/households/members/permission/9/grant";
const String grantbuilkpermission =
    "estates/owner-portal/households/members/permission/9/bulk";
const String permissionRevoked =
    "estates/owner-portal/households/members/permission/9/revoke";

const String generateMemberid = "estates/general/digital-member-id/generate";
const String regenerateMemberID =
    "estates/general/digital-member-id/regenerate";
const String deActiveMemberID = "estates/general/digital-member-id/deactivate";
const String reActiveMemberID = "estates/general/digital-member-id/reactivate";

const String generateOtpWithValidator = "estates/general/visitor-otps/generate";
const String schedulOtp = "estates/general/visitor-otps/generate";
const String createinstantPermit =
    "estates/general/clearance-permits/create-for-otp";

const String payduePayment = "estates/general/payments/pay-custom";
const String payFullPayment = "estates/general/payments/pay-full";
const String initialFundWallet = "estates/general/wallet/fund/initialize";

const String addviolationComment = "estates/general/violations/2/comments";
const String dismissedViolation = "estates/security/violations/1/dismiss";
const String validateOtpByManual =
    "estates/security/validations/validate-otp-manual";
const String validateOtpBybarcode =
    "estates/security/validations/validate-otp-barcode";
const String validateOtpByQr = "estates/security/validations/validate-otp-qr";
const String checkOutValidatorOtpBymanual =
    "estates/security/validations/checkout-with-otp";
const String checkInValidatorwithOtpbymanual =
    "estates/security/validations/validate-otp-manual";
const String ckeckOutWithPermit =
    "estates/security/clearance-permits/validate-checkout";
const String approveEntry = "estates/security/validations/5/approve";
const String denyEntry = "estates/security/validations/5/deny";
const String validateDigitaIDbyManul =
    "estates/security/digital-member-id/validate/manual";
const String validateDigitalIdByQrcode =
    "estates/security/digital-member-id/validate/qr-code";

const String validateVendorCodes = "estates/security/workorders/validate";

const String checkInWorkOrder = "estates/security/workorders/check-in";
const String checkOutWorkOrder = "estates/security/workorders/check-out";
const String validateWokers = "estates/security/workorders/validate-worker";
const String denyingAccess = "estates/security/workorders/deny-behavior";

const String getSettingPrivacy = "estates/general/profile/settings/privacy";
const String getAllSettingPreferences = "estates/general/profile/settings";
const String getSettingPreferences =
    "estates/general/profile/settings/preferences";
const String getUserprofile = "estates/general/profile";
const String getNotification = "estates/general/profile/settings/notifications";
const String appLogOut = "auth/logout";

const String getNotificationApi = "estates/general/notifications";

const String listOfViolation = "estates/general/violations";

const String getSpesicificViolation = "estates/general/violations/1";
const String getViolationLocation = "estates/general/violations/locations";
const String getViolationCount = "estates/security/violations/counts";
const String getViolationCategorys = "estates/general/violations/categories";
const String getViolationComment = "estates/general/violations/1/comments";

const String getViolationHistotyStatus = "estates/general/violations/1/history";

const String getVisitorByfirter = "estates/general/visitor-otps";
const String getVisitorDetail = "estates/general/visitor-otps/1";
const String getWorkpermit = "estates/general/clearance-permits/my-permits";
const String getActivePermit = "estates/general/clearance-permits/active-otps";

const String getDigitalIDCode = "estates/general/digital-member-id/printable";
const String activeCount = "estates/general/visitor-otps/counts/";

const String getDigitalStatus =
    "estates/general/digital-member-id/my-digital-id";
const String getHouseHold = "estates/owner-portal/households/members";
const String getPropertya = "estates/owner-portal/households/properties";
const String getPropeertyUser =
    "estates/owner-portal/households/property-users";

const String getVoteHistory = "estates/general/voting/history";
final String votingPoll = "estates/general/voting/polls?status=all";
const String votingSetting = "estates/general/voting/settings";

const String createReminder = "estates/general/reminders";
const String requestEventCode = "estates/general/event-codes/request";

const String notificationCount = "estates/general/notifications/count";
const String getCalenders = "estates/general/events/calendar";
const String getEventCodes = "estates/general/event-codes/my-codes";
const String getEventRsvp = "estates/general/events/my-rsvp";

const String removeHouseHold = "estates/owner-portal/households/members/23";

const String getCheckInVisitor = "estates/security/validations/checked-in";
const String getCheckOutVisitor = "estates/security/validations/checked-out";
const String getPendingValidator = "estates/security/validations/pending";
const String getValidatorHistory = "estates/security/validations/history";
const String getAllviolation = "estates/general/violations";
const String deleteViolation = "estates/violations/4";
const String getDutys = "estates/security/duty/current";

const String getCommitt = "estates/general/committees";
const String getResinde = "estates/general/directory";

const String getworkOrder = "estates/general/workorders";
const String workOrdercategorie = "estates/general/workorders/categories";

const String getPaymentDashbords = "estates/general/payments/dashboard";
const String getDuePayments = "estates/general/payments/outstanding-dues";
const String getWalletHistorys = "estates/general/wallet/history?type=credit";
const String getPaymentHistorys = "estates/general/payments/history";
const String getPaymentMethod = "estates/general/payment-config/methods";

const String emergencyContact = "estates/general/settings/user-management";

const String getAvailableAdmin = "estates/general/messaging/contacts/admins";
const String getAvailabeCommeti =
    "estates/general/messaging/contacts/committee";
const String getAvailableScurity =
    "estates/general/messaging/contacts/security";
const String getAvailableConversation =
    "estates/general/messaging/conversations";
const String getUnredCounts = "estates/general/messaging/unread-counts";

const String startConversation =
    "estates/general/messaging/conversations/start";
const String markUnreadCount = "estates/general/messaging/mark-all-read";
const String getConversation = "estates/general/messaging/conversations";
