import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppApiMethod {
  final Dio _dio;

  AppApiMethod(this._dio);

  Future<Map<String, dynamic>> submitEstateCode(String code) async {
    final response = await _dio.post(
      estateCodeValidation,
      data: {'estate_code': code},
    );
    return response.data;
  }

  // Future<Map<String, dynamic>> submitMemberCode({
  //   required String code,
  //   required String estateCode,
  // }) async {
  //   // Implementation for member code
  //   log(code);
  //   final response = await _dio.post(
  //     memberCodeValidation,
  //     data: {'member_code': code, 'estate_code': estateCode},
  //   );
  //   return response.data;
  // }

  Future<Map<String, dynamic>> submitMemberCode({
    required String code,
    required String estateCode,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        'member_code': code,
        'estate_code': estateCode,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        memberCodeValidation,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> onboardingRegistration({
    required String membercode,
    required String estateCode,
    required String firstname,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String gender,
    required String password,
    required bool identityConfirmed,
    required bool agreetoterms,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        'member_code': membercode,
        'estate_code': estateCode,
        'firstname': firstname,
        'lastname': lastName,
        'email': email,
        'phone': phoneNumber,

        'dob': "", // Explicit empty string instead of null
        'password': password,
        'password_confirmation': password,
        'gender': gender,
        'identity_confirmed': identityConfirmed, // Convert to int if needed
        'agree_to_terms': agreetoterms,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        onbordinguserInfo,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTPcode({
    required String code,
    required String? email,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        'email': email,
        'verification_code': code,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        verifyOTPcodes,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> requestOTPcode({required String? email}) async {
    // Implementation for otp code request

    final response = await _dio.post(requestOTPcodes, data: {'email': email});
    return response.data;
  }

  Future<Map<String, dynamic>> logIn({
    required String pass,
    required String email,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'password': pass,
        'email': email,
      };

      final response = await _dio.post(
        loginUrl,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          // },
          validateStatus: (status) => status! < 500,
        ),
      );
      log("✅ Loging Respond Data: ${response.data.toString()}");
      // ✅ Save Session Cookie from response headers
      final rawCookies = response.headers['set-cookie'];
      if (rawCookies != null && rawCookies.isNotEmpty) {
        final cookieString = rawCookies.first.split(';').first;
        await SharedPrefsService().saveSessionCookie(cookieString);
        log("✅ Session Cookie Saved: $cookieString");
      }

      return response.data;
    } on DioException catch (e) {
      log('Status: ${e.response?.statusCode}');
      log('Response: ${e.response?.data}');
      log('Headers: ${e.response?.headers}');
      log('Request data: ${e.requestOptions.data}');

      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );

      rethrow;
    }
  }

  Future<Map<String, dynamic>> forgetPaSs({
    required String email,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {'email': email};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        forgetPass,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTPForget({
    required String code,
    required String email,
  }) async {
    // Implementation for member code

    final response = await _dio.post(
      forgetpassOtpverify,
      data: {'email': email, "code": code},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> createNewPass({
    required String token,
    required String email,
    required String newPassword,
    required String confrimPass,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        "token": token,
        "email": email,
        "password": newPassword,
        "password_confirmation": confrimPass,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        createNewpass,
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // Add any other headers you see in Postman
          },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> changeTemporaryPass({
    required String token,
    required String currentPass,
    required String newPassword,
    required String confirmpass,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        "current_password": currentPass,
        "new_password": newPassword,
        "new_password_confirmation": confirmpass,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        changetemporaryPass,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',

          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateUserProfiles({
    required String preNotifcation,
    required String firstName,
    required String lastName,
    required String gender,
    required String token,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        "preferred_notification": preNotifcation,
        "firstname": firstName,
        "lastname": lastName,
        "gender": gender,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        updateUserProfile,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateUserProfilespix({
    required File file,
    required String token,
    required BuildContext context,
  }) async {
    try {
      final requestData = FormData.fromMap({
        'profile_image': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      log('Request payload: $requestData');

      final response = await _dio.post(
        updateuserPicture,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500,
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');

      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> onbordingHouseHolds({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required int propertyID,
    required String role,
  }) async {
    // Implementation for member code

    final response = await _dio.post(
      forgetpassOtpverify,
      data: {
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "phone": phone,
        "property_id": propertyID,
        "role": role,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> updateUserpass({
    required String currentPassword,
    required String newPass,
    required String confirmNewpass,
    required String token,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        "current_password": currentPassword,
        "new_password": newPass,
        "new_password_confirmation": confirmNewpass,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        updateUserpassWord,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',

          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deactiveAccount({
    required String currentPassword,
    required String reason,
    required String token,
    required BuildContext context,
  }) async {
    try {
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        "password": currentPassword,
        "reason": reason,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        accountDetactive,
        data: requestData,
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          //   // Add any other headers you see in Postman
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateNotificationSettings({
    required bool value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        key: value,

        // Make it default (required)
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        updateNotificationSetting,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updatePrivacySettings({
    required bool value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        key: value,

        // Make it default (required)
      };

      // Log the exact request being sent
      log('Request payload: $requestData');
      log(_dio.options.baseUrl + updatePrivacySetting);
      final response = await _dio.post(
        updatePrivacySetting,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updatePreferencySettings({
    required String value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        key: value,

        // Make it default (required)
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        upadateSettingPreferences,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateuserNotificationRead({
    required String token,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        // Make it default (required)
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        markNotificationAsRead,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> makeACommentonReport({
    required String token,
    required String comment,
    required bool isInternal,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        // Make it default (required)
        "comment": comment,
        "is_internal": isInternal ? 1 : 0,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/general/violations/$id/comments",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> generateOtpWithValidity({
    required String visitorName,
    required String visitorPurpos,
    required int validityHours,
    required String securityclearancelevel,
    required String vehiclenumber,
    required String phoneNumber,
    required String token,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "visitor_name": visitorName,
        "purpose": visitorPurpos,
        "validity_hours": validityHours,
        "requires_security_validation": true,
        "security_clearance_level":
            securityclearancelevel, // Make it default (required)
        "metadata": {
          //optional (Store additional info like vehicle number)
          "vehicle_number": vehiclenumber,
          "phone_number": phoneNumber,
        },
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        generateOtpWithValidator,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> scheduleOtpWithValidation({
    required String token,
    required String visitorName,
    required int validatorHour,
    required String validatTime,

    required String visitorPurpos,
    required String vehicleNumber,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "visitor_name": visitorName,
        "purpose": visitorPurpos,
        "valid_from": validatTime,
        "validity_hours": validatorHour,
        "requires_security_validation": true,
        "security_clearance_level": "standard",
        "metadata": {
          "vehicle_number": vehicleNumber,
          "phone_number": phoneNumber,
        },
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        schedulOtp,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> revoActiveOtp({
    required String token,
    required int id,
    required String reason,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/general/visitor-otps/$id/revoke",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> revoWorkOder({
    required String token,
    required int id,

    required BuildContext context,
  }) async {
    try {
      // Log the exact request being sent

      final response = await _dio.post(
        "/api/v1/estates/general/workorders/$id/cancel",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createViolation({
    required String categoryID,
    required String estateaddressID,
    required String des,
    required String location,
    required String priority,

    required bool isAnonymouse,
    required String token,
    required File evidence1,
    required File evidence2,
    required BuildContext context,
  }) async {
    log(evidence1.path);
    //     final List<MultipartFile> evidenceList = [
    //   await MultipartFile.fromFile(file1.path, filename: file1.path.split('/').last),
    //   await MultipartFile.fromFile(file2.path, filename: file2.path.split('/').last),
    // ];
    List<File> evidenceFiles = [evidence1, evidence2];
    // Convert Files to MultipartFile
    final List<MultipartFile> evidenceMultipartFiles = [];
    for (var file in evidenceFiles) {
      if (await file.exists()) {
        evidenceMultipartFiles.add(
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        );
      }
    }
    if (!await evidence1.exists()) {
      print("❌ File does not exist");
    }

    final MultipartFile multipartFile = await MultipartFile.fromFile(
      evidence1.path,
      filename: evidence1.path.split('/').last,
    );
    final MultipartFile multipartFile2 = await MultipartFile.fromFile(
      evidence1.path,
      filename: evidence2.path.split('/').last,
    );

    try {
      final requestData = FormData.fromMap({
        "violation_category_id": categoryID,
        "estate_address_id": estateaddressID,
        "description": des,
        "location": location,
        "priority": priority,
        "is_anonymous": isAnonymouse ? "0" : "1",
        "evidence[]": [multipartFile, multipartFile2],
      });
      // final Map<String, dynamic> requestData = {
      //   "violation_category_id": categoryID,
      //   "estate_address_id": estateaddressID,
      //   "description": des,
      //   "location": location,
      //   "priority": priority,
      //   "is_anonymous": isAnonymouse ? "0" : "1",
      //   "evidence[]": [multipartFile],
      //   // Make it default (required)
      // };

      // Log the exact request being sent
      log('Request payload: $requestData');
      log(_dio.options.baseUrl + updatePrivacySetting);
      final response = await _dio.post(
        updatePrivacySetting,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> generateMemberIDForStart({
    required String token,

    required BuildContext context,
  }) async {
    try {
      // Log the exact request being sent

      final response = await _dio.post(
        generateMemberid,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> reGenerateMemberDigiterId({
    required String token,

    required String reason,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        regenerateMemberID,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deActiveMemberDigiterID({
    required String token,

    required String reason,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        deActiveMemberID,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> reActiveMemberDigiterID({
    required String token,

    required BuildContext context,
  }) async {
    try {
      // Log the exact request being sent

      final response = await _dio.post(
        reActiveMemberID,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addHouseHold({
    required String token,

    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phonenumber,
        "property_id": propertyId,
        "role": role,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addHousepropertymanagement({
    required String token,

    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,
    required String desgination,
    required String startDate,
    required String emergencycontactname,
    required String emergencycontactphone,
    required String yearsofexperience,
    required String educationlevel,
    required List<String> specializations,
    required List<String> certifications,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phonenumber,
        "property_id": propertyId,
        "role": role,
        "desgination": desgination,
        "start_date": startDate,
        "emergency_contact_name": emergencycontactname,
        "emergency_contact_phone": emergencycontactphone,
        "years_of_experience": yearsofexperience,
        "education_level": educationlevel,
        "specializations": specializations,
        "certifications": certifications,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addtenant({
    required String token,
    required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required int propertyId,
    required String role,
    required String rentfrequency,
    required String startDate,
    required String status,
    required int agentFees,
    required int securitydeposit,
    required String emergencyContactrelationshipRole,
    required String emergencycontactname,
    required String emergencycontactphone,
    required String employee,
    required String educationlevel,

    required String occupation,
    required int monthlyincome,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phonenumber,
        "property_id": propertyId,
        "role": role,
        "rental_frequency": rentfrequency,
        "security_deposit": securitydeposit,
        "agent_fee": agentFees,
        "start_date": startDate,
        "status": status,
        "occupation": occupation,
        "employer": employee,
        "monthly_income": monthlyincome,
        "emergency_contact_name": emergencycontactname,
        "emergency_contact_phone": emergencycontactphone,
        "emergency_contact_relationship": emergencyContactrelationshipRole,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removedHouseHold({
    required String token,

    required int id,

    required BuildContext context,
  }) async {
    try {
      // Log the exact request being sent

      final response = await _dio.delete(
        "/api/v1/estates/owner-portal/households/members/$id",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      // log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> setCofew({
    required String token,
    required String mondaystart,
    required String mondayEnd,
    required String tusdayStart,
    required String tusdayEnd,
    required String wednesdaystart,
    required String wednesdayEnd,

    required String thursdayStart,
    required String thursdayEnd,

    required int id,
    required String fridayStart,
    required String fridayEnd,
    required String saturdayStart,
    required String saturdayEnd,
    required String sundayStart,
    required String sundayEnd,
    required bool isEnabale,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "curfew_settings": {
          "enabled": isEnabale,
          "restrictions": [
            {"day": "monday", "start_time": mondaystart, "end_time": mondayEnd},
            {
              "day": "tuesday",
              "start_time": tusdayStart,
              "end_time": tusdayEnd,
            },
            {
              "day": "wednesday",
              "start_time": wednesdaystart,
              "end_time": wednesdayEnd,
            },
            {
              "day": "thursday",
              "start_time": thursdayStart,
              "end_time": thursdayEnd,
            },
            {"day": "friday", "start_time": fridayStart, "end_time": fridayEnd},
            {
              "day": "saturday",
              "start_time": saturdayStart,
              "end_time": saturdayEnd,
            },
            {"day": "sunday", "start_time": sundayEnd, "end_time": sundayStart},
          ],
        },
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/curfew",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> grantpermission({
    required String token,
    required String permissionslug,

    required bool isEnabale,
    required int id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": permissionslug,
            "granted": isEnabale,
            "reason": "",
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> grantFacilitieAccess({
    required String token,
    required String mondaystart,
    required String mondayEnd,
    required String tusdayStart,
    required String tusdayEnd,
    required String wednesdaystart,
    required String wednesdayEnd,
    required int id,
    required String thursdayStart,
    required String thursdayEnd,

    required String fridayStart,
    required String fridayEnd,
    required String saturdayStart,
    required String saturdayEnd,
    required String sundayStart,
    required String sundayEnd,
    required String permissionSlug,
    required bool isEnabale,
    required List<String> facilities,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": permissionSlug,
            "granted": isEnabale,
            "reason": reason,
            "conditions": {
              "facilities": facilities,
              "time_restrictions": {
                "monday": {"start_time": mondaystart, "end_time": mondayEnd},
                "tuesday": {"start_time": tusdayStart, "end_time": tusdayEnd},
                "wednesday": {
                  "start_time": wednesdaystart,
                  "end_time": wednesdayEnd,
                },
                "thursday": {
                  "start_time": thursdayStart,
                  "end_time": thursdayEnd,
                },
                "friday": {"start_time": fridayStart, "end_time": fridayEnd},
                "saturday": {
                  "start_time": saturdayStart,
                  "end_time": sundayStart,
                },
                "sunday": {"start_time": sundayStart, "end_time": sundayEnd},
              },
            },
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> grantGateAccess({
    required String token,
    required String mondaystart,
    required String mondayEnd,
    required String tusdayStart,
    required String tusdayEnd,
    required String wednesdaystart,
    required String wednesdayEnd,
    required int id,
    required String thursdayStart,
    required String thursdayEnd,
    required int expiredDay,
    required String fridayStart,
    required String fridayEnd,
    required String saturdayStart,
    required String saturdayEnd,
    required String sundayStart,
    required String sundayEnd,

    required String reason,
    required bool isEnabale,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": "gate_access",
            "granted": isEnabale,
            "reason": reason,
            "conditions": {
              "time_restrictions": {
                "monday": {"start_time": mondaystart, "end_time": mondayEnd},
                "tuesday": {"start_time": tusdayStart, "end_time": tusdayEnd},
                "wednesday": {
                  "start_time": wednesdaystart,
                  "end_time": wednesdayEnd,
                },
                "thursday": {
                  "start_time": thursdayStart,
                  "end_time": thursdayEnd,
                },
                "friday": {"start_time": fridayStart, "end_time": fridayEnd},
                "saturday": {
                  "start_time": saturdayStart,
                  "end_time": sundayStart,
                },
                "sunday": {"start_time": sundayStart, "end_time": sundayEnd},
              },
            },
            "expires_days": expiredDay,
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> grantvisitorAccess({
    required String token,

    required int id,
    required bool isEnabale,
    required int maxvisitorsperday,
    required bool requiredApproval,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": "visitor_invitation",
            "granted": isEnabale,
            "reason": reason,
            "conditions": {
              "max_visitors_per_day": maxvisitorsperday,
              "requires_approval": requiredApproval,
            },
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> communityforum({
    required String token,
    required int id,
    required bool isEnabale,
    required int postLimit,
    required bool moderated,
    required int commentLimit,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": "community_forum",
            "granted": isEnabale,
            "reason": reason,
            "conditions": {
              "moderated": moderated,
              "posting_limits": {
                "daily_posts": postLimit,
                "daily_comments": commentLimit,
              },
            },
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> packAccess({
    required String token,
    required int id,
    required bool isEnabale,

    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": "parking_access",
            "granted": isEnabale,
            "reason": reason,
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> nightAccess({
    required String token,
    required int id,
    required bool isEnabale,

    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "permissions": [
          {
            "permission_slug": "night_access",
            "granted": isEnabale,
            "reason": reason,
          },
        ],
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> landLoardRestriction({
    required String token,
    required int id,
    required bool isEnabale,

    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "restrictions": {
          "revoked": isEnabale,
          // "time_restrictions": {
          //     "allowed_hours": [8, 9, 10, 14, 15, 16],
          //     "restricted_days": ["saturday", "sunday"]
          // }
        },
        "reason": reason,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/owner-portal/digital-member-id/$id/restrict",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> landLoardRemoveRestriction({
    required String token,
    required int id,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "days": 1, // optional (filter)
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.delete(
        "/api/v1/estates/general/owner-portal/digital-member-id/member/$id/restrictions",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  // SECURITY METHOD---------------->

  Future<Map<String, dynamic>> validateDigitaIDbyQRCord({
    required String token,
    required String qrCodeData,
    required String accessType,
    required String location,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "qr_code_data": qrCodeData,

        "access_type": accessType,
        "location": location,
        "metadata": {},
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        validateDigitalIdByQrcode,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validateDigitaIDCode({
    required String token,
    required String qrCodeData,
    required String accessType,
    required String location,
    required String additionalNote,
    required String device_id,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "digital_id_code": qrCodeData,

        "access_type": accessType,
        "location": location,
        "metadata": {
          "additional_notes": additionalNote,
          "device_id": device_id,
        },
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        validateDigitaIDbyManul,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> approvedDigitaIDCode({
    required String token,
    required String qrCodeData,
    required String accessType,
    required String location,
    required String additionalNote,
    required String device_id,
    required String approveType,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "digital_id_code": qrCodeData,

        "access_type": accessType,
        "location": location,
        "metadata": {
          "additional_notes": additionalNote,
          "device_id": device_id,
        },
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/digital-member-id/$approveType",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> checkInOtp({
    required String token,
    required String otpCode,
    required String securityNote,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpCode,
        "security_notes": securityNote, // Optional
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkInValidatorwithOtpbymanual,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> workOrderCheckInOtp({
    required String token,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "security_notes": securityNote, // Optional
        "override_time_window": override_time_window,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkInWorkOrder,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> vendorAccssCodeCheckOut({
    required String token,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "notes": securityNote, // Optional
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkOutWorkOrder,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> vendorAccessCodeCheckIn({
    required String token,
    required String otpCode,
    required String securityNote,
    required bool override_time_window,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "notes": securityNote, // Optional

        "override_time_window": override_time_window,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkInWorkOrder,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> vendorAccessCodeDeny({
    required String token,
    required String otpCode,
    required String dec,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "description": dec, // Optional

        "reason": reason,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        denyingAccess,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validateVendorCode({
    required String token,
    required Map<String, dynamic> requestData,
    required String type,
    required BuildContext context,
  }) async {
    try {
      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        type.contains("1") ? validateVendorCodes : validateWokers,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> checkOutOtp({
    required String token,
    required String otpCode,
    required String securityNote,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpCode,
        "security_notes": securityNote, // Optional
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkOutValidatorOtpBymanual,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> checkOutOtpwithPermit({
    required String token,
    required String otpCode,
    required String securityNote,

    required BuildContext context,
  }) async {
    log(token);
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpCode,
        "security_notes": securityNote, // Optional
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        ckeckOutWithPermit,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> workersCheckOutOtp({
    required String token,
    required String otpCode,
    required String securityNote,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "security_notes": securityNote, // Optional
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        checkOutWorkOrder,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> allWorkersAccess({
    required String token,
    required String action,
    required String note,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "action": action,
        "notes": note,
      };
      log(id);
      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/workorders/$id/access",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> denyAccessForWorkers({
    required String token,
    required String code,
    required String reason,
    required String dec,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": code,
        "reason": reason, // rude,aggressive,intoxicated,no_id,suspicious,other
        "description": dec,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        denyingAccess,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> approvedEntry({
    required String token,
    required String numberofguest,
    required bool requiredEscort,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "gate_action":
            "entry_granted", // entry_granted,entry_denied,awaiting_escort
        "requires_escort": requiredEscort,
        "number_of_guest": numberofguest, // Optional
      };
      log(id);
      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/validations/$id/approve",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> permitapprovedEntry({
    required String token,
    required String otpcode,
    required String note,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpcode, // entry_granted,entry_denied,awaiting_escort
        "checkout_notes": note,
      };
      log(id);
      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/clearance-permits/$id/fulfill",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> denyEntry({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      log("userID:$id");
      final Map<String, dynamic> requestData = {
        "denial_reason": denyReason,
        "security_notes": securityNote,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/validations/$id/deny",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> permitDenyEntry({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      log("userID:$id");
      final Map<String, dynamic> requestData = {
        "flag_reason": denyReason,
        "discrepancy_notes": securityNote,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/clearance-permits/$id/flag",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> denyEntryDigitalID({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      log("userID:$id");
      final Map<String, dynamic> requestData = {
        "denial_reason": denyReason,
        "security_notes": securityNote,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/validations/$id/deny",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resolvedViolation({
    required String token,
    required String reason,

    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"resolution_notes": reason};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/violations/$id/resolve",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> dissmissedViolation({
    required String token,
    required String reason,

    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/security/violations/$id/dismiss",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateReminder({
    required String token,
    required String title,
    required String dec,

    required String time,
    required String notificationmethod,
    required String piority,

    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "title": title,
        "description": dec,
        "reminder_datetime": time,
        "notification_method": notificationmethod,
        "custom_alert_settings": {"priority": piority},
      };

      // Log the exact request being sent
      log('Request payload: $requestData');
      log('Request ID: $id');

      final response = await _dio.post(
        "/api/v1/estates/general/reminders/$id/update",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  String categorys(String value) {
    switch (value.toLowerCase()) {
      case "bill payment":
        return "bill_payment";

      default:
        return value;
    }
  }

  String remeberType(String value) {
    switch (value.toLowerCase()) {
      case "one time":
        return "one_time";

      default:
        return value;
    }
  }

  Future<Map<String, dynamic>> creatReminders({
    required String token,
    required String reason,
    required String title,
    required String dec,
    required String category,
    required String remberType,
    required String time,
    required String frequence,
    required String piority,
    required bool isSharedWithHousehold,
    required String notificationmethod,
    required String intarver,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "title": title,
        "description": dec,
        "category": categorys(
          category,
        ), // payment,maintenance,visitor,community,personal,event,bill_payment
        "reminder_type": remeberType(remberType), //one_time,recurring
        "reminder_datetime": time,
        "recurrence_pattern": {"frequency": frequence, "interval": intarver},
        "notification_method": notificationmethod, // email,sms,all
        "is_shared_with_household": isSharedWithHousehold,
        // "household_members": [789],
        "custom_alert_settings": {"sound": "default", "vibration": true},
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        createReminder,
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> markReminderAsdon({
    required String token,

    required String completeOrCancel,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "/api/v1/estates/general/reminders/$id/$completeOrCancel",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addToCalender({
    required String token,

    required String id,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {"calendar_provider": "internal"};
    try {
      final response = await _dio.post(
        data: requestData,
        "/api/v1/estates/general/events/calendar/$id/add-to-calendar",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> rsvEvent({
    required String token,

    required String goingOrNotgoing,
    required String reasion,
    required String id,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "response": goingOrNotgoing, // maybe, not_going
      "note": reasion,
    };
    try {
      final response = await _dio.post(
        data: requestData,
        "/api/v1/estates/general/events/rsvp/$id/rsvp",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> submitWorkOrders({
    required String token,
    required String file,
    required String name,
    required String dec,
    required String email,
    required String phone,
    required String startDate,
    required String endDate,
    required String dailyWindowTime,
    required String numberofWorkers,
    required String numberofDays,
    required int categorie,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "workorder_category_id": categorie, // maybe, not_going
      "vendor_name": name,
      "vendor_phone": phone, // maybe, not_going
      "start_date": startDate,
      "end_date": endDate, // maybe, not_going
      "daily_time_window": dailyWindowTime,
      "description": dec, // maybe, not_going
      "number_of_workers": numberofWorkers,
      "before_photos[]": [], // maybe, not_going
      "vendor_email": email,
    };
    try {
      final response = await _dio.post(
        data: requestData,
        submitWorkOrder,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> setUpBiometric({
    required String token,
    required String device_token,
    required String biometricType,
    required String device_name,
    required String os_version,
    required String app_version,

    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "device_token": device_token,
      "biometric_type": biometricType,
      "device_info": {
        "device_name": device_name,
        "os_version": os_version,
        "app_version": app_version,
      },
    };
    log(requestData.toString());
    try {
      final response = await _dio.post(
        data: requestData,
        setUpBiometri,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> enable_desable_fingal_faceID({
    required String token,

    required String isEnable,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "/api/v1/auth/biometric/$isEnable",

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> registerDeviceTokens({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    // final Map<String, dynamic> requestData = {
    //  "token": device_token,
    // "device_type": device_type,
    // "device_id": device_id,
    // "platform": platform,
    // "app_version": app_version,
    // "os_version": os_version
    // };
    log(requestData.toString());
    try {
      final response = await _dio.post(
        registerDeviceToken,
        data: requestData,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removedDeviceTokens({
    required Map<String, dynamic> requestData,

    required BuildContext context,
  }) async {
    // final Map<String, dynamic> requestData = {
    //  "token": device_token,
    // "device_type": device_type,
    // "device_id": device_id,
    // "platform": platform,
    // "app_version": app_version,
    // "os_version": os_version
    // };
    log(requestData.toString());
    try {
      final response = await _dio.delete(
        removedDeviceToken,
        data: requestData,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logIngwithFingerPrintAndFaceID({
    required String token,
    required String device_token,
    required String biometric_signature,
    required String email,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "email": email,
      "device_token": device_token,
      "biometric_signature": biometric_signature,
    };
    log(requestData.toString());
    try {
      final response = await _dio.post(
        biometricLogin,
        data: requestData,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addWorkPermit({
    required String token,
    required Map<String, dynamic> requestData,

    required BuildContext context,
  }) async {
    log(requestData.toString());
    try {
      final response = await _dio.post(
        data: requestData,
        createinstantPermit,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> requestEventCodes({
    required String token,
    required String event_title,
    required String event_description,
    required String event_type,
    required String event_start_date,
    required String event_end_date,
    required int expected_guests,

    required String event_location,
    required String special_instructions,

    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "event_title": event_title,
      "event_description": event_description,
      "event_type":
          event_type, // party, wedding, meeting, ceremony, gathering, other
      "event_start_date": event_start_date,
      "event_end_date": event_end_date,
      "expected_guests": expected_guests,
      "event_location": event_location,
      "special_instructions": special_instructions,
    };
    log(requestData.toString());
    try {
      final response = await _dio.post(
        data: requestData,
        requestEventCode,

        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deActiveEventCode({
    required String token,

    required int id,
    required String reason,

    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};
      log(id.toString());
      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        "/api/v1/estates/general/event-codes/$id/revoke",
        data: requestData,
        options: Options(
          // headers: {
          //   'Accept': 'application/json',
          //   'Authorization': 'Bearer $token',
          //   'X-Requested-With': 'XMLHttpRequest',
          // },
          validateStatus: (status) => status! < 500, // Accept 422 as valid
        ),
      );

      log('Request payload: $requestData');

      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Error details:');
      log('Status: ${e.response?.statusCode}');
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }
}
//927763
//302988