import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'agreements_container.dart';
import 'user_info.dart';

part 'agreements_data.freezed.dart';
part 'agreements_data.g.dart';

@freezed
class AgreementsData with _$AgreementsData {
  @JsonSerializable(explicitToJson: true)
  const factory AgreementsData({
    AgreementsContainer? agreements,
    bool? needsAction,
    List<String>? requiredActions,
    UserInfo? userInfo,
  }) = _AgreementsData;

  factory AgreementsData.fromJson(Map<String, dynamic> json) =>
      _$AgreementsDataFromJson(json);

  factory AgreementsData.safeFromJson(Map<String, dynamic>? json) {
    return AgreementsData(
      agreements: NullSafetyHelper.safeModel(
        json?['agreements'],
        AgreementsContainer.safeFromJson,
        null,
      ),
      needsAction: NullSafetyHelper.safeBool(json?['needs_action']),
      requiredActions:
          NullSafetyHelper.safeStringList(json?['required_actions']),
      userInfo: NullSafetyHelper.safeModel(
        json?['user_info'],
        UserInfo.safeFromJson,
        null,
      ),
    );
  }
}
