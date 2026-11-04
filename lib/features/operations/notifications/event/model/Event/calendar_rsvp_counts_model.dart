// calendar_rsvp_counts_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_rsvp_counts_model.freezed.dart';
part 'calendar_rsvp_counts_model.g.dart';

@freezed
class CalendarRsvpCounts with _$CalendarRsvpCounts {
    @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory CalendarRsvpCounts({
    @Default(0) int going,
    @Default(0) int notGoing,
    @Default(0) int maybe,
    @Default(0) int total,
  }) = _CalendarRsvpCounts;

  factory CalendarRsvpCounts.fromJson(Map<String, dynamic> json) => _$CalendarRsvpCountsFromJson(json);

  factory CalendarRsvpCounts.empty() => const CalendarRsvpCounts(
        going: 0,
        notGoing: 0,
        maybe: 0,
        total: 0,
      );
}