import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'curfew_data_model.dart';

part 'curfew_response_model.freezed.dart';
part 'curfew_response_model.g.dart';

@freezed
class CurfewResponse with _$CurfewResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewResponse({
    bool? status,
    String? message,
    int? code,
    CurfewData? data,
  }) = _CurfewResponse;

  factory CurfewResponse.fromJson(Map<String, dynamic> json) =>
      _$CurfewResponseFromJson(json);

  factory CurfewResponse.fromSafeJson(Map<String, dynamic> json) {
    return CurfewResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(json['data'], CurfewData.fromJson, null),
    );
  }
}
