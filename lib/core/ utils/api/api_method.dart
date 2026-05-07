import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

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

  Future<Map<String, dynamic>> submitMemberCode({
    required String code,
    required String estateCode,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'member_code': code,
        'estate_code': estateCode,
      };

      final response = await _dio.post(
        memberCodeValidation,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
      final Map<String, dynamic> requestData = {
        'member_code': membercode,
        'estate_code': estateCode,
        'firstname': firstname,
        'lastname': lastName,
        'email': email,
        'phone': phoneNumber,
        'dob': "",
        'password': password,
        'password_confirmation': password,
        'gender': gender,
        'identity_confirmed': identityConfirmed,
        'agree_to_terms': agreetoterms,
      };

      final response = await _dio.post(
        onbordinguserInfo,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTPcode({
    required String code,
    required String? email,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'email': email,
        'verification_code': code,
      };

      final response = await _dio.post(
        verifyOTPcodes,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException catch (e) {
      showCustomSuccessToast(
        context: context,
        message: e.toString(),
        color: AppColors.instance.teal400,
        icon: Icons.close,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> requestOTPcode({required String? email}) async {
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
        options: Options(validateStatus: (status) => status! < 500),
      );

      final rawCookies = response.headers['set-cookie'];
      if (rawCookies != null && rawCookies.isNotEmpty) {
        final cookieString = rawCookies.first.split(';').first;
        await SharedPrefsService().saveSessionCookie(cookieString);
      }
      return response.data;
    } on DioException {
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
      final Map<String, dynamic> requestData = {'email': email};

      final response = await _dio.post(
        forgetPass,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> verifyOTPForget({
    required String code,
    required String email,
  }) async {
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
      final Map<String, dynamic> requestData = {
        "token": token,
        "email": email,
        "password": newPassword,
        "password_confirmation": confrimPass,
      };

      final response = await _dio.post(
        createNewpass,
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) => status! < 500,
        ),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> changeTemporaryPass({
    required String token,
    required String currentPass,
    required String newPassword,
    required String confirmpass,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "current_password": currentPass,
        "new_password": newPassword,
        "new_password_confirmation": confirmpass,
      };

      final response = await _dio.post(
        changetemporaryPass,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updateUserProfiles({
    required String preNotifcation,
    required String firstName,
    required String lastName,
    required String gender,
    required String token,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "preferred_notification": preNotifcation,
        "firstname": firstName,
        "lastname": lastName,
        "gender": gender,
      };

      final response = await _dio.post(
        updateUserProfile,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
      showCustomSuccessToast(
        context: context,
        message: "",
        color: AppColors.instance.teal400,
        icon: Icons.error,
        iconColors: AppColors.instance.grey200,
        positionNumber: 70,
      );
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

      final response = await _dio.post(
        updateuserPicture,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
      final Map<String, dynamic> requestData = {
        "current_password": currentPassword,
        "new_password": newPass,
        "new_password_confirmation": confirmNewpass,
      };

      final response = await _dio.post(
        updateUserpassWord,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> deactiveAccount({
    required String currentPassword,
    required String reason,
    required String token,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "password": currentPassword,
        "reason": reason,
      };

      final response = await _dio.post(
        accountDetactive,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updateNotificationSettings({
    required bool value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {key: value};

      final response = await _dio.post(
        updateNotificationSetting,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updatePrivacySettings({
    required bool value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {key: value};

      final response = await _dio.post(
        updatePrivacySetting,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updatePreferencySettings({
    required String value,
    required String token,
    required String key,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {key: value};

      final response = await _dio.post(
        upadateSettingPreferences,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updateuserNotificationRead({
    required String token,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        markNotificationAsRead,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> makeACommentonReport({
    required String token,
    required String comment,
    required bool isInternal,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "comment": comment,
        "is_internal": isInternal ? 1 : 0,
      };

      final response = await _dio.post(
        "estates/general/violations/$id/comments",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "security_clearance_level": securityclearancelevel,
        "metadata": {
          "vehicle_number": vehiclenumber,
          "phone_number": phoneNumber,
        },
      };

      final response = await _dio.post(
        generateOtpWithValidator,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        schedulOtp,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> revoActiveOtp({
    required String token,
    required int id,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      final response = await _dio.post(
        "estates/general/visitor-otps/$id/revoke",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> revoWorkOder({
    required String token,
    required int id,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "estates/general/workorders/$id/cancel",
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> createViolation({
    required String categoryID,
    required String estateaddressID,
    required String des,
    required String location,
    required String priority,
    required bool isAnonymous,
    required String token,
    required Map<int, File?> pickedFiles,
    required BuildContext context,
  }) async {
    try {
      final formData = FormData();
      formData.fields.addAll([
        MapEntry('violation_category_id', categoryID),
        MapEntry('estate_address_id', estateaddressID),
        MapEntry('description', des),
        MapEntry('location', location),
        MapEntry('priority', priority),
        MapEntry('is_anonymous', isAnonymous ? '1' : '0'),
      ]);

      for (final file in pickedFiles.values) {
        if (file != null && file.existsSync()) {
          final ext = path.extension(file.path).toLowerCase();
          String mimeType = 'image/jpeg';
          if (ext.endsWith('png')) mimeType = 'image/png';
          if (ext.endsWith('gif')) mimeType = 'image/gif';
          if (ext.endsWith('webp')) mimeType = 'image/webp';

          formData.files.add(
            MapEntry(
              'evidence[]',
              await MultipartFile.fromFile(
                file.path,
                filename: path.basename(file.path),
                contentType: MediaType('image', mimeType.split('/')[1]),
              ),
            ),
          );
        }
      }

      final response = await _dio.post(
        creatViolation,
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          validateStatus: (status) => status! < 500,
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> generateMemberIDForStart({
    required String token,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        generateMemberid,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> reGenerateMemberDigiterId({
    required String token,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      final response = await _dio.post(
        regenerateMemberID,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> deActiveMemberDigiterID({
    required String token,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      final response = await _dio.post(
        deActiveMemberID,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> reActiveMemberDigiterID({
    required String token,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        reActiveMemberID,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        addhousedHol,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> removedHouseHold({
    required String token,
    required int id,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.delete(
        "estates/owner-portal/households/members/$id",
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
            {"day": "sunday", "start_time": sundayStart, "end_time": sundayEnd},
          ],
        },
      };

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/curfew",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
                  "end_time": saturdayEnd,
                },
                "sunday": {"start_time": sundayStart, "end_time": sundayEnd},
              },
            },
          },
        ],
      };

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
                  "end_time": saturdayEnd,
                },
                "sunday": {"start_time": sundayStart, "end_time": sundayEnd},
              },
            },
            "expires_days": expiredDay,
          },
        ],
      };

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/owner-portal/households/members/permission/$id/bulk",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> landLoardRestriction({
    required String token,
    required int id,
    required bool isEnabale,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "restrictions": {"revoked": isEnabale},
        "reason": reason,
      };

      final response = await _dio.post(
        "estates/owner-portal/digital-member-id/$id/restrict",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> landLoardRemoveRestriction({
    required String token,
    required int id,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.delete(
        "estates/owner-portal/digital-member-id/$id/restrictions",
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        validateDigitalIdByQrcode,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        validateDigitaIDbyManul,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  bool _isNumeric(String value) {
    return int.tryParse(value) != null;
  }

  bool _isBase64(String value) {
    try {
      base64.decode(value);
      return true;
    } catch (_) {
      return false;
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
    required String denial_reason,
    required BuildContext context,
  }) async {
    try {
      String digitalIdCode = "";
      String qrCodeBase64 = "";

      if (_isNumeric(qrCodeData)) {
        digitalIdCode = qrCodeData;
      } else if (_isBase64(qrCodeData)) {
        qrCodeBase64 = qrCodeData;
      }

      final Map<String, dynamic> requestData = {
        "access_type": accessType,
        "location": location,
        "metadata": {
          "additional_notes": additionalNote,
          "device_id": device_id,
        },
      };

      if (digitalIdCode.isNotEmpty) {
        requestData["digital_id_code"] = digitalIdCode;
      }
      if (denial_reason.isNotEmpty) {
        requestData["denial_reason"] = denial_reason;
      }
      if (qrCodeBase64.isNotEmpty) {
        requestData["qr_code_data"] = qrCodeBase64;
      }

      final response = await _dio.post(
        "estates/security/digital-member-id/$approveType",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        checkInValidatorwithOtpbymanual,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> grantEventEntrys({
    required int id,
    required String guestName,
    required String guestPhone,
    required String vehiclePlate,
    required int guestCount,
    required String accessPoint,
    required String securityNotes,
    required String validationMethod,
  }) async {
    try {
      final response = await _dio.post(
        "$grantEventEntry$id/grant-entry",
        data: {
          "guest_name": guestName,
          "guest_phone": guestPhone,
          "vehicle_plate_number": vehiclePlate,
          "guest_count": guestCount,
          "access_point": accessPoint,
          "security_notes": securityNotes,
          "validation_method": validationMethod,
        },
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> denyEventEntry({
    required int id,
    required String guestName,
    required String guestPhone,
    required String vehiclePlate,
    required int guestCount,
    required String accessPoint,
    required String securityNotes,
    required String validationMethod,
    required String denialReason,
  }) async {
    try {
      final response = await _dio.post(
        "$denyEventEntrys$id/deny-entry",
        data: {
          "guest_name": guestName,
          "guest_phone": guestPhone,
          "vehicle_plate_number": vehiclePlate,
          "guest_count": guestCount,
          "access_point": accessPoint,
          "security_notes": securityNotes,
          "validation_method": validationMethod,
          "denial_reason": denialReason,
        },
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validateEvenCode({
    required String token,
    required String otpCode,
    required String accessType,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "event_code": otpCode,
        "validation_method": "code_entry", //manual, code_entry
        "access_point": accessType,
      };

      final response = await _dio.post(
        validateEventCode,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );

      return response.data;
    } on DioException {
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
        "security_notes": securityNote,
        "override_time_window": override_time_window,
      };

      final response = await _dio.post(
        checkInWorkOrder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "notes": securityNote,
      };

      final response = await _dio.post(
        checkOutWorkOrder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "notes": securityNote,
        "override_time_window": override_time_window,
      };

      final response = await _dio.post(
        checkInWorkOrder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "description": dec,
        "reason": reason,
      };

      final response = await _dio.post(
        denyingAccess,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> validateVendorCode({
    required String token,
    required Map<String, dynamic> requestData,
    required String type,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        type.contains("1") ? validateVendorCodes : validateWokers,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> checkOutOtp({
    required String token,
    required String otpCode,
    required String securityNote,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpCode,
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        checkOutValidatorOtpBymanual,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> checkOutOtpwithPermit({
    required String token,
    required String otpCode,
    required String securityNote,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpCode,
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        ckeckOutWithPermit,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> workersCheckOutOtp({
    required String token,
    required String otpCode,
    required String securityNote,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "access_code": otpCode,
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        checkOutWorkOrder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/security/workorders/$id/access",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
        "reason": reason,
        "description": dec,
      };

      final response = await _dio.post(
        denyingAccess,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> approvedEntry({
    required String token,
    required String numberofguest,
    required bool requiredEscort,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "gate_action": "entry_granted",
        "requires_escort": requiredEscort,
        "number_of_guest": numberofguest,
      };

      final response = await _dio.post(
        "estates/security/validations/$id/approve",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> permitapprovedEntry({
    required String token,
    required String otpcode,
    required String note,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "otp_code": otpcode,
        "checkout_notes": note,
      };

      final response = await _dio.post(
        "estates/security/clearance-permits/$id/fulfill",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> denyEntry({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "denial_reason": denyReason,
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        "estates/security/validations/$id/deny",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> permitDenyEntry({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "flag_reason": denyReason,
        "discrepancy_notes": securityNote,
      };

      final response = await _dio.post(
        "estates/security/clearance-permits/$id/flag",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> denyEntryDigitalID({
    required String token,
    required String denyReason,
    required String securityNote,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "denial_reason": denyReason,
        "security_notes": securityNote,
      };

      final response = await _dio.post(
        "estates/security/validations/$id/deny",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> resolvedViolation({
    required String token,
    required String reason,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"resolution_notes": reason};

      final response = await _dio.post(
        "estates/security/violations/$id/resolve",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> dissmissedViolation({
    required String token,
    required String reason,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      final response = await _dio.post(
        "estates/security/violations/$id/dismiss",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

      final response = await _dio.post(
        "estates/general/reminders/$id/update",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
    List<int>? householdMembers,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final String type = remeberType(remberType);
      final Map<String, dynamic> requestData = {
        "title": title,
        "description": dec,
        "category": categorys(category),
        "reminder_type": type,
        "reminder_datetime": time.split('.').first,
        if (type != "one_time")
          "recurrence_pattern": {
            "frequency": frequence.toLowerCase(),
            "interval": int.tryParse(intarver) ?? 1,
          },
        "notification_method": notificationmethod.toLowerCase(),
        "is_shared_with_household": isSharedWithHousehold,
        if (isSharedWithHousehold) "household_members": householdMembers ?? [],
        "custom_alert_settings": {"sound": "default", "vibration": true},
      };
      log(requestData.toString());
      final response = await _dio.post(
        createReminder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      log(response.toString());
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> markReminderAsdon({
    required String token,
    required String completeOrCancel,
    required String id,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "estates/general/reminders/$id/$completeOrCancel",
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> addToCalender({
    required String token,
    required String id,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {"calendar_provider": "internal"};

    try {
      final response = await _dio.post(
        "estates/general/events/calendar/$id/add-to-calendar",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> rsvEvent({
    required String token,
    required String goingOrNotgoing,
    required String reasion,
    required String id,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "response": goingOrNotgoing,
      "note": reasion,
    };

    try {
      final response = await _dio.post(
        "estates/general/events/rsvp/$id/rsvp",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> uploadAfterWork({
    required String id,
    required List<File> file,
    required BuildContext context,
  }) async {
    try {
      final formData = FormData();
      if (file.isNotEmpty) {
        for (final f in file) {
          formData.files.add(
            MapEntry(
              "after_photos[]",
              await MultipartFile.fromFile(
                f.path,
                filename: f.path.split('/').last,
              ),
            ),
          );
        }
      }

      final response = await _dio.post(
        "estates/general/workorders/$id/after-photos",
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
          validateStatus: (status) => status! < 500,
        ),
      );
      return response.data;
    } on DioException {
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
      "workorder_category_id": categorie,
      "vendor_name": name,
      "vendor_phone": phone,
      "start_date": startDate,
      "end_date": endDate,
      "daily_time_window": dailyWindowTime,
      "description": dec,
      "number_of_workers": numberofWorkers,
      "before_photos[]": [],
      "vendor_email": email,
    };

    try {
      final response = await _dio.post(
        submitWorkOrder,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> updateWorkOrders({
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
    required String id,
    required int categorie,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> requestData = {
      "workorder_category_id": categorie,
      "vendor_name": name,
      "vendor_phone": phone,
      "start_date": startDate,
      "end_date": endDate,
      "daily_time_window": dailyWindowTime,
      "description": dec,
      "number_of_workers": numberofWorkers,
      "before_photos[]": [],
      "vendor_email": email,
    };

    try {
      final response = await _dio.post(
        "estates/general/workorders/$id/edit",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

    try {
      final response = await _dio.post(
        setUpBiometri,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> enable_desable_fingal_faceID({
    required String token,
    required String isEnable,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "auth/biometric/$isEnable",
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> registerDeviceTokens({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        registerDeviceToken,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> removedDeviceTokens({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.delete(
        removedDeviceToken,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

    try {
      final response = await _dio.post(
        biometricLogin,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );

      final rawCookies = response.headers['set-cookie'];
      if (rawCookies != null && rawCookies.isNotEmpty) {
        final cookieString = rawCookies.first.split(';').first;
        await SharedPrefsService().saveSessionCookie(cookieString);
      }
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> addWorkPermit({
    required String token,
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        createinstantPermit,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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
      "event_type": event_type,
      "event_start_date": event_start_date,
      "event_end_date": event_end_date,
      "expected_guests": expected_guests,
      "event_location": event_location,
      "special_instructions": special_instructions,
    };

    try {
      final response = await _dio.post(
        requestEventCode,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> deActiveEventCode({
    required String token,
    required int id,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"reason": reason};

      final response = await _dio.post(
        "estates/general/event-codes/$id/revoke",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> castVote({
    required Map<String, dynamic> requestData,
    required String id,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        "estates/general/voting/polls/$id/vote",
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> paydueOutStanding({
    required List<Map<String, dynamic>> payments,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"payments": payments};

      final response = await _dio.post(
        payduePayment,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> payFullOutstanding({
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        payFullPayment,
        options: Options(validateStatus: (status) => status! < 500),
      );
      log(response.toString());
      return response.data;
    } on DioException {
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

  Future<Map<String, dynamic>> initialisWalletFunding({
    required String paymentMethod,
    required double Amout,
    required String paymentRefrenc,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "amount": Amout,
        "payment_method": paymentMethod,
        "payment_gateway": "paystack",
        "transaction_reference": paymentRefrenc,
      };
      // log(requestData.toString());
      final response = await _dio.post(
        initialFundWallet,
        data: requestData,
        options: Options(validateStatus: (status) => status! < 500),
      );
      // log(response.data.toString());
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateTypingStatus({
    required BuildContext context,
    required int conversationId,
    required bool isTyping,
  }) async {
    try {
      final response = await _dio.post(
        "estates/security/messaging/conversations/$conversationId/typing",
        data: {'is_typing': isTyping},
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteMessage({
    required BuildContext context,
    required int id,
  }) async {
    try {
      final response = await _dio.delete(
        "estates/general/messaging/messages/$id",
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendMessage({
    required String message,
    File? file,
    required BuildContext context,
    required int id,
  }) async {
    try {
      dynamic requestData;
      if (file != null) {
        requestData = FormData.fromMap({
          "message_text": message,
          "attachments[]": await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        });
      } else {
        requestData = {"message_text": message};
      }

      final response = await _dio.post(
        "estates/general/messaging/conversations/$id/messages",
        data: requestData,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> markMessageRead({required int id}) async {
    try {
      final response = await _dio.post(
        "estates/security/messaging/conversations/$id/mark-read",
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> chattingSetting({
    required bool do_not_disturb,
    required int dnd_duration_hours,
    required int id,
    required BuildContext context,
  }) async {
    try {
      final requestData = {
        "do_not_disturb": do_not_disturb,
        "dnd_duration_hours": dnd_duration_hours,
      };

      final response = await _dio.post(
        "estates/general/messaging/conversations/$id/settings",
        data: requestData,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> agreementsiging({
    required String signatur,
    required String fullName,
    required BuildContext context,
  }) async {
    try {
      final requestData = {"signature": signatur, "full_name": fullName};

      final response = await _dio.post(
        agreementSign,
        data: requestData,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> termsAndCondition({
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(
        termAccept,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> agreementAndTermsDecline({
    required bool isProperty,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      final requestData = {
        "agreement_type":
            isProperty ? "property_agreement" : "terms_and_conditions",
        "reason": reason,
      };

      final response = await _dio.post(
        decline,
        data: requestData,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendInitialMessage({
    required String message,
    required String id,
    required String type,
    required BuildContext context,
  }) async {
    try {
      final requestData = {
        "type": type,
        "recipient_id": id,
        "initial_message": message,
      };
      log(requestData.toString());
      final response = await _dio.post(
        startConversation,
        data: requestData,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> markMessagCount() async {
    try {
      final response = await _dio.post(
        markUnreadCount,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
          headers: {"Accept": "application/json"},
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
