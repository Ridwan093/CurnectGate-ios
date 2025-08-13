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
const String checkOutValidatorwithOtpbymanual =
    "/api/v1/estates/security/validations/5/checkout";
const String approveEntry = "/api/v1/estates/security/validations/5/approve";
const String denyEntry = "/api/v1/estates/security/validations/5/deny";
const String validateDigitaIDbyManul =
    "/api/v1/estates/security/digital-member-id/validate/manual";
const String validateDigitalIdByQrcode =
    "/api/v1/estates/security/digital-member-id/validate/qr-code";

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

const String getViolationCategorys =
    "/api/v1/estates/general/violations/categories";
const String getViolationComment =
    "/api/v1/estates/general/violations/1/comments";

const String getViolationHistotyStatus =
    "/api/v1/estates/general/violations/1/history";

/// GET ALL VISITO  ACCESS CODE
const String getVisitorByfirter = "/api/v1/estates/general/visitor-otps";
const String getVisitorDetail = "/api/v1/estates/general/visitor-otps/1";
// GET DIGITALID CODE

const String getDigitalIDCode =
    "/api/v1/estates/general/digital-member-id/printable";
// ADDHOUSEHOLD//SET PERMMISION/SET CURFEW/GET
const String getHouseHold = "/api/v1/estates/owner-portal/households/members";
const String getPropertya =
    "/api/v1/estates/owner-portal/households/properties";
const String getPropeertyUser =
    "/api/v1/estates/owner-portal/households/property-users";
const String getmemberpermission =
    "/api/v1/estates/owner-portal/households/memebers/permission/9";
const String getstatisticStatus =
    "/api/v1/estates/owner-portal/households/members/permission/8/status";
const String getstatistic =
    "/api/v1/estates/owner-portal/households/members/permission/8/status";

/// REMOVE HOUSEOLD DELETE

/// REMOVE HOUSEOLD DELETE
const String removeHouseHold =
    "/api/v1/estates/owner-portal/households/members/23";

//// SECURITY GET API URL
const String getCheckInVisitor =
    "/api/v1/estates/security/validations/checked-in";
const String getPendingValidator =
    "/api/v1/estates/security/validations/pending";
const String getValidatorHistory =
    "/api/v1/estates/security/validations/history";
const String getAllviolation = "/api/v1/estates/general/violations";
const String deleteViolation = "/api/v1/estates/violations/4";
