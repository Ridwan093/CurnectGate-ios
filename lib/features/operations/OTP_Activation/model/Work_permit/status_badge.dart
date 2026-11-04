import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_badge.freezed.dart';
part 'status_badge.g.dart';

@freezed
class StatusBadge with _$StatusBadge {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory StatusBadge({
    String? text,
    String? color,
  }) = _StatusBadge;

  factory StatusBadge.fromJson(Map<String, dynamic> json) =>
      _$StatusBadgeFromJson(json);

  factory StatusBadge.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return StatusBadge.empty();
    return StatusBadge(
      text: NullSafetyHelper.safeString(json['text']),
      color: NullSafetyHelper.safeString(json['color']),
    );
  }

  factory StatusBadge.empty() => const StatusBadge(
        text: null,
        color: null,
      );
}
