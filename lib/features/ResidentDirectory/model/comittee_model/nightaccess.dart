

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'nightaccess_condition.dart';
part 'nightaccess.freezed.dart';
part 'nightaccess.g.dart';

@freezed
class NightAccess with _$NightAccess {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory NightAccess({
    bool? enabled,
    NightAccessConditions? conditions,
  }) = _NightAccess;

  factory NightAccess.fromJson(Map<String, dynamic> json) =>
      _$NightAccessFromJson(json);

  factory NightAccess.fromSafeJson(Map<String, dynamic> json) {
    return NightAccess(
      enabled: NullSafetyHelper.safeBool(json['enabled']),
      conditions: NullSafetyHelper.safeModel(
          json['conditions'], NightAccessConditions.fromSafeJson, NightAccessConditions.empty()),
    );
  }

  factory NightAccess.empty() => const NightAccess(enabled: null, conditions: null);
}