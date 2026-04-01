import 'package:freezed_annotation/freezed_annotation.dart';

import 'conversation_settings.dart';

part 'conversation_settings_data.freezed.dart';
part 'conversation_settings_data.g.dart';

@freezed
class ConversationSettingsData with _$ConversationSettingsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ConversationSettingsData({ConversationSettings? settings}) =
      _ConversationSettingsData;

  factory ConversationSettingsData.fromJson(Map<String, dynamic> json) =>
      _$ConversationSettingsDataFromJson(json);
  factory ConversationSettingsData.fromSafeJson(Map<String, dynamic> json) {
    return ConversationSettingsData(
      settings:
          json["settings"] != null
              ? ConversationSettings.fromSafeJson(json["settings"])
              : null,
    );
  }
}
