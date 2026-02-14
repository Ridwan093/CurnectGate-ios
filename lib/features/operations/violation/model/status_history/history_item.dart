import 'package:freezed_annotation/freezed_annotation.dart';
import 'changed_by.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'history_item.freezed.dart';
part 'history_item.g.dart';

@freezed
class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    int? id,
    String? status,
    ChangedBy? changedBy,
    String? notes,
    DateTime? changedAt,
    String? timeAgo,
  }) = _HistoryItem;

  factory HistoryItem.safeFromJson(Map<String, dynamic>? json) {
    return HistoryItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      status: NullSafetyHelper.safeString(json?['status']),
      changedBy: json?['changed_by'] == null
          ? null
          : ChangedBy.safeFromJson(json?['changed_by']),
      notes: NullSafetyHelper.safeString(json?['notes']),
      changedAt: NullSafetyHelper.safeDateTime(json?['changed_at']),
      timeAgo: NullSafetyHelper.safeString(json?['time_ago']),
    );
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemFromJson(json);
}
