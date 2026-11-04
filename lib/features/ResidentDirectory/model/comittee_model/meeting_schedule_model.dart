// meeting_schedule_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'meeting_schedule_model.freezed.dart';
part 'meeting_schedule_model.g.dart';

@freezed
class MeetingSchedule with _$MeetingSchedule {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory MeetingSchedule({
    String? day,
    String? time,
    String? frequency,
  }) = _MeetingSchedule;

  factory MeetingSchedule.fromJson(Map<String, dynamic> json) =>
      _$MeetingScheduleFromJson(json);

  factory MeetingSchedule.fromSafeJson(Map<String, dynamic> json) {
    return MeetingSchedule(
      day: NullSafetyHelper.safeString(json['day']),
      time: NullSafetyHelper.safeString(json['time']),
      frequency: NullSafetyHelper.safeString(json['frequency']),
    );
  }

  factory MeetingSchedule.empty() => const MeetingSchedule(
        day: null,
        time: null,
        frequency: null,
      );
}