// get_api_service.dart
import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/model/model.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:curnectgate/features/%20operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/%20operations/violation/model/comment_model.dart';
import 'package:curnectgate/features/%20operations/violation/model/estate_address_model.dart';
import 'package:curnectgate/features/%20operations/violation/model/getCategory_model.dart';
import 'package:curnectgate/features/%20operations/violation/model/reportList_model.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/getDigitalModel.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/model.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/model.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/userNotification_setting_model.dart';
import 'package:curnectgate/features/userProfile/profile/model/profile_model.dart';
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

      return GetUserProfile.fromJson(response.data);
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

      return GetUserNotificationSettings.fromJson(response.data);
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

      return GetUserPrivacySettings.fromJson(response.data);
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

      return GetuserNotifications.fromJson(response.data);
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
      log(response.data.toString());

      return NotificationResponse.fromJson(response.data);
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

  Future<ViolationResponse> getreport({required String bearerToken, required String filter}) async {
    try {
        final Map<String, dynamic> requestData = {"status": filter};
      final response = await _dio.get(
        data:requestData,
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

      return ViolationResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
    }
  }

  Future<StatusHistoryResponse> getreportHistor({
    required String bearerToken,
    required int id 
  }) async {
    try {
      final response = await _dio.get(
        getViolationHistotyStatus,
        
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
  }) async {
    try {
      final response = await _dio.get(
        getViolationComment, // Update with your actual endpoint
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

      return OtpResponseModel.fromJson(response.data);
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

      return DigitalMemberIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('Error getting profile: ${e.message}');
      throw _handleError(e);
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
