import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'conditions.dart';

part 'night_access.freezed.dart';
part 'night_access.g.dart';

@freezed
class NightAccess with _$NightAccess {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory NightAccess({
    @JsonKey(name: 'enabled') bool? enabled,
    @JsonKey(name: 'conditions') Conditions? conditions,
  }) = _NightAccess;

  factory NightAccess.fromJson(Map<String, dynamic> json) =>
      _$NightAccessFromJson(json);

  factory NightAccess.safeFromJson(Map<String, dynamic>? json) {
    return NightAccess(
      enabled: NullSafetyHelper.safeBool(json?['enabled'], ),
      conditions: NullSafetyHelper.safeModel(
        json?['conditions'],
        Conditions.fromJson,
        Conditions.empty(),
      ),
    );
  }

  factory NightAccess.empty() => const NightAccess(
        enabled: false,
      
      );

  factory NightAccess.withDefaults() => NightAccess(
        enabled: false,
        conditions: Conditions.empty(),
      );
}