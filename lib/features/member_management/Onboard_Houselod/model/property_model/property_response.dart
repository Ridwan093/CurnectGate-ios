import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'property_data.dart';

part 'property_response.freezed.dart';
part 'property_response.g.dart';

@freezed
class PropertyResponse with _$PropertyResponse {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory PropertyResponse({
    @JsonKey(name: 'status') required bool status,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'data') required PropertyData data,
  }) = _PropertyResponse;

  factory PropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyResponseFromJson(json);

  factory PropertyResponse.safeFromJson(Map<String, dynamic>? json) =>
      PropertyResponse(
        status: NullSafetyHelper.safeBool(json?['status']),
        message: NullSafetyHelper.safeString(json?['message']),
        code: NullSafetyHelper.safeInt(json?['code']),
        data: PropertyData.safeFromJson(json?['data']),
      );
}