// api_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'data.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@freezed

class ApiResponseModel with _$ApiResponseModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ApiResponseModel({
    bool? status,
    String? message,
    int? code,
    DataPayload? data,  // New field for nested payload
    // Remove direct visitors, count, etc., or keep as computed if needed
  }) = _ApiResponseModel;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);

  factory ApiResponseModel.fromSafeJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        DataPayload.fromSafeJson,
        DataPayload.empty(),
      ),
    );
  }

  // Computed getters for backward compatibility


  factory ApiResponseModel.empty() => const ApiResponseModel(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}

