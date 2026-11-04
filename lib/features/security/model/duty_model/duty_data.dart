import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'my_duty.dart';
import 'today_shift.dart';

part 'duty_data.freezed.dart';
part 'duty_data.g.dart';

@freezed
class DutyData with _$DutyData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DutyData({
    String? date,
    String? day,
    MyDuty? myDuty,
    List<dynamic>? onDutyPersonnel,
    List<TodayShift>? todayShifts,
    int? totalOnDuty,
  }) = _DutyData;

  factory DutyData.fromJson(Map<String, dynamic> json) =>
      _$DutyDataFromJson(json);

  factory DutyData.safeFromJson(Map<String, dynamic>? json) {
    return DutyData(
      date: NullSafetyHelper.safeString(json?['date']),
      day: NullSafetyHelper.safeString(json?['day']),
      myDuty: MyDuty.safeFromJson(json?['my_duty']),
      onDutyPersonnel:
          NullSafetyHelper.safeList(json?['on_duty_personnel']),
      todayShifts: (json?['today_shifts'] as List?)
              ?.map((e) => TodayShift.safeFromJson(e))
              .toList() ??
          [],
      totalOnDuty: NullSafetyHelper.safeInt(json?['total_on_duty']),
    );
  }
}