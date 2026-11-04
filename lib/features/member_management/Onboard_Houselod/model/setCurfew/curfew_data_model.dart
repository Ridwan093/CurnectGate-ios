import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'curfew_member_model.dart';
import 'curfew_settings_model.dart';

part 'curfew_data_model.freezed.dart';
part 'curfew_data_model.g.dart';

@freezed
class CurfewData with _$CurfewData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewData({
    CurfewMember? member,
    CurfewSettings? curfewSettings,
  }) = _CurfewData;

  factory CurfewData.fromJson(Map<String, dynamic> json) =>
      _$CurfewDataFromJson(json);

  factory CurfewData.fromSafeJson(Map<String, dynamic> json) {
    return CurfewData(
      member: NullSafetyHelper.safeModel(
        json['member'],
        CurfewMember.fromJson,
        null,
      ),
      curfewSettings: NullSafetyHelper.safeModel(
        json['curfew_settings'],
        CurfewSettings.fromJson,
        null,
      ),
    );
  }
}
