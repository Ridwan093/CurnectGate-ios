import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'poll.freezed.dart';
part 'poll.g.dart';

@freezed
class Poll with _$Poll {
  const factory Poll({
    int? id,
    String? title,
    String? type,
    String? status,
    String? opensAt,
    String? closesAt,
  }) = _Poll;

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  factory Poll.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Poll();
    return Poll(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      type: NullSafetyHelper.safeString(json['type']),
      status: NullSafetyHelper.safeString(json['status']),
      opensAt: NullSafetyHelper.safeString(json['opens_at']),
      closesAt: NullSafetyHelper.safeString(json['closes_at']),
    );
  }
}
