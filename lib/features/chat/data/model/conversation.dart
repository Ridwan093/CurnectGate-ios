import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'conversation.g.dart';

@HiveType(typeId: 2)
class Conversation extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? estateId;

  @HiveField(2)
  final String? type;

  @HiveField(3)
  final String? title;

  @HiveField(4)
  final List<Participant>? participants;

  @HiveField(5)
  final LatestMessage? latestMessage;

  @HiveField(6)
  final String? lastMessageAt;

  @HiveField(7)
  final int? unreadCount;

  @HiveField(8)
  final ConversationSettings? settings;

  @HiveField(9)
  final String? createdAt;

  @HiveField(10)
  final String? updatedAt;

  Conversation({
    this.id,
    this.estateId,
    this.type,
    this.title,
    this.participants,
    this.latestMessage,
    this.lastMessageAt,
    this.unreadCount,
    this.settings,
    this.createdAt,
    this.updatedAt,
  });

  factory Conversation.safeFromJson(Map<String, dynamic>? json) {
    return Conversation(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      type: NullSafetyHelper.safeString(json?['type']),
      title: NullSafetyHelper.safeString(json?['title']),
      participants:
          NullSafetyHelper.safeMapList(
            json?['participants'],
          ).map((p) => Participant.safeFromJson(p)).toList(),
      latestMessage:
          json?['latest_message'] != null
              ? LatestMessage.safeFromJson(
                NullSafetyHelper.safeMap(json?['latest_message']),
              )
              : null,
      lastMessageAt: NullSafetyHelper.safeString(json?['last_message_at']),
      unreadCount: NullSafetyHelper.safeInt(json?['unread_count']),
      settings:
          json?['settings'] != null
              ? ConversationSettings.safeFromJson(
                NullSafetyHelper.safeMap(json?['settings']),
              )
              : null,
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}

@HiveType(typeId: 3)
class Participant extends HiveObject {
  @HiveField(0)
  final int? userId;

  @HiveField(1)
  final String? fullName;

  @HiveField(2)
  final String? avatarUrl;

  @HiveField(3)
  final String? role;

  @HiveField(4)
  final String? onlineStatus;

  @HiveField(5)
  final int? unreadCount;

  @HiveField(6)
  final String? lastReadAt;

  Participant({
    this.userId,
    this.fullName,
    this.avatarUrl,
    this.role,
    this.onlineStatus,
    this.unreadCount,
    this.lastReadAt,
  });

  factory Participant.safeFromJson(Map<String, dynamic>? json) {
    return Participant(
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      avatarUrl: NullSafetyHelper.safeString(json?['avatar_url']),
      role: NullSafetyHelper.safeString(json?['role']),
      onlineStatus: NullSafetyHelper.safeString(json?['online_status']),
      unreadCount: NullSafetyHelper.safeInt(json?['unread_count']),
      lastReadAt: NullSafetyHelper.safeString(json?['last_read_at']),
    );
  }
}

@HiveType(typeId: 4)
class LatestMessage extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? conversationId;

  @HiveField(2)
  final int? senderId;

  @HiveField(3)
  final Sender? sender;

  @HiveField(4)
  final String? messageText;

  @HiveField(5)
  final String? status;

  @HiveField(6)
  final bool? read;

  @HiveField(7)
  final bool? isSender;

  @HiveField(8)
  final String? createdAt;

  @HiveField(9)
  final String? updatedAt;

  @HiveField(10)
  final String? timeAgo;
  @HiveField(11)
  final List<Attachment>? attachments;

  LatestMessage({
    this.id,
    this.conversationId,
    this.senderId,
    this.sender,
    this.messageText,
    this.status,
    this.read,
    this.isSender,
    this.createdAt,
    this.updatedAt,
    this.timeAgo,
    this.attachments,
  });

  factory LatestMessage.safeFromJson(Map<String, dynamic>? json) {
    return LatestMessage(
      id: NullSafetyHelper.safeInt(json?['id']),
      conversationId: NullSafetyHelper.safeInt(json?['conversation_id']),
      senderId: NullSafetyHelper.safeInt(json?['sender_id']),
      sender:
          json?['sender'] != null
              ? Sender.safeFromJson(NullSafetyHelper.safeMap(json?['sender']))
              : null,
      messageText: NullSafetyHelper.safeString(json?['message_text']),
      status: NullSafetyHelper.safeString(json?['status']),
      read: NullSafetyHelper.safeBool(json?['read']),
      isSender: NullSafetyHelper.safeBool(json?['is_sender']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      timeAgo: NullSafetyHelper.safeString(json?['time_ago']),
      attachments:
          (json?['attachments'] as List?)
              ?.map((e) => Attachment.safeFromJson(e))
              .toList(),
    );
  }
}

@HiveType(typeId: 5)
class Sender extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? firstname;

  @HiveField(2)
  final String? lastname;

  @HiveField(3)
  final String? fullName;

  @HiveField(4)
  final String? avatarUrl;

  @HiveField(5)
  final String? role;

  Sender({
    this.id,
    this.firstname,
    this.lastname,
    this.fullName,
    this.avatarUrl,
    this.role,
  });

  factory Sender.safeFromJson(Map<String, dynamic>? json) {
    return Sender(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      avatarUrl: NullSafetyHelper.safeString(json?['avatar_url']),
      role: NullSafetyHelper.safeString(json?['role']),
    );
  }
}

@HiveType(typeId: 6)
class ConversationSettings extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? conversationId;

  @HiveField(2)
  final bool? notificationsEnabled;

  @HiveField(3)
  final bool? doNotDisturb;

  @HiveField(4)
  final String? dndUntil;

  @HiveField(5)
  final bool? dndActive;

  @HiveField(6)
  final bool? archived;

  @HiveField(7)
  final bool? pinned;

  @HiveField(8)
  final String? createdAt;

  @HiveField(9)
  final String? updatedAt;

  ConversationSettings({
    this.id,
    this.conversationId,
    this.notificationsEnabled,
    this.doNotDisturb,
    this.dndUntil,
    this.dndActive,
    this.archived,
    this.pinned,
    this.createdAt,
    this.updatedAt,
  });

  factory ConversationSettings.safeFromJson(Map<String, dynamic>? json) {
    return ConversationSettings(
      id: NullSafetyHelper.safeInt(json?['id']),
      conversationId: NullSafetyHelper.safeInt(json?['conversation_id']),
      notificationsEnabled: NullSafetyHelper.safeBool(
        json?['notifications_enabled'],
      ),
      doNotDisturb: NullSafetyHelper.safeBool(json?['do_not_disturb']),
      dndUntil: NullSafetyHelper.safeString(json?['dnd_until']),
      dndActive: NullSafetyHelper.safeBool(json?['dnd_active']),
      archived: NullSafetyHelper.safeBool(json?['archived']),
      pinned: NullSafetyHelper.safeBool(json?['pinned']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}
