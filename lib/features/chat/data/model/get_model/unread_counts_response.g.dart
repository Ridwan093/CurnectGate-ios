// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_counts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnreadCountsResponseImpl _$$UnreadCountsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UnreadCountsResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UnreadCountsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UnreadCountsResponseImplToJson(
        _$UnreadCountsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

_$UnreadCountsDataImpl _$$UnreadCountsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UnreadCountsDataImpl(
      totalUnreadMessages: (json['total_unread_messages'] as num?)?.toInt(),
      unreadConversationsCount:
          (json['unread_conversations_count'] as num?)?.toInt(),
      badgeCount: (json['badge_count'] as num?)?.toInt(),
      byType: json['by_type'] == null
          ? null
          : UnreadByType.fromJson(json['by_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UnreadCountsDataImplToJson(
        _$UnreadCountsDataImpl instance) =>
    <String, dynamic>{
      'total_unread_messages': instance.totalUnreadMessages,
      'unread_conversations_count': instance.unreadConversationsCount,
      'badge_count': instance.badgeCount,
      'by_type': instance.byType?.toJson(),
    };

_$UnreadByTypeImpl _$$UnreadByTypeImplFromJson(Map<String, dynamic> json) =>
    _$UnreadByTypeImpl(
      admin: json['admin'] == null
          ? null
          : UnreadTypeItem.fromJson(json['admin'] as Map<String, dynamic>),
      committee: json['committee'] == null
          ? null
          : UnreadTypeItem.fromJson(json['committee'] as Map<String, dynamic>),
      board: json['board'] == null
          ? null
          : UnreadTypeItem.fromJson(json['board'] as Map<String, dynamic>),
      security: json['security'] == null
          ? null
          : UnreadTypeItem.fromJson(json['security'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UnreadByTypeImplToJson(_$UnreadByTypeImpl instance) =>
    <String, dynamic>{
      'admin': instance.admin?.toJson(),
      'committee': instance.committee?.toJson(),
      'board': instance.board?.toJson(),
      'security': instance.security?.toJson(),
    };

_$UnreadTypeItemImpl _$$UnreadTypeItemImplFromJson(Map<String, dynamic> json) =>
    _$UnreadTypeItemImpl(
      count: (json['count'] as num?)?.toInt(),
      conversations: (json['conversations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UnreadTypeItemImplToJson(
        _$UnreadTypeItemImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'conversations': instance.conversations,
    };
