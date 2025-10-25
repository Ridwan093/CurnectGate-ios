// get_api_service.dart
import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
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
import 'package:curnectgate/features/member_management/membership_ID/model/digital_id_status.dart';
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
import 'package:dio/dio.dart';

class GetApiService {
  final Dio _dio;

  GetApiService(this._dio);

  Future<GetUserProfile> getUserProfile({required String bearerToken}) async {
    try {
      final response = await _dio.get(
        getUserprofile, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );

      return GetUserProfile.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<GetUserNotificationSettings> getUserNotificationSettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getNotification, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );

      return GetUserNotificationSettings.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<GetUserPrivacySettings> getUserPrivacySettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getSettingPrivacy, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );

      return GetUserPrivacySettings.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> signOut({required String token}) async {
    final response = await _dio.get(
      appLogOut, // Update with your actual endpoint
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'X-Requested-With': 'XMLHttpRequest',
        },
        validateStatus: (status) => status! < 500,
      ),
    );
    return response.data;
  }

  Future<GetuserNotifications> getPreferences({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getSettingPreferences, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return GetuserNotifications.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<NotificationResponse> getAllNotification({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getNotificationApi, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      return NotificationResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<RemindersResponseModel> getAllReminder({
    required String bearerToken,
    required String category,
  }) async {
    try {
      final response = await _dio.get(
        "/api/v1/estates/general/reminders?category=$category", // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return RemindersResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<EstateAddressResponse> getAllAdress({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getViolationLocation, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return EstateAddressResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<ViolationCategoryResponse> getReportCategory({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getViolationCategorys, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return ViolationCategoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Map<String, dynamic> requestData(String status) {
    switch (status) {
      case "all":
        return {"filter": status};

      default:
        return {"status": status};
    }
  }

  Future<ViolationResponse> getreport({
    required String bearerToken,
    required String filter,
  }) async {
    try {
      final Map<String, dynamic> requestDatas = requestData(
        filter.toLowerCase(),
      );
      log(requestDatas.toString());

      final response = await _dio.get(
        data: requestDatas,
        listOfViolation, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return ViolationResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<StatusHistoryResponse> getreportHistor({
    required String bearerToken,
    required int id,
  }) async {
    try {
      final response = await _dio.get(
        "/api/v1/estates/general/violations/$id/history",

        // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return StatusHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }
  // status

  Future<CommentResponse> getreportComment({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "/api/v1/estates/general/violations/$id/comments", // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return CommentResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<OtpResponseModel> getVisitorByFilters({
    required String bearerToken,
    required String status,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"status": status};
      log("requestBody:${requestData.toString()}");
      final response = await _dio.get(
        data: requestData,
        getVisitorByfirter, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return OtpResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<ClearancePermitResponse> getworkPermit({
    required String bearerToken,
    required String status,
  }) async {
    try {
      // final Map<String, dynamic> requestData = {"status": status};
      log("requestBody:${requestData.toString()}");
      final response = await _dio.get(
        getWorkpermit, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return ClearancePermitResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<DigitalMemberIdResponse> getDigitalID({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getDigitalIDCode, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return DigitalMemberIdResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<HouseholdMembersResponse> getHouseHolds({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getHouseHold, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return HouseholdMembersResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<PropertyResponse> getProperty({required String bearerToken}) async {
    try {
      final response = await _dio.get(
        getPropertya, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return PropertyResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<status_model.PermissionsResponse> getPermissionStatus({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "/api/v1/estates/owner-portal/households/members/permission/$id/status", // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return status_model.PermissionsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<slug_model.PermissionsResponse> getPermissionStatisic({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "/api/v1/estates/owner-portal/households/members/permission/$id/specific", // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return slug_model.PermissionsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<CheckoutHistoryResponseModel> getCheckOut({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getCheckOutVisitor, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return CheckoutHistoryResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<ApiResponseModel> getCheckIn({required String bearerToken}) async {
    try {
      final response = await _dio.get(
        getCheckInVisitor, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return ApiResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<NotificationCountResponse> getNotificationCount({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        notificationCount, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return NotificationCountResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<EventsResponse> getCalender({required String bearerToken}) async {
    try {
      final response = await _dio.get(
        getCalenders, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log("Calender Event:" + response.data.toString());

      return EventsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<EventCodesResponse> getEventCode({required String bearerToken}) async {
    try {
      final response = await _dio.get(
        getEventCodes, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log("Calender Event:" + response.data.toString());

      return EventCodesResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<CalendarEventsResponse> getEvent({
    required String bearerToken,
    required String limit,
    required String statuse,
    String? date,
  }) async {
    try {
      final response = await _dio.get(
        // "/api/v1/estates/general/events?status=cancelled",
        "/api/v1/estates/general/events?status=$statuse&limit=$limit&start_date=${date ?? ""}", // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return CalendarEventsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<ResidentDirectoryResponse> getResident({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getResinde, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return ResidentDirectoryResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<CommitteesResponse> getCommittees({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getCommitt, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return CommitteesResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<WorkOrderCategoriesResponse> getWorkOrderCategories({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        workOrdercategorie, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return WorkOrderCategoriesResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<WorkOrderResponse> getWorkerOrder({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getworkOrder, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return WorkOrderResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<DigitalIdStatus> fetchDigitalIdStatus({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(
        getDigitalStatus, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
      log(response.data.toString());

      return DigitalIdStatus.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');

      return DigitalIdStatus(hasDigitalId: false);
    }
  }

  dynamic _handleError(DioException e) {
    if (e.response != null) {
      // Handle specific status codes
      if (e.response!.statusCode == 401) {
        return 'Unauthorized - Please login again';
      } else if (e.response!.statusCode == 404) {
        return 'Resource not found';
      }
      // Try to parse error message from response
      try {
        final errorData = e.response!.data;
        return errorData['message'] ?? errorData['error'] ?? 'Unknown error';
      } catch (_) {
        return 'Failed to parse error response';
      }
    } else {
      return e.message ?? 'Network error occurred';
    }
  }
}
