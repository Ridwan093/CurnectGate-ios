import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'conditions_model.freezed.dart';
part 'conditions_model.g.dart';
@freezed
class Conditions with _$Conditions {
   @JsonSerializable(explicitToJson: true)
  const factory Conditions({
    @Default([]) List<dynamic> timeRestrictions,
  }) = _Conditions;

  factory Conditions.fromJson(Map<String, dynamic> json) =>
      _$ConditionsFromJson(json);

  factory Conditions.fromSafeJson(Map<String, dynamic> json) {
    return Conditions.fromJson({
      ...json,
      'time_restrictions': NullSafetyHelper.safeList<dynamic>(
        json['time_restrictions'],
      ),
    });
  }
}
