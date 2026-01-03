import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_count_data.freezed.dart';
part 'violation_count_data.g.dart';

@freezed
class ViolationCountData with _$ViolationCountData {
   @JsonSerializable(explicitToJson: true)
  const factory ViolationCountData({
    int? total,
    Map<String, int>? byStatus,
    Map<String, int>? byPriority,
    int? open,
    int? closed,
    int? assignedToMe,
    int? unassigned,
    int? urgentOpen,
    int? highPriorityOpen,
    int? requiresAttention,
    Map<String, int>? recent,
    int? anonymous,
  }) = _ViolationCountData;

  factory ViolationCountData.fromJson(Map<String, dynamic> json) =>
      _$ViolationCountDataFromJson(json);

  factory ViolationCountData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ViolationCountData();

    return ViolationCountData(
      total: NullSafetyHelper.safeInt(json['total']),
      byStatus: NullSafetyHelper.safeMapInt(json['by_status']),
      byPriority: NullSafetyHelper.safeMapInt(json['by_priority']),
      open: NullSafetyHelper.safeInt(json['open']),
      closed: NullSafetyHelper.safeInt(json['closed']),
      assignedToMe: NullSafetyHelper.safeInt(json['assigned_to_me']),
      unassigned: NullSafetyHelper.safeInt(json['unassigned']),
      urgentOpen: NullSafetyHelper.safeInt(json['urgent_open']),
      highPriorityOpen: NullSafetyHelper.safeInt(json['high_priority_open']),
      requiresAttention: NullSafetyHelper.safeInt(json['requires_attention']),
      recent: NullSafetyHelper.safeMapInt(json['recent']),
      anonymous: NullSafetyHelper.safeInt(json['anonymous']),
    );
  }  
}
