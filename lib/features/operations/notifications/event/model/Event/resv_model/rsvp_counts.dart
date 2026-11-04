import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'rsvp_counts.freezed.dart';
part 'rsvp_counts.g.dart';

@freezed
class RsvpCounts with _$RsvpCounts {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RsvpCounts({
    int? going,
    int? notGoing,
    int? maybe,
    int? total,
  }) = _RsvpCounts;

  factory RsvpCounts.fromJson(Map<String, dynamic> json) =>
      _$RsvpCountsFromJson(json);

  factory RsvpCounts.fromSafeJson(Map<String, dynamic> json) {
    return RsvpCounts(
      going: NullSafetyHelper.safeInt(json['going']),
      notGoing: NullSafetyHelper.safeInt(json['not_going']),
      maybe: NullSafetyHelper.safeInt(json['maybe']),
      total: NullSafetyHelper.safeInt(json['total']),
    );
  }

  factory RsvpCounts.empty() => const RsvpCounts(
        going: null,
        notGoing: null,
        maybe: null,
        total: null,
      );
}
