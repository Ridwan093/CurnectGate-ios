import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'curfew_restriction_model.dart';

part 'curfew_settings_model.freezed.dart';
part 'curfew_settings_model.g.dart';

@freezed
class CurfewSettings with _$CurfewSettings {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewSettings({
    bool? enabled,
    List<CurfewRestriction>? restrictions,
  }) = _CurfewSettings;

  factory CurfewSettings.fromJson(Map<String, dynamic> json) =>
      _$CurfewSettingsFromJson(json);

  factory CurfewSettings.fromSafeJson(Map<String, dynamic> json) {
    return CurfewSettings(
      enabled: NullSafetyHelper.safeBool(json['enabled']),
      restrictions:
          (json['restrictions'] as List<dynamic>?)
              ?.map((e) => CurfewRestriction.fromSafeJson(e))
              .whereType<CurfewRestriction>()
              .toList(),
    );
  }
}
