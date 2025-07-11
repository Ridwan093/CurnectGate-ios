import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
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

  Future<Map<String, dynamic>> updateUserProfiles({
    required String preNotifcation,
    required String firstName,
    required String lastName,
    required String gender,
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
            'Authorization':
                'Bearer 37|6MD9VBm9YsdxbkDAg4NXRKOIC11qDyiDBVE5JyMp71746a57',
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

  Future<Map<String, dynamic>> updateUserProfilespix({
    required File file,
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
            'Authorization':
                'Bearer 37|6MD9VBm9YsdxbkDAg4NXRKOIC11qDyiDBVE5JyMp71746a57',
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

  Future<Map<String, dynamic>> generateOtpWithValidity({
    required String visitorName,
    required String visitorPurpos,
    required int validityHours,
    required String securityclearancelevel,
    required String vehiclenumber,
    required String phoneNumber,

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
        createNewpass,
        data: requestData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer 29|aW3V4srP4NFmj3ztaBp5ntozekRSncfrzsg4b0zr48498c79',
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

  ////. GET METHOD AT THE BOTTOM ---------------->
}
