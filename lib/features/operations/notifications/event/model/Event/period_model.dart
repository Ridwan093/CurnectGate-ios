import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'period_model.freezed.dart';
part 'period_model.g.dart';

@freezed
class CalendarPeriod with _$CalendarPeriod {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory CalendarPeriod({
    String? startDate,
    String? endDate,
  }) = _CalendarPeriod;

  factory CalendarPeriod.fromJson(Map<String, dynamic> json) =>
      _$CalendarPeriodFromJson(json);

  factory CalendarPeriod.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return CalendarPeriod.empty();
    return CalendarPeriod(
      startDate: NullSafetyHelper.safeString(json['start_date']),
      endDate: NullSafetyHelper.safeString(json['end_date']),
    );
  }

  factory CalendarPeriod.empty() => const CalendarPeriod(
        startDate: null,
        endDate: null,
      );
}
