import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'preference.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    Preference? currency,
    Preference? language,
    Preference? timezone,
    @JsonKey(name: 'date_format') Preference? dateFormat,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  factory Preferences.safeFromJson(Map<String, dynamic>? json) => Preferences(
        currency: NullSafetyHelper.safeModel<Preference>(
          json?['currency'],
          Preference.fromJson,
          null,
        ),
        language: NullSafetyHelper.safeModel<Preference>(
          json?['language'],
          Preference.fromJson,
          null,
        ),
        timezone: NullSafetyHelper.safeModel<Preference>(
          json?['timezone'],
          Preference.fromJson,
          null,
        ),
        dateFormat: NullSafetyHelper.safeModel<Preference>(
          json?['date_format'],
          Preference.fromJson,
          null,
        ),
      );
}
