import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'conditions_model.dart';

part 'night_access_model.freezed.dart';
part 'night_access_model.g.dart';
@freezed
class NightAccess with _$NightAccess {
  const factory NightAccess({
    @Default(false) bool enabled,
    Conditions? conditions,
  }) = _NightAccess;

  factory NightAccess.fromJson(Map<String, dynamic> json) =>
      _$NightAccessFromJson(json);

  factory NightAccess.fromSafeJson(Map<String, dynamic> json) {
    return NightAccess.fromJson({
      ...json,
      'conditions': NullSafetyHelper.safeModel(
        json['conditions'],
        Conditions.fromJson,
        Conditions(timeRestrictions: []),
      )?.toJson(),
    });
  }
}
