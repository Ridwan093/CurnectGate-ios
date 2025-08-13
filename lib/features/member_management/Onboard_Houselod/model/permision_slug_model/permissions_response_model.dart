import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_model.dart';
import 'member_model.dart';
import 'permission_model.dart';
import 'summary_model.dart';

part 'permissions_response_model.freezed.dart';
part 'permissions_response_model.g.dart';

// permissions_response_model.dart
@freezed
class PermissionsResponse with _$PermissionsResponse {
  const factory PermissionsResponse({
    bool? status,
    String? message,
    int? code,
    PermissionsData? data,
  }) = _PermissionsResponse;

  factory PermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionsResponseFromJson(json);

  factory PermissionsResponse.safeFromJson(Map<String, dynamic>? json) {
    return PermissionsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PermissionsData.safeFromJson(json?['data']),
    );
  }
}
