import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_restriction_model.freezed.dart';
part 'time_restriction_model.g.dart';

// time_restriction_model.dart
@freezed
class TimeRestriction with _$TimeRestriction {
  const factory TimeRestriction({
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _TimeRestriction;

  factory TimeRestriction.fromJson(Map<String, dynamic> json) => _$TimeRestrictionFromJson(json);

  factory TimeRestriction.safeFromJson(Map<String, dynamic>? json) {
    return TimeRestriction(
      startTime: NullSafetyHelper.safeString(json?['start_time']),
      endTime: NullSafetyHelper.safeString(json?['end_time']),
    );
  }
}