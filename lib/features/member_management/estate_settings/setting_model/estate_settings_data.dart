import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'emergency_contacts.dart';
import 'estate_info.dart';

part 'estate_settings_data.freezed.dart';
part 'estate_settings_data.g.dart';

@freezed
class EstateSettingsData with _$EstateSettingsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateSettingsData({
    Map<String, EmergencyContacts>? settings,
    String? type,
    EstateInfo? estate,
  }) = _EstateSettingsData;

  factory EstateSettingsData.fromJson(Map<String, dynamic> json) =>
      _$EstateSettingsDataFromJson(json);

  factory EstateSettingsData.safeFromJson(Map<String, dynamic>? json) {
    return EstateSettingsData(
      settings: (NullSafetyHelper.safeMap(json?['settings']).map(
        (key, value) => MapEntry(
          key,
          EmergencyContacts.safeFromJson(NullSafetyHelper.safeMap(value)),
        ),
      )),
      type: NullSafetyHelper.safeString(json?['type']),
      estate: EstateInfo.safeFromJson(
        NullSafetyHelper.safeMap(json?['estate']),
      ),
    );
  }

  factory EstateSettingsData.empty() =>
      const EstateSettingsData(settings: {}, type: '', estate: null);
}
