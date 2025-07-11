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
//NEXT CREATE NEW PASSWORD API URL
const String onboardingHouseHold =
    "/api/v1/estates/owner-portal/households/onboarding";

/// SETTING/PROFILE POST API

const String updateNotificationSetting =
    "/api/v1/estates/general/profile/settings/notifications";
const String updatePrivacySetting =
    "api/v1/estates/general/profile/settings/privacy";
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

/// GENERATE OTP FOR VISITOR POST URL

const String generateOtpWithValidator =
    "/api/v1/estates/general/visitor-otps/generate";
const String schedulOtp = "/api/v1/estates/visitor-otps/generate";
const String revorkOtp = "/api/v1/estates/general/visitor-otps/1/revoke";
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
