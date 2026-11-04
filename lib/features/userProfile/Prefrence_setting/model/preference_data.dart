import 'package:freezed_annotation/freezed_annotation.dart';



import 'preferences.dart';

part 'preference_data.freezed.dart';
part 'preference_data.g.dart';

@freezed
class PreferenceData with _$PreferenceData {
    @JsonSerializable(explicitToJson: true)
  const factory PreferenceData({
    Preferences? preferences,
  }) = _PreferenceData;

  factory PreferenceData.fromJson(Map<String, dynamic> json) =>
      _$PreferenceDataFromJson(json);

  factory PreferenceData.safeFromJson(Map<String, dynamic>? json) =>
      PreferenceData(
        preferences:
            Preferences.safeFromJson(json?['preferences'] as Map<String, dynamic>?),
      );
}
