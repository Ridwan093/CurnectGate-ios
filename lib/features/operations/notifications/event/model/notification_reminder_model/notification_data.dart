import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'notification_item.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

@freezed
class NotificationData with _$NotificationData {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory NotificationData({
    @JsonKey(name: 'notifications') required List<NotificationItem>? notifications,
    @JsonKey(name: 'count') required int? count,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  factory NotificationData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return NotificationData(
        notifications: null,
        count: null,
      );
    }
    return NotificationData(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationItem.safeFromJson(e))
          .toList(),
      count: NullSafetyHelper.safeInt(json['count']),
    );
  }
}