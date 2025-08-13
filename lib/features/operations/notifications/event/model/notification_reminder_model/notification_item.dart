import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'estate.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

@freezed
class NotificationItem with _$NotificationItem {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory NotificationItem({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'estate_id') required int? estateId,
    @JsonKey(name: 'media_url') required String? mediaUrl,
    @JsonKey(name: 'media_key') required String? mediaKey,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'status') required String? status,
    @JsonKey(name: 'created_at') required String? createdAt,
    @JsonKey(name: 'updated_at') required String? updatedAt,
    @JsonKey(name: 'estate') required Estate? estate,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  factory NotificationItem.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return NotificationItem(
        id: null,
        userId: null,
        estateId: null,
        mediaUrl: null,
        mediaKey: null,
        type: null,
        description: null,
        status: null,
        createdAt: null,
        updatedAt: null,
        estate: null,
      );
    }
    return NotificationItem(
      id: NullSafetyHelper.safeInt(json['id']),
      userId: NullSafetyHelper.safeInt(json['user_id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      mediaUrl: json['media_url'] as String?,
      mediaKey: json['media_key'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      estate: Estate.safeFromJson(json['estate']),
    );
  }
}