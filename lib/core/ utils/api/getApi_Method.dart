// get_api_service.dart
import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/features/userProfile/profile/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetApiService {
  final Dio _dio;
  final Ref _ref;

  GetApiService(this._dio, this._ref);

  Future<GetUserProfile> getUserProfile() async {
    try {
      final response = await _dio.get(
        getUserprofile, // Update with your actual endpoint
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer 37|6MD9VBm9YsdxbkDAg4NXRKOIC11qDyiDBVE5JyMp71746a57',
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

  Future<Map<String, dynamic>> signOut() async {
    final response = await _dio.get(
      appLogOut, // Update with your actual endpoint
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer 37|6MD9VBm9YsdxbkDAg4NXRKOIC11qDyiDBVE5JyMp71746a57',
          'X-Requested-With': 'XMLHttpRequest',
        },
        validateStatus: (status) => status! < 500,
      ),
    );
    return response.data;
  }

  Future<List<Preference>> getPreferences() async {
    final response = await _dio.get(
      '/preferences',
      options: Options(extra: {'requiresAuth': true}),
    );
    return (response.data as List).map((e) => Preference.fromJson(e)).toList();
  }

  Future<List<Notification>> getNotifications() async {
    final response = await _dio.get(
      '/notifications',
      options: Options(
        extra: {'requiresAuth': false},
      ), // Example public endpoint
    );
    return (response.data as List)
        .map((e) => Notification.fromJson(e))
        .toList();
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
