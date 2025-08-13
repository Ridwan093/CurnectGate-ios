import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'option.dart';

part 'preference.freezed.dart';
part 'preference.g.dart';

@freezed
class Preference with _$Preference {
  const factory Preference({
    String? name,
    String? description,
    String? type,
    List<Option>? options,
    String? key,
    String? value,
  }) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);

  factory Preference.safeFromJson(Map<String, dynamic>? json) => Preference(
        name: NullSafetyHelper.safeString(json?['name']),
        description: NullSafetyHelper.safeString(json?['description']),
        type: NullSafetyHelper.safeString(json?['type']),
        key: NullSafetyHelper.safeString(json?['key']),
        value: NullSafetyHelper.safeString(json?['value']),
        options: NullSafetyHelper.safeList<Option>(
          json?['options'],
       
        ),
      );
}
