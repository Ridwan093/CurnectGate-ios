import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
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
      log('Headers: ${e.response?.headers}');
      log('Response: ${e.response?.data}');
      log('Request: ${e.requestOptions.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTPcode({
    required String code,
    required String email,
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

  Future<Map<String, dynamic>> requestOTPcode({required String email}) async {
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
      // Remove all nullable parameters (use required instead)
      final Map<String, dynamic> requestData = {
        'password': pass,
        'email': email,
      };

      // Log the exact request being sent
      log('Request payload: $requestData');

      final response = await _dio.post(
        loginUrl,
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

      // log('Response: ${response.data}');

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
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',

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
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
        makeCommentViolation,
        data: requestData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
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
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
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
}
