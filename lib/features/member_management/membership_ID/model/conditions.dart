import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'conditions.freezed.dart';
part 'conditions.g.dart';

@freezed
class Conditions with _$Conditions {
  @JsonSerializable(explicitToJson: true)
  const factory Conditions({
    @JsonKey(name: 'time_restrictions')  List<dynamic>? timeRestrictions,
  }) = _Conditions;

  factory Conditions.fromJson(Map<String, dynamic> json) =>
      _$ConditionsFromJson(json);

  factory Conditions.safeFromJson(Map<String, dynamic>? json) => Conditions(
        timeRestrictions:
            NullSafetyHelper.safeList(json? ['time_restrictions']),
      );
     factory Conditions.empty() {
    return Conditions(timeRestrictions: []);
  }   
}
