// shared_prefs_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committees_response_model.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_orders_response.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_categories_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_members_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permissions_response_model.dart'
    as slug_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_status_model.dart/permissions_response_model.dart'
    as status_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_response.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_codes_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_count/notification_count_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminders_response_model.dart';
import 'package:curnectgate/features/operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model.dart';
import 'package:curnectgate/features/operations/violation/model/estate_address_model.dart';
import 'package:curnectgate/features/operations/violation/model/getCategory_model.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/api_response_model.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/checkOut/checkout_history_response_model.dart';
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
final userRoleProvider = FutureProvider.autoDispose<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['role'] ?? ""; // Fixed path
});

class SharedPrefsService {
  static const _keyAuthData = 'auth_data';
  static const _userName = 'User_name';
  static const String _profileKey = 'user_profile';
  static const String _userNotificationsettingKey = 'user_notificationSettings';
  static const String _getUserPrivacy = "user_privacySetttings";
  static const String _userMainNotification = "user_mainNotification";
  static const String _userMainReminder = "reminder";
  static const String _eventKey = "eventKey";
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
  static const String _getDigitalIdKey = "Digital_id";
  static const String _householdGetKey = "house_hold";
  static const String _propertyIDKey = "property_ID";
  static const String _workOderCatigoriIDKey = "workOrder_categorie";
  static const String _workOderKey = "workOrder";
  static const String _permissionStatusKey = "perm_status";
  static const String _permissionStaticKey = "perm_static";
  static const String _checkOutKey = "check_out";
  static const String _checkInKey = "check_in";
  static const String _resident = "resident";
  static const String _committee = "committee";

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
      return CommentResponse.fromJson(jsonDecode(data));
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
      return EstateAddressResponse.fromJson(jsonDecode(data));
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
      return ViolationCategoryResponse.fromJson(jsonDecode(data));
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

  static Future<PropertyResponse?> getProperty() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_propertyIDKey);
    if (data != null) {
      return PropertyResponse.safeFromJson(jsonDecode(data));
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

  static Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileKey);
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

  static Future<void> clearReminder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userMainReminder);
  }

  static Future<void> clearEvent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_eventKey);
  }

  static Future<void> clearcalender() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_calenderKey);
  }

  static Future<void> clearResident() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_resident);
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

  Future<void> saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAuthData, jsonEncode(data));
  }

  Future<void> saveSingleUserName(String usserName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, usserName);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_userName);
    return data;
  } //_eventCode

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

    await prefs.remove(_keyAuthData);
  }
}
