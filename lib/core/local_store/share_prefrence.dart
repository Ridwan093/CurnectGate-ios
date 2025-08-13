// shared_prefs_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_members_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permissions_response_model.dart'
    as slug_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_status_model.dart/permissions_response_model.dart'
    as status_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_response.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/activit_model.dart';
import 'package:curnectgate/features/operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model.dart';
import 'package:curnectgate/features/operations/violation/model/estate_address_model.dart';
import 'package:curnectgate/features/operations/violation/model/getCategory_model.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
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
final digitalIdCodeProvider = FutureProvider<String>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['digital_id_code'] ?? "";
});
// Digital ID Status Provider - CORRECTED
final digitalIdStatusProvider = FutureProvider.autoDispose<bool>((ref) async {
  final authData = await SharedPrefsService().getAuthData();
  return authData?['user']?['digital_id_status'] ?? false; // Fixed path
});

class SharedPrefsService {
  static const _keyAuthData = 'auth_data';
  static const _userName = 'User_name';
  static const String _profileKey = 'user_profile';
  static const String _userNotificationsettingKey = 'user_notificationSettings';
  static const String _getUserPrivacy = "user_privacySetttings";
  static const String _preferencesKey = "user_preferency";
  static const String _estateAddressKey = "estate_Address";
  static const String _reportListKey = "report_list";
  static const String _reportComment = "report_comment";
  static const String _estateCategory = "estate_category";
  static const String _reportHistory = "report_history";
  static const String _activeOtpKey = "Active_otp";
  static const String _activeOtpHistoryKey = "active_history";
  static const String _getDigitalIdKey = "Digital_id";
  static const String _householdGetKey = "house_hold";
  static const String _propertyIDKey = "property_ID";

  static const String _permissionStatusKey = "perm_status";
  static const String _permissionStaticKey = "perm_static";
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

  //USERNOTIFICATION
  static Future<void> saveUserNotification(
    NotificationResponse preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_preferencesKey, jsonEncode(preference.toJson()));
  }

  static Future<NotificationResponse?> getUserNotification() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_preferencesKey);
    if (data != null) {
      return NotificationResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  /// ACTIVEOTP/
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

  ///PREFRENCES SETTINGS
  static Future<void> savePrefrencSettings(
    GetuserNotifications preference,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_preferencesKey, jsonEncode(preference.toJson()));
  }

  static Future<GetuserNotifications?> getUserPreferenceSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_preferencesKey);
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
    await prefs.remove(_preferencesKey);
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

    await prefs.remove(_keyAuthData);
  }
}
