import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'estate_settings_data.dart';

part 'estate_settings_response.freezed.dart';
part 'estate_settings_response.g.dart';

@freezed
class EstateSettingsResponse with _$EstateSettingsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateSettingsResponse({
    bool? status,
    String? message,
    int? code,
    EstateSettingsData? data,
  }) = _EstateSettingsResponse;

  factory EstateSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$EstateSettingsResponseFromJson(json);

  factory EstateSettingsResponse.safeFromJson(Map<String, dynamic>? json) {
    return EstateSettingsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: EstateSettingsData.safeFromJson(
        NullSafetyHelper.safeMap(json?['data']),
      ),
    );
  }

  factory EstateSettingsResponse.empty() => const EstateSettingsResponse(
    status: false,
    message: '',
    code: 0,
    data: null,
  );
}
