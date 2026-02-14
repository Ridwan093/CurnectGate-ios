import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_data.dart';

part 'violation_category_response.freezed.dart';
part 'violation_category_response.g.dart';

@freezed
class ViolationCategoryResponse with _$ViolationCategoryResponse {
  const factory ViolationCategoryResponse({
    bool? status,
    String? message,
    int? code,
    CategoryData? data,
  }) = _ViolationCategoryResponse;

  factory ViolationCategoryResponse.safeFromJson(Map<String, dynamic>? json) {
    return ViolationCategoryResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data:
          json?['data'] == null
              ? null
              : CategoryData.safeFromJson(json?['data']),
    );
  }

  factory ViolationCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ViolationCategoryResponseFromJson(json);
}
