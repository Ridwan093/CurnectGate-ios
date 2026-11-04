// notification_count_data_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_count_data_model.freezed.dart';
part 'notification_count_data_model.g.dart';

@freezed
class NotificationCountData with _$NotificationCountData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NotificationCountData({
    int? count,
    bool? unreadOnly,
    int? estateId,
  }) = _NotificationCountData;

  factory NotificationCountData.fromJson(Map<String, dynamic> json) =>
      _$NotificationCountDataFromJson(json);

  factory NotificationCountData.fromSafeJson(Map<String, dynamic> json) {
    return NotificationCountData(
      count: NullSafetyHelper.safeInt(json['count']),
      unreadOnly: NullSafetyHelper.safeBool(json['unread_only']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
    );
  }

  factory NotificationCountData.empty() => const NotificationCountData(
    count: null,
    unreadOnly: null,
    estateId: null,
  );
}