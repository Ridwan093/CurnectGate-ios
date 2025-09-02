// rsvp_counts_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsvp_counts_model.freezed.dart';
part 'rsvp_counts_model.g.dart';

@freezed
class RsvpCounts with _$RsvpCounts {
   @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory RsvpCounts({
    @Default(0) int going,
    @Default(0) int notGoing,
    @Default(0) int maybe,
    @Default(0) int total,
  }) = _RsvpCounts;

  factory RsvpCounts.fromJson(Map<String, dynamic> json) => _$RsvpCountsFromJson(json);

  factory RsvpCounts.empty() => const RsvpCounts(
        going: 0,
        notGoing: 0,
        maybe: 0,
        total: 0,
      );
}