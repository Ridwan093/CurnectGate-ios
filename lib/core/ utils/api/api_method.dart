import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:dio/dio.dart';

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
  }) async {
    // Implementation for member code
    log(code);
    final response = await _dio.post(
      memberCodeValidation,
      data: {'member_code': code, 'estate_code': estateCode},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> onboardingRegistration({
    required String? membercode,
    required String? estateCode,
    required String? firstname,
    required String? lastName,
    required String? email,
    required String? phoneNumber,
    required String? gender,

    String? password,

    required bool? identityConfirmed,

    required bool? agreetoterms,
  }) async {
    // Implementation for member code
    log(membercode!);
    log(agreetoterms.toString());
    log(estateCode!);
    log(lastName!);
    log(membercode);
    log(firstname!);
    log(password!);
    log(gender!);

    final response = await _dio.post(
      onbordinguserInfo,
      data: {
        'member_code': membercode,
        'estate_code': estateCode,
        "firstname": firstname,
        "lastname": lastName,
        "email": email,
        "phone": phoneNumber,
        "password": password,
        "password_confirmation": password,
        "gender": gender,
        "identity_confirmed": identityConfirmed, // required
        "agree_to_terms": agreetoterms,
      },
    );
    return response.data;
  }
}
