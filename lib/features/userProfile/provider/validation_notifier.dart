// validation_bottom_sheet.dart
import 'dart:developer';

import 'package:curnectgate/features/member_management/profile_form/provider%20/member_code%20_repo.dart';
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// validation_notifier.dart
class ValidationNotifier extends StateNotifier<ValidationState> {
  final Ref ref;

  ValidationNotifier(this.ref) : super(ValidationState());

  Future<void> validateMemberCode(
    String code,
    String estateCode,
    String estateName,
  ) async {
    state = state.copyWith(status: ValidationStatus.loading);

    try {
      final response = await ref
          .read(memberCodeRepositoryProvider)
          .submitMemberCode(code: code, estateCode: estateCode);

      if (response['status'] == true) {
        state = state.copyWith(
          status: ValidationStatus.success,
          memberAddress:
              response['data']["estate_info"]!['address'] ??
              "Address not available",
          memberHouseName: response['data']['estate_name'] ?? "Member",
          firstName: response['data']['firstname'] ?? "firstname",
          lastName: response['data']['lastname'] ?? "lastname",
          estateCode: response['data']['estate_info']!['estate_code'] ?? "",
          digitalID: response["data"]["role"],
          role: response["data"]["digital_id_code"],
          userEmail: response["data"]["email"],
          userPhoneNumber: response["data"]["phone"],
        );
        log(response['data'].toString());
      } else {
        state = state.copyWith(
          status: ValidationStatus.error,
          errorMessage:
              response['message'] ??
              "We couldn't find this ID for $estateName, please check your ID or contact your estate management",
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(
        status: ValidationStatus.error,
        errorMessage: _formatErrorMessage(e, estateName),
      );
    } catch (e) {
      state = state.copyWith(
        status: ValidationStatus.error,
        errorMessage: "An unexpected error occurred. Please try again.",
      );
    }
  }

  String _formatErrorMessage(DioException e, String estateName) {
    if (e.type == DioExceptionType.connectionError) {
      return "Network error. Please check your connection.";
    }
    return "We couldn't find this ID for $estateName, please check your ID or contact your estate management";
  }

  void reset() {
    state = ValidationState();
  }
}

final validationProvider =
    StateNotifierProvider<ValidationNotifier, ValidationState>(
      (ref) => ValidationNotifier(ref),
    );
