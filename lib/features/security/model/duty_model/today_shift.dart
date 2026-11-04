import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'today_shift.freezed.dart';
part 'today_shift.g.dart';

@freezed
class TodayShift with _$TodayShift {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory TodayShift({
    int? id,
    String? name,
    String? startTime,
    String? endTime,
    bool? isOvernight,
    int? onDutyCount,
  }) = _TodayShift;

  factory TodayShift.fromJson(Map<String, dynamic> json) =>
      _$TodayShiftFromJson(json);

  factory TodayShift.safeFromJson(Map<String, dynamic>? json) {
    return TodayShift(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      startTime: NullSafetyHelper.safeString(json?['start_time']),
      endTime: NullSafetyHelper.safeString(json?['end_time']),
      isOvernight:
          NullSafetyHelper.safeBool(json?['is_overnight']),
      onDutyCount:
          NullSafetyHelper.safeInt(json?['on_duty_count']),
    );
  }
}