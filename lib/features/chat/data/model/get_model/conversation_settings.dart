import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_settings.freezed.dart';
part 'conversation_settings.g.dart';

@freezed
class ConversationSettings with _$ConversationSettings {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ConversationSettings({
    int? id,
    int? conversationId,
    bool? notificationsEnabled,
    bool? doNotDisturb,
    String? dndUntil,
    bool? dndActive,
    bool? archived,
    bool? pinned,
    String? createdAt,
    String? updatedAt,
  }) = _ConversationSettings;

  factory ConversationSettings.fromJson(Map<String, dynamic> json) =>
      _$ConversationSettingsFromJson(json);

  factory ConversationSettings.fromSafeJson(Map<String, dynamic> json) {
    return ConversationSettings.fromJson({
      "id": NullSafetyHelper.safeInt(json["id"]),
      "conversation_id": NullSafetyHelper.safeInt(json["conversation_id"]),
      "notifications_enabled": NullSafetyHelper.safeBool(
        json["notifications_enabled"],
      ),
      "do_not_disturb": NullSafetyHelper.safeBool(json["do_not_disturb"]),
      "dnd_until": NullSafetyHelper.safeString(json["dnd_until"]),
      "dnd_active": NullSafetyHelper.safeBool(json["dnd_active"]),
      "archived": NullSafetyHelper.safeBool(json["archived"]),
      "pinned": NullSafetyHelper.safeBool(json["pinned"]),
      "created_at": NullSafetyHelper.safeString(json["created_at"]),
      "updated_at": NullSafetyHelper.safeString(json["updated_at"]),
    });
  }
}
