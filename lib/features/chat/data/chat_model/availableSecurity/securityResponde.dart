import 'package:curnectgate/features/chat/data/chat_model/availableSecurity/securityData.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'securityResponde.freezed.dart';
part 'securityResponde.g.dart';

@freezed
class SecurityPersonnelResponse with _$SecurityPersonnelResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SecurityPersonnelResponse({
    bool? success,
    String? message,
    SecurityPersonnelData? data,
  }) = _SecurityPersonnelResponse;

  factory SecurityPersonnelResponse.fromJson(Map<String, dynamic> json) =>
      _$SecurityPersonnelResponseFromJson(json);

  factory SecurityPersonnelResponse.fromSafeJson(Map<String, dynamic> json) {
    return SecurityPersonnelResponse(
      success: NullSafetyHelper.safeBool(json["success"]),
      message: NullSafetyHelper.safeString(json["message"]),
      data:
          json["data"] != null
              ? SecurityPersonnelData.fromSafeJson(json["data"])
              : null,
    );
  }
}
