import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_counts_response.freezed.dart';
part 'unread_counts_response.g.dart';

@freezed
class UnreadCountsResponse with _$UnreadCountsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UnreadCountsResponse({
    bool? success,
    String? message,
    UnreadCountsData? data,
  }) = _UnreadCountsResponse;

  factory UnreadCountsResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountsResponseFromJson(json);

  factory UnreadCountsResponse.fromSafeJson(Map<String, dynamic> json) {
    return UnreadCountsResponse(
      success: NullSafetyHelper.safeBool(json['success']),
      message: NullSafetyHelper.safeString(json['message']),
      data: NullSafetyHelper.safeModel<UnreadCountsData>(
        json['data'],
        (m) => UnreadCountsData.fromSafeJson(m),
        null,
      ),
    );
  }
}

@freezed
class UnreadCountsData with _$UnreadCountsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UnreadCountsData({
    int? totalUnreadMessages,
    int? unreadConversationsCount,
    int? badgeCount,
    UnreadByType? byType,
  }) = _UnreadCountsData;

  factory UnreadCountsData.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountsDataFromJson(json);

  factory UnreadCountsData.fromSafeJson(Map<String, dynamic> json) {
    return UnreadCountsData(
      totalUnreadMessages: NullSafetyHelper.safeInt(json['total_unread_messages']),
      unreadConversationsCount:
          NullSafetyHelper.safeInt(json['unread_conversations_count']),
      badgeCount: NullSafetyHelper.safeInt(json['badge_count']),
      byType: NullSafetyHelper.safeModel<UnreadByType>(
        json['by_type'],
        (m) => UnreadByType.fromSafeJson(m),
        null,
      ),
    );
  }
}

@freezed
class UnreadByType with _$UnreadByType {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UnreadByType({
    UnreadTypeItem? admin,
    UnreadTypeItem? committee,
    UnreadTypeItem? board,
    UnreadTypeItem? security,
  }) = _UnreadByType;

  factory UnreadByType.fromJson(Map<String, dynamic> json) =>
      _$UnreadByTypeFromJson(json);

  factory UnreadByType.fromSafeJson(Map<String, dynamic> json) {
    final map = NullSafetyHelper.safeMap(json);
    return UnreadByType(
      admin: NullSafetyHelper.safeModel<UnreadTypeItem>(
          map['admin'], (m) => UnreadTypeItem.fromSafeJson(m), null),
      committee: NullSafetyHelper.safeModel<UnreadTypeItem>(
          map['committee'], (m) => UnreadTypeItem.fromSafeJson(m), null),
      board: NullSafetyHelper.safeModel<UnreadTypeItem>(
          map['board'], (m) => UnreadTypeItem.fromSafeJson(m), null),
      security: NullSafetyHelper.safeModel<UnreadTypeItem>(
          map['security'], (m) => UnreadTypeItem.fromSafeJson(m), null),
    );
  }
}

@freezed
class UnreadTypeItem with _$UnreadTypeItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UnreadTypeItem({
    int? count,
    int? conversations,
  }) = _UnreadTypeItem;

  factory UnreadTypeItem.fromJson(Map<String, dynamic> json) =>
      _$UnreadTypeItemFromJson(json);

  factory UnreadTypeItem.fromSafeJson(Map<String, dynamic> json) {
    final map = NullSafetyHelper.safeMap(json);
    return UnreadTypeItem(
      count: NullSafetyHelper.safeInt(map['count']),
      conversations: NullSafetyHelper.safeInt(map['conversations']),
    );
  }
}
