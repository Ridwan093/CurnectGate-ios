import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'curfew_restriction.dart';

part 'curfew_settings.freezed.dart';
part 'curfew_settings.g.dart';

@freezed
class CurfewSettings with _$CurfewSettings {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewSettings({
    bool? enabled,
    List<CurfewRestriction>? restrictions,
  }) = _CurfewSettings;

  factory CurfewSettings.fromJson(Map<String, dynamic> json) =>
      _$CurfewSettingsFromJson(json);

  factory CurfewSettings.safeFromJson(Map<String, dynamic>? json) {
    return CurfewSettings(
      enabled: NullSafetyHelper.safeBool(json?['enabled']),
      restrictions: NullSafetyHelper.safeMapList(json?['restrictions'])
          .map((e) => CurfewRestriction.safeFromJson(e))
          .toList(),
    );
  }

  factory CurfewSettings.empty() =>
      const CurfewSettings(enabled: false, restrictions: []);
}
