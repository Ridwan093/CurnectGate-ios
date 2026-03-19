import 'package:curnectgate/features/chat/data/model/get_model/conversation_settings_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_settings_response.freezed.dart';
part 'conversation_settings_response.g.dart';

@freezed
class ConversationSettingsResponse with _$ConversationSettingsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ConversationSettingsResponse({
    String? message,
    ConversationSettingsData? data,
  }) = _ConversationSettingsResponse;

  factory ConversationSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationSettingsResponseFromJson(json);

  factory ConversationSettingsResponse.fromSafeJson(Map<String, dynamic> json) {
    return ConversationSettingsResponse.fromJson({
      "message": NullSafetyHelper.safeString(json["message"]),
      "data":
          json["data"] != null
              ? ConversationSettingsData.fromSafeJson(json["data"])
              : null,
    });
  }
}
