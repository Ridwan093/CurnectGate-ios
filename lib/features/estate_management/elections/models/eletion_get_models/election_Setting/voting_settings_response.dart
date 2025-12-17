import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'voting_settings_data.dart';


part 'voting_settings_response.freezed.dart';
part 'voting_settings_response.g.dart';

@freezed
class VotingSettingsResponse with _$VotingSettingsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VotingSettingsResponse({
    bool? status,
    String? message,
    int? code,
    VotingSettingsData? data,
  }) = _VotingSettingsResponse;

  factory VotingSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$VotingSettingsResponseFromJson(json);

  factory VotingSettingsResponse.safeFromJson(Map<String, dynamic>? json) {
    return VotingSettingsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: VotingSettingsData.safeFromJson(json?['data']),
    );
  }

  factory VotingSettingsResponse.empty() => VotingSettingsResponse(
        status: false,
        message: '',
        code: 0,
        data: VotingSettingsData.empty(),
      );
}
