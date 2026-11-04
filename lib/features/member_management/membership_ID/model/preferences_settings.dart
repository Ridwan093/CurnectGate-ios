import 'package:freezed_annotation/freezed_annotation.dart';
import 'preference_item.dart';

part 'preferences_settings.freezed.dart';
part 'preferences_settings.g.dart';

@freezed
class PreferencesSettings with _$PreferencesSettings {
  @JsonSerializable(explicitToJson: true)
  const factory PreferencesSettings({
    @JsonKey(defaultValue: [])
    List<PreferenceItem>? items,
  }) = _PreferencesSettings;

  factory PreferencesSettings.fromJson(Map<String, dynamic> json) =>
      _$PreferencesSettingsFromJson(json);

  factory PreferencesSettings.safeFromJson(dynamic json) {
    if (json is! List) return PreferencesSettings.empty();

    return PreferencesSettings(
      items: json
          .map((e) => PreferenceItem.safeFromJson(e))
          .toList(),
    );
  }

  factory PreferencesSettings.empty() =>
      const PreferencesSettings(items: []);
}
