import 'package:freezed_annotation/freezed_annotation.dart';
import 'privacy_item.dart';

part 'privacy_settings.freezed.dart';
part 'privacy_settings.g.dart';

@freezed
class PrivacySettings with _$PrivacySettings {
  @JsonSerializable(explicitToJson: true)
  const factory PrivacySettings({
    @JsonKey(defaultValue: [])
    List<PrivacyItem>? items,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);

  factory PrivacySettings.safeFromJson(dynamic json) {
    if (json is! List) return PrivacySettings.empty();

    return PrivacySettings(
      items: json
          .map((e) => PrivacyItem.safeFromJson(e))
          .toList(),
    );
  }

  factory PrivacySettings.empty() => const PrivacySettings(items: []);
}
