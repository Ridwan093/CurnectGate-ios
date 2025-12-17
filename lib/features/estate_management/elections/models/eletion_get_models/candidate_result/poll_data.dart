import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'poll_data.freezed.dart';
part 'poll_data.g.dart';

@freezed
class PollData with _$PollData {
  const factory PollData({
    int? id,
    String? title,
    String? description,
    String? type,
    String? status,
    String? opensAt,
    String? closesAt,
    bool? isAnonymous,
  }) = _PollData;

  factory PollData.fromJson(Map<String, dynamic> json) =>
      _$PollDataFromJson(json);

  factory PollData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const PollData();
    return PollData(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      description: NullSafetyHelper.safeString(json['description']),
      type: NullSafetyHelper.safeString(json['type']),
      status: NullSafetyHelper.safeString(json['status']),
      opensAt: NullSafetyHelper.safeString(json['opens_at']),
      closesAt: NullSafetyHelper.safeString(json['closes_at']),
      isAnonymous: NullSafetyHelper.safeBool(json['is_anonymous']),
    );
  }
}
