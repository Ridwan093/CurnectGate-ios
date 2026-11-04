import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'voting_settings_item.dart';

part 'voting_settings_data.freezed.dart';
part 'voting_settings_data.g.dart';

@freezed
class VotingSettingsData with _$VotingSettingsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VotingSettingsData({VotingSettingsItem? settings}) =
      _VotingSettingsData;

  factory VotingSettingsData.fromJson(Map<String, dynamic> json) =>
      _$VotingSettingsDataFromJson(json);

  factory VotingSettingsData.safeFromJson(Map<String, dynamic>? json) {
    return VotingSettingsData(
      settings: VotingSettingsItem.safeFromJson(
        NullSafetyHelper.safeMap(json?['settings']),
      ),
    );
  }

  factory VotingSettingsData.empty() =>
      const VotingSettingsData(settings: null);
}
