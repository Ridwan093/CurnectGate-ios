import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'clearance_permit_data.dart';

part 'clearance_permit_response.freezed.dart';
part 'clearance_permit_response.g.dart';

@freezed
class ClearancePermitResponse with _$ClearancePermitResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ClearancePermitResponse({
    bool? status,
    String? message,
    int? code,
    ClearancePermitData? data,
  }) = _ClearancePermitResponse;

  factory ClearancePermitResponse.fromJson(Map<String, dynamic> json) =>
      _$ClearancePermitResponseFromJson(json);

  factory ClearancePermitResponse.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return ClearancePermitResponse.empty();
    return ClearancePermitResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        ClearancePermitData.fromSafeJson,
        ClearancePermitData.empty(),
      ),
    );
  }

  factory ClearancePermitResponse.empty() => const ClearancePermitResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}
