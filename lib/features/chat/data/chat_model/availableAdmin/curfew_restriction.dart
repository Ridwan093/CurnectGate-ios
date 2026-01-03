import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'curfew_restriction.freezed.dart';
part 'curfew_restriction.g.dart';

@freezed
class CurfewRestriction with _$CurfewRestriction {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewRestriction({
    String? day,
    String? startTime,
    String? endTime,
  }) = _CurfewRestriction;

  factory CurfewRestriction.fromJson(Map<String, dynamic> json) =>
      _$CurfewRestrictionFromJson(json);

  factory CurfewRestriction.safeFromJson(Map<String, dynamic>? json) {
    return CurfewRestriction(
      day: NullSafetyHelper.safeString(json?['day']),
      startTime: NullSafetyHelper.safeString(json?['start_time']),
      endTime: NullSafetyHelper.safeString(json?['end_time']),
    );
  }

  factory CurfewRestriction.empty() =>
      const CurfewRestriction(day: '', startTime: '', endTime: '');
}
