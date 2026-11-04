import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'restriction_status_data.dart';

part 'restriction_status_response.freezed.dart';
part 'restriction_status_response.g.dart';

@freezed
class RestrictionStatusResponse with _$RestrictionStatusResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RestrictionStatusResponse({
    bool? status,
    String? message,
    int? code,
    RestrictionStatusData? data,
  }) = _RestrictionStatusResponse;

  factory RestrictionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$RestrictionStatusResponseFromJson(json);

  factory RestrictionStatusResponse.safeFromJson(
      Map<String, dynamic>? json) {
    return RestrictionStatusResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: RestrictionStatusData.safeFromJson(json?['data']),
    );
  }
}