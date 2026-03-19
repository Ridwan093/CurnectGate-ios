// shared_prefs_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:curnectgate/features/%20operations/property_agreement/model/agreements_response.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/compliance/compliance_response.dart';
import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committees_response_model.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/auth/data/auth_model/get_start_model/onboarding_slider_response.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableAdmin/estate_admins_response.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableCommitte/committee_members_response.dart';
import 'package:curnectgate/features/chat/data/model/get_model/conversation_settings_response.dart';
import 'package:curnectgate/features/chat/data/provider/reverb_provider.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate/candidates_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/live_results_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/election_Setting/voting_settings_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/polls_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_History/poll_history_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/poll_details_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/results_response.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_orders_response.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_categories_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_members_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permissions_response_model.dart'
    as slug_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_status_model.dart/permissions_response_model.dart'
    as status_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/setCurfew/curfew_response_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/set_restriction/restriction_status_response.dart';
import 'package:curnectgate/features/member_management/estate_settings/setting_model/estate_settings_response.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/Expired_count/expired_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/active_count/active_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_events_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_codes_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_count/notification_count_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminders_response_model.dart';
import 'package:curnectgate/features/operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model/comment_response.dart';
import 'package:curnectgate/features/operations/violation/model/estate_Address/estate_address_response.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
import 'package:curnectgate/features/operations/violation/model/violation_category/violation_category_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/payment_history_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_methods_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/wallet_history/wallet_history_response.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/api_response_model.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/checkOut/checkout_history_response_model.dart';
import 'package:curnectgate/features/security/model/count_model/violation_count_response.dart';
import 'package:curnectgate/features/security/model/duty_model/duty_response.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/get_user_notifications.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/get_user_privacy_settings.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/get_user_notification_settings.dart';
import 'package:curnectgate/features/userProfile/profile/model/get_user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final accessTokenProvider = FutureProvider.autoDispose<String?>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['access_token'];
});
final estateAdressIDProvider = FutureProvider.autoDispose<String?>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['estate_id'];
});

// Digital ID Code Provider - CORRECTED
// Change from autoDispose to normal provider
final firstnameProvider = FutureProvider<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['firstname'] ?? "";
});
// Digital ID Status Provider - CORRECTED

final memberIdProvider = FutureProvider.autoDispose<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['member_code'] ?? ""; // Fixed path
});

final securityEmployeeID = FutureProvider.autoDispose<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();

  // safety checks for list
  final spList = authData?['user']?['security_personnel'];
  if (spList is List && spList.isNotEmpty) {
    return spList.first['employee_id'] ?? "";
  }

  return "";
});

final userRoleProvider = FutureProvider.autoDispose<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['role'] ?? ""; // Fixed path
});

class SharedPrefsService {
  static const String _keyAuthData = 'auth_data';
  static const String _userName = 'User_name';
  static const String _fullname = 'full_name';
  static const String _medialUrl = 'Url';
  static const String _profileKey = 'user_profile';
  static const String _userNotificationsettingKey = 'user_notificationSettings';
  static const String _getUserPrivacy = "user_privacySetttings";
  static const String _userMainNotification = "user_mainNotification";
  static const String _userMainReminder = "reminder";
  static const String _eventKey = "eventKey";
  static const String _eventKeyResv = "eventKey_rsvp";
  static const String _calenderKey = "Calender";
  static const String _eventCode = "codess";
  static const String _notificationCountKey = "countKey";
  static const String _estateAddressKey = "estate_Address";
  static const String _reportListKey = "report_list";
  static const String _investigateReportKey = "report_investigate";
  static const String _resolvedReportKey = "report_resolved";
  static const String _dismissedReportKey = "report_dismissed";
  static const String _reportComment = "report_comment";
  static const String _estateCategory = "estate_category";
  static const String _reportHistory = "report_history";
  static const String _activeOtpKey = "Active_otp";
  static const String _work_permitKey = "Work_permit";
  static const String _activeOtpHistoryKey = "active_history";
  static const String _activeOtpCountKey = "active_Count";
  static const String _activeOtpExpireUsedKey = "active_used";
  static const String _getDigitalIdKey = "Digital_id";
  static const String _householdGetKey = "house_hold";
  static const String _propertyIDKey = "property_ID";
  static const String _workOderCatigoriIDKey = "workOrder_categorie";
  static const String _workOderKey = "workOrder";
  static const String _permissionStatusKey = "perm_status";
  static const String _permissionStaticKey = "perm_static";
  static const String _setCurfewKey = "setCurfew_key";
  static const String _checkOutKey = "check_out";
  static const String _checkInKey = "check_in";
  static const String _resident = "resident";
  static const String _committee = "committee";
  static const String _candidateKey = "candidat_Key";
  static const String _candidateResultKey = "candidat_result_Key";
  static const String _summary_resultKey = "summary_result_key";
  static const String _pollDeteils = "poll_deteils";
  static const String _pollHistory = "poll_History";
  static const String _pollKey = "poll_Key";
  static const String _votingSettingKey = "Voting_key";
  static const String _violationCountKey = "violation_key";
  static const String _walletHistoryKey = "Wallet_key";
  static const String _paymentHistoryKey = "payment_history";
  static const String _duePaymentKey = "due_key";
  static const String _paymentDashbordKey = "Payment_das";
  static const String _paymentMethodKey = "Payment_method";
  static const String _emergencyContact = "Emergency_key";
  static const String _getAdminList = "_admin_key";
  static const String _committeKey = "Com_key";
  static const String _agreement_Key = "agreement_key";
  static const String _activePermit = "active_permit";
  static const String _compliancKey = "comp_Key";
  static const String _sliderKey = "slider_key";
  static const String _dutyKey = "duty_key";
  static const String _restricKey = "Rest_Key";
  static const String _reverbConfigKey = 'reverb_config';
  static const String _chatSettings = "chat_settings";

  /// Save ReverbConfig to SharedPreferences

  //// CHATTING SERVECE

  static Future<void> saveAdminList(EstateAdminsResponse privacy) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_getAdminList, jsonEncode(privacy.toJson()));
  }

  //  flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/features/userProfile/notification_setting/model**"
  static Future<EstateAdminsResponse?> getAdminList() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_getAdminList);
    if (data != null) {
      return EstateAdminsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveChatSettings(
    ConversationSettingsResponse privacy,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_chatSettings, jsonEncode(privacy.toJson()));
  }

  //  flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/features/userProfile/notification_setting/model**"
  static Future<ConversationSettingsResponse?> getChatSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_chatSettings);
    if (data != null) {
      return ConversationSettingsResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveComitteeList(CommitteeMembersResponse privacy) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_committeKey, jsonEncode(privacy.toJson()));
  }

  //  flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/features/userProfile/notification_setting/model**"
  static Future<CommitteeMembersResponse?> getComitteeList() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_committeKey);
    if (data != null) {
      return CommitteeMembersResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveNotificationSettings(
    GetUserNotificationSettings notification,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userNotificationsettingKey,
      jsonEncode(notification.toJson()),
    );
  }

  static Future<void> savePrivacySettings(
    GetUserPrivacySettings privacy,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_getUserPrivacy, jsonEncode(privacy.toJson()));
  }

  //  flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/features/userProfile/notification_setting/model**"
  static Future<GetUserPrivacySettings?> getUserPrivacySettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_getUserPrivacy);
    if (data != null) {
      return GetUserPrivacySettings.safeFromJson(jsonDecode(data));
    }
    return null;
  }
  // DIGITALMEMBERID

  static Future<void> saveDigitalID(DigitalMemberIdResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_getDigitalIdKey, jsonEncode(preference.toJson()));
  }

  static Future<DigitalMemberIdResponse?> getDigitalID() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_getDigitalIdKey);
    if (data != null) {
      return DigitalMemberIdResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveEstateSettings(EstateSettingsResponse privacy) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emergencyContact, jsonEncode(privacy.toJson()));
  }

  static Future<EstateSettingsResponse?> getEstateSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_emergencyContact);
    if (data != null) {
      return EstateSettingsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  //REPORT/ESTATEADDRESS/COMMENT/CATEGORY/HISTORY
  static Future<void> saveReportHistory(
    StatusHistoryResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_reportHistory, jsonEncode(preference.toJson()));
  }

  static Future<StatusHistoryResponse?> getReportHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_reportHistory);
    if (data != null) {
      return StatusHistoryResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportComment(CommentResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_reportComment, jsonEncode(preference.toJson()));
  }

  static Future<CommentResponse?> getReportComment() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_reportComment);
    if (data != null) {
      return CommentResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveEstateAddress(
    EstateAddressResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_estateAddressKey, jsonEncode(preference.toJson()));
  }

  static Future<EstateAddressResponse?> getEstateAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_estateAddressKey);
    if (data != null) {
      return EstateAddressResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportCategory(
    ViolationCategoryResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_estateCategory, jsonEncode(preference.toJson()));
  }

  static Future<ViolationCategoryResponse?> getReportCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_estateCategory);
    if (data != null) {
      return ViolationCategoryResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportList(ViolationResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_reportListKey, jsonEncode(preference.toJson()));
  }

  static Future<ViolationResponse?> getReportList() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_reportListKey);
    if (data != null) {
      return ViolationResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  ///RESIDENT/COMMITTEE
  ///ResidentDirectoryResponse

  static Future<void> saveResident(ResidentDirectoryResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_resident, jsonEncode(preference.toJson()));
  }

  static Future<ResidentDirectoryResponse?> getResident() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_resident);
    if (data != null) {
      return ResidentDirectoryResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveCommittee(CommitteesResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_committee, jsonEncode(preference.toJson()));
  }

  static Future<CommitteesResponse?> getCommittee() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_committee);
    if (data != null) {
      return CommitteesResponse.fromJson(jsonDecode(data));
    }
    return null;
  }
  //USERNOTIFICATION/REMINDER

  static Future<void> saveUserNotification(
    NotificationResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userMainNotification,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<NotificationResponse?> getUserNotification() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userMainNotification);
    if (data != null) {
      return NotificationResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveUserReminder(
    RemindersResponseModel preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userMainReminder, jsonEncode(preference.toJson()));
  }

  static Future<RemindersResponseModel?> getUserReminder() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userMainReminder);
    if (data != null) {
      return RemindersResponseModel.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveEvent(CalendarEventsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_eventKey, jsonEncode(preference.toJson()));
  }

  static Future<CalendarEventsResponse?> getEvent() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_eventKey);
    if (data != null) {
      return CalendarEventsResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveEventRsvp(RsvpEventsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_eventKeyResv, jsonEncode(preference.toJson()));
  }

  static Future<RsvpEventsResponse?> getEventRsvp() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_eventKeyResv);
    if (data != null) {
      return RsvpEventsResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveCalender(EventsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_calenderKey, jsonEncode(preference.toJson()));
  }

  static Future<EventsResponse?> getcalendder() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_calenderKey);
    if (data != null) {
      return EventsResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveEventCode(EventCodesResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_eventCode, jsonEncode(preference.toJson()));
  }

  static Future<EventCodesResponse?> getEventCode() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_eventCode);
    if (data != null) {
      return EventCodesResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveNotificationCount(
    NotificationCountResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _notificationCountKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<NotificationCountResponse?> getNotificationCount() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_notificationCountKey);
    if (data != null) {
      return NotificationCountResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  /// ACTIVEOTP/WORK PERMIT. ClearancePermitResponse
  static Future<void> saveActiveOtp(OtpResponseModel preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeOtpKey, jsonEncode(preference.toJson()));
  }

  static Future<OtpResponseModel?> getActiveOtp() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_activeOtpKey);
    if (data != null) {
      return OtpResponseModel.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveClearancePermit(
    ClearancePermitResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_work_permitKey, jsonEncode(preference.toJson()));
  }

  static Future<ClearancePermitResponse?> getClearancePermit() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_work_permitKey);
    if (data != null) {
      return ClearancePermitResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveActivePermit(ActiveOtpResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activePermit, jsonEncode(preference.toJson()));
  }

  static Future<ActiveOtpResponse?> getActivePermit() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_activePermit);
    if (data != null) {
      return ActiveOtpResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveActiveHistory(OtpResponseModel preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _activeOtpHistoryKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<OtpResponseModel?> getActiveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_activeOtpHistoryKey);
    if (data != null) {
      return OtpResponseModel.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  // _activeOtpCountKey
  // _activeOtpExpireUsedKey
  static Future<void> saveActiveCount(ActiveCountResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeOtpCountKey, jsonEncode(preference.toJson()));
  }

  static Future<ActiveCountResponse?> getActiveCount() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_activeOtpCountKey);
    if (data != null) {
      return ActiveCountResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveActivExpiredeCount(
    ExpiredCountResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _activeOtpExpireUsedKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<ExpiredCountResponse?> getActiveExpiredCount() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_activeOtpExpireUsedKey);
    if (data != null) {
      return ExpiredCountResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveViolationCount(
    ViolationCountResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_violationCountKey, jsonEncode(preference.toJson()));
  }

  static Future<ViolationCountResponse?> getViolationCount() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_violationCountKey);
    if (data != null) {
      return ViolationCountResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  // HOUSEHOLD/SETTING PERMISSION/
  static Future<void> saveHouseHold(HouseholdMembersResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_householdGetKey, jsonEncode(preference.toJson()));
  }

  static Future<HouseholdMembersResponse?> getHouseHold() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_householdGetKey);
    if (data != null) {
      return HouseholdMembersResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveProperty(PropertyResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_propertyIDKey, jsonEncode(preference.toJson()));
  }

  //RestrictionStatusResponse
  static Future<PropertyResponse?> getProperty() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_propertyIDKey);
    if (data != null) {
      return PropertyResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveRestricted(
    RestrictionStatusResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_restricKey, jsonEncode(preference.toJson()));
  }

  static Future<RestrictionStatusResponse?> getRestricted() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_restricKey);
    if (data != null) {
      return RestrictionStatusResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePermissionStatistic(
    slug_model.PermissionsResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _permissionStaticKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<slug_model.PermissionsResponse?>
  getPermissionStatistic() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_permissionStaticKey);
    if (data != null) {
      return slug_model.PermissionsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePermissionCurfew(CurfewResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_setCurfewKey, jsonEncode(preference.toJson()));
  }

  static Future<CurfewResponse?> getPermissionCurfew() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_setCurfewKey);
    if (data != null) {
      return CurfewResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePermissionStatus(
    status_model.PermissionsResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _permissionStatusKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<status_model.PermissionsResponse?> getPermissionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_permissionStatusKey);
    if (data != null) {
      return status_model.PermissionsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  /// ELECTION / VOTING POLL PollsResponse

  static Future<void> saveCandidate(CandidatesResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_candidateKey, jsonEncode(preference.toJson()));
  }

  static Future<CandidatesResponse?> getCandidate() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_candidateKey);
    if (data != null) {
      return CandidatesResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveCandidateResult(
    LiveResultsResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_candidateResultKey, jsonEncode(preference.toJson()));
  }

  static Future<LiveResultsResponse?> getCandidateResult() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_candidateResultKey);
    if (data != null) {
      return LiveResultsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveLiveResultSummary(ResultsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_summary_resultKey, jsonEncode(preference.toJson()));
  }

  static Future<ResultsResponse?> getLiveResultSummary() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_summary_resultKey);
    if (data != null) {
      return ResultsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePoll(PollsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pollKey, jsonEncode(preference.toJson()));
  }

  static Future<PollsResponse?> getPoll() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_pollKey);
    if (data != null) {
      return PollsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePollDeteils(PollDetailsResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pollDeteils, jsonEncode(preference.toJson()));
  }

  static Future<PollDetailsResponse?> getPollDeteils() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_pollDeteils);
    if (data != null) {
      return PollDetailsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePollHistory(PollHistoryResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pollHistory, jsonEncode(preference.toJson()));
  }

  static Future<PollHistoryResponse?> getPollHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_pollHistory);
    if (data != null) {
      return PollHistoryResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveVotingSettings(
    VotingSettingsResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_votingSettingKey, jsonEncode(preference.toJson()));
  }

  static Future<VotingSettingsResponse?> getVotingSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_votingSettingKey);
    if (data != null) {
      return VotingSettingsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  /// WORKORDER
  ///  CheckoutHistoryResponseModel saveWorkOrderCategories. GetWorkOrdersResponse

  static Future<void> saveWorkOrderCategories(
    WorkOrderCategoriesResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _workOderCatigoriIDKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<WorkOrderCategoriesResponse?> getWorkOrderCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_workOderCatigoriIDKey);
    if (data != null) {
      return WorkOrderCategoriesResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveWorkOrder(WorkOrderResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_workOderKey, jsonEncode(preference.toJson()));
  }

  static Future<WorkOrderResponse?> getWorkOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_workOderKey);
    if (data != null) {
      return WorkOrderResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  /// SECURITY LOCAL
  /// CheckoutHistoryResponseModel
  static Future<void> saveCheckOut(
    CheckoutHistoryResponseModel checkOut,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_checkOutKey, jsonEncode(checkOut.toJson()));
  }

  static Future<CheckoutHistoryResponseModel?> getChekout() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_checkOutKey);
    if (data != null) {
      return CheckoutHistoryResponseModel.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveCheckIn(ApiResponseModel checkOut) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_checkInKey, jsonEncode(checkOut.toJson()));
  }

  static Future<ApiResponseModel?> getChekIn() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_checkInKey);
    if (data != null) {
      return ApiResponseModel.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportListInvestigation(
    ViolationResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _investigateReportKey,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<ViolationResponse?> getReportListInvestigation() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_investigateReportKey);
    if (data != null) {
      return ViolationResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportListResolved(
    ViolationResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_resolvedReportKey, jsonEncode(preference.toJson()));
  }

  static Future<ViolationResponse?> getReportListResolved() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_resolvedReportKey);
    if (data != null) {
      return ViolationResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveReportListDismissed(
    ViolationResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dismissedReportKey, jsonEncode(preference.toJson()));
  }

  static Future<ViolationResponse?> getReportListDismissed() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_dismissedReportKey);
    if (data != null) {
      return ViolationResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveDuty(DutyResponse preference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dutyKey, jsonEncode(preference.toJson()));
  }

  static Future<DutyResponse?> getDuty() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_dutyKey);
    if (data != null) {
      return DutyResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  ///PREFRENCES SETTINGS
  static Future<void> savePrefrencSettings(
    GetuserNotifications preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userMainNotification,
      jsonEncode(preference.toJson()),
    );
  }

  static Future<GetuserNotifications?> getUserPreferenceSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userMainNotification);
    if (data != null) {
      return GetuserNotifications.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<GetUserNotificationSettings?> getNotificationSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userNotificationsettingKey);
    if (data != null) {
      return GetUserNotificationSettings.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveAgreement(AgreementsResponse profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agreement_Key, jsonEncode(profile.toJson()));
  }

  static Future<AgreementsResponse?> getAgreement() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_agreement_Key);
    if (data != null) {
      return AgreementsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveSlider(OnboardingSliderResponse slider) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sliderKey, jsonEncode(slider.toJson()));
  }

  static Future<OnboardingSliderResponse?> getSlider() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_sliderKey);
    if (data != null) {
      return OnboardingSliderResponse.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveCompliance(ComplianceResponse profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_compliancKey, jsonEncode(profile.toJson()));
  }

  static Future<ComplianceResponse?> getCompliance() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_compliancKey);
    if (data != null) {
      return ComplianceResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> saveProfile(GetUserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileKey, jsonEncode(profile.toJson()));
  }

  static Future<GetUserProfile?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_profileKey);
    if (data != null) {
      return GetUserProfile.fromSafeJson(jsonDecode(data));
    }
    return null;
  }

  //// PAYMENT DATA AND CORE
  ///_walletHistoryKey
  // _paymentHistoryKey
  // _duePaymentKey
  // _paymentDashbordKey
  static Future<void> savePaymentDashbord(
    PaymentDashboardResponse profile,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_paymentDashbordKey, jsonEncode(profile.toJson()));
  }

  static Future<PaymentDashboardResponse?> getPaymentDashobord() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_paymentDashbordKey);
    if (data != null) {
      return PaymentDashboardResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePaymentDue(OutstandingDuesResponse profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_duePaymentKey, jsonEncode(profile.toJson()));
  }

  static Future<OutstandingDuesResponse?> getPaymentDue() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_duePaymentKey);
    if (data != null) {
      return OutstandingDuesResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePaymentHistory(PaymentHistoryResponse profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_paymentHistoryKey, jsonEncode(profile.toJson()));
  }

  static Future<PaymentHistoryResponse?> getPaymentHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_paymentHistoryKey);
    if (data != null) {
      return PaymentHistoryResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> savePayMethod(PaymentMethodsResponse profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_paymentMethodKey, jsonEncode(profile.toJson()));
  }

  static Future<PaymentMethodsResponse?> getPayMethod() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_paymentMethodKey);
    if (data != null) {
      return PaymentMethodsResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  Future<void> saveReverbConfig(ReverbConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(config.toJson());
    await prefs.setString(_reverbConfigKey, jsonString);
  }

  /// Get ReverbConfig from SharedPreferences
  Future<ReverbConfig?> getReverbConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_reverbConfigKey);
    if (jsonString == null) return null;

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return ReverbConfig.fromJson(jsonMap);
    } catch (e) {
      // If parsing fails, remove invalid value
      await prefs.remove(_reverbConfigKey);
      return null;
    }
  }

  /// Remove ReverbConfig
  Future<void> clearReverbConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_reverbConfigKey);
  }

  static Future<void> savePaymenWallettHistory(
    WalletHistoryResponse profile,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_walletHistoryKey, jsonEncode(profile.toJson()));
  }

  static Future<WalletHistoryResponse?> getPaymentWalletHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_walletHistoryKey);
    if (data != null) {
      return WalletHistoryResponse.safeFromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileKey);
  }

  static Future<void> clearComplaince() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_compliancKey);
  }

  static Future<void> clearReportCategory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_estateCategory);
  }

  static Future<void> clearnotifcation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNotificationsettingKey);
  }

  static Future<void> clearprefrence() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userMainNotification);
  }

  static Future<void> clearprivacy() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getUserPrivacy);
  }

  static Future<void> clearEstatAddrss() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_estateAddressKey);
  }

  static Future<void> clearReportList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_reportListKey);
  }

  static Future<void> clearReportComment() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_reportComment);
  }

  static Future<void> clearReportHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_reportHistory);
  }

  static Future<void> clearActiveOtp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeOtpKey);
  }

  static Future<void> clearActiveOtpHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeOtpHistoryKey);
  }

  static Future<void> clearHouseHoldData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_householdGetKey);
  }

  static Future<void> clearPropery() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_propertyIDKey);
  }

  static Future<void> clearDigitalIDdata() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getDigitalIdKey);
  }

  static Future<void> clearPermissionStatc() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_permissionStaticKey);
  }

  static Future<void> clearChatSeetings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_chatSettings);
  }

  Future<void> saveSessionCookie(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_cookie', cookie);
  }

  Future<String?> getSessionCookie() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('session_cookie');
  }

  static Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("session_token");
  }

  Future<void> saveUserToken(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_token', cookie);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('session_token');
  }

  static Future<void> clearSessionCookie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("session_cookie");
  }

  static Future<void> clearLiveResultSummary() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_summary_resultKey);
  }

  static Future<void> clearRestricted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_restricKey);
  }

  static Future<void> clearPermissionstatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_permissionStatusKey);
  }

  static Future<void> clearCheckOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_checkOutKey);
  }

  static Future<void> cleardismissedRport() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_dismissedReportKey);
  }

  static Future<void> clearResolvedReport() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_resolvedReportKey);
  }

  static Future<void> clearInvestigateReport() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_investigateReportKey);
  }

  static Future<void> clearCandidate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_candidateKey);
  }

  static Future<void> clearReminder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userMainReminder);
  }

  static Future<void> clearEvent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_eventKey);
  }

  static Future<void> clearSecurfew() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_setCurfewKey);
  }

  static Future<void> clearcalender() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_calenderKey);
  }

  static Future<void> clearActiveExpiredCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeOtpExpireUsedKey);
  }

  static Future<void> clearActiveCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeOtpCountKey);
  }

  // _activeOtpCountKey _eventKeyResv
  // _activeOtpExpireUsedKey
  static Future<void> clearResident() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_resident);
  }

  static Future<void> clearEventRsvp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_eventKeyResv);
  }

  static Future<void> clearCommitte() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_committee);
  }

  static Future<void> clearEventCode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_eventCode);
  }

  static Future<void> clearWorkOrderCategory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_workOderCatigoriIDKey);
  }

  static Future<void> clearWorkOder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_workOderKey);
  }

  static Future<void> clearPollDeteils() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pollDeteils);
  }

  static Future<void> clearPollHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pollHistory);
  }

  static Future<void> clearPoll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pollKey);
  }

  static Future<void> clearVotingSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_votingSettingKey);
  }

  ///_emergencyContact
  static Future<void> clearpaymentMethod() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_paymentMethodKey);
  }

  static Future<void> clearEstateSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emergencyContact);
  }

  static Future<void> clearCandidateResuilt() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_candidateResultKey);
  }

  static Future<void> clearCommitteeList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_committeKey);
  }

  static Future<void> clearAdminList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getAdminList);
  }

  static Future<void> clearAgreement() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_agreement_Key);
  }

  static Future<void> clearViolationCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_violationCountKey);
  }

  static Future<void> clearSlider() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sliderKey);
  }

  static Future<void> clearActivePermit() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activePermit);
  }

  Future<void> saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAuthData, jsonEncode(data));
  }

  Future<void> saveSingleUserName(String usserName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, usserName);
  }

  Future<void> saveFullName(String usserName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fullname, usserName);
  }

  Future<void> saveMedialUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_medialUrl, url);
  }

  Future<String?> getMedialUrl() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_medialUrl);
    return data;
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_userName);
    return data;
  } //_eventCode

  Future<String?> getfullName() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_fullname);
    return data;
  }

  Future<Map<String, dynamic>?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_keyAuthData);
    return data != null ? jsonDecode(data) : null;
  }

  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    log(_keyAuthData);
    clearProfile();
    clearnotifcation();
    clearEstatAddrss();
    clearReportComment();
    clearReportList();
    clearprivacy();
    clearprefrence();
    clearReportCategory();
    clearReportHistory();
    clearActiveOtpHistory();
    clearActiveOtp();
    clearDigitalIDdata();
    clearHouseHoldData();
    clearPropery();
    clearPermissionstatus();
    clearPermissionStatc();
    clearCheckOut();
    clearInvestigateReport();
    clearResolvedReport();
    cleardismissedRport();
    clearReminder();
    clearEvent();
    clearcalender();
    clearCommitte();
    clearResident();
    clearEventCode();
    clearWorkOrderCategory();
    clearWorkOder();
    clearSessionCookie();
    clearUserToken();
    clearCandidate();
    clearPollDeteils();
    clearPollHistory();
    clearPoll();
    clearVotingSettings();
    clearpaymentMethod();
    clearEstateSettings();
    clearActiveCount();
    clearActiveExpiredCount();
    clearViolationCount();
    clearCandidateResuilt();
    clearLiveResultSummary();
    clearEventRsvp();
    clearSecurfew();
    clearCommitteeList();
    clearAdminList();
    clearAgreement();
    clearActivePermit();
    clearComplaince();
    clearSlider();
    clearRestricted();
    clearReverbConfig();
    clearChatSeetings();
    await prefs.remove(_keyAuthData);
  }
}
