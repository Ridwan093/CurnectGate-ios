import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'option_model.dart';

part 'preference_model.freezed.dart';
part 'preference_model.g.dart';
@freezed
class Preference with _$Preference {
  const factory Preference({
    @Default('') String key,
    @Default('') String name,
    @Default('') String type,
    @Default('') String value,
    @Default('') String description,
    @Default([]) List<Option> options,
  }) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);

  factory Preference.fromSafeJson(Map<String, dynamic> json) {
    return Preference.fromJson({
      ...json,
      'options': NullSafetyHelper.safeList<Map<String, dynamic>>(
        json['options'],
      ).map((e) => Option.fromJson(e)).toList(),
    });
  }
}
