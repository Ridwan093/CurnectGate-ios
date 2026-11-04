import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:hive/hive.dart';

part 'chat_message.g.dart';

@HiveType(typeId: 0)
class Message extends HiveObject {
  /// ================= SERVER FIELDS =================

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? conversationId;

  @HiveField(2)
  final int? senderId;

  @HiveField(3)
  String? messageText;

  @HiveField(4)
  String? status;

  @HiveField(5)
  bool? isRead;

  @HiveField(6)
  final bool? isSender;

  @HiveField(7)
  final String? timeAgo;

  @HiveField(8)
  List<Attachment>? attachments;

  @HiveField(9)
  final String? senderName;

  @HiveField(10)
  final String? senderAvatar;

  @HiveField(11)
  String? createdAt;

  @HiveField(12)
  String? updatedAt;

  /// ================= LOCAL UI STATE =================

  @HiveField(13)
  bool? isSending;

  @HiveField(14)
  bool? isFailed;

  /// ================= OFFLINE ENGINE =================

  @HiveField(15)
  String? localId;

  @HiveField(16)
  int? serverId;

  @HiveField(17)
  DateTime? createdLocalAt;

  @HiveField(18)
  String? syncStatus;
  @HiveField(19)
  int? hiveKey;

  Message({
    this.id,
    this.conversationId,
    this.senderId,
    this.messageText,
    this.status,
    this.isRead,
    this.isSender,
    this.timeAgo,
    this.attachments,
    this.senderName,
    this.senderAvatar,
    this.createdAt,
    this.updatedAt,
    this.isSending = false,
    this.isFailed = false,
    this.hiveKey = 0,
    this.localId,
    this.serverId,
    this.createdLocalAt,
    this.syncStatus,
  });

  /// ================= SAFE JSON =================

  factory Message.safeFromJson(Map<String, dynamic>? json) {
    return Message(
      id: NullSafetyHelper.safeInt(json?['id']),
      serverId: NullSafetyHelper.safeInt(json?['id']),
      conversationId: NullSafetyHelper.safeInt(json?['conversation_id']),
      senderId: NullSafetyHelper.safeInt(json?['sender_id']),
      messageText: NullSafetyHelper.safeString(json?['message_text']),
      status: NullSafetyHelper.safeString(json?['status']),
      isRead: NullSafetyHelper.safeBool(json?['read']),
      isSender: NullSafetyHelper.safeBool(json?['is_sender']),
      timeAgo: NullSafetyHelper.safeString(json?['time_ago']),
      attachments:
          (json?['attachments'] is List)
              ? (json?['attachments'] as List)
                  .map((e) => Attachment.safeFromJson(e))
                  .toList()
              : (json?['attachments'] != null || json?['attachment'] != null)
              ? [
                Attachment.safeFromJson(
                  json?['attachments'] ?? json?['attachment'],
                ),
              ]
              : const [],
      senderName: NullSafetyHelper.safeString(
        json?['sender']?['full_name'] ?? json?['sender_name'],
      ),
      senderAvatar: NullSafetyHelper.safeString(
        json?['sender']?['avatar_url'] ?? json?['sender_avatar'],
      ),
      createdAt: json?['created_at']?.toString() ?? "created_at",
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      isSending: false,
      isFailed: false,
      localId: null,
      createdLocalAt: null,
      hiveKey: 0,
      syncStatus: 'sent',
    );
  }

  /// ================= EMPTY =================

  factory Message.empty() {
    return Message(
      id: 0,
      serverId: 0,
      conversationId: 0,
      senderId: 0,
      messageText: '',
      status: '',
      isRead: false,
      isSender: false,
      timeAgo: '',
      attachments: const [],
      senderName: '',
      senderAvatar: '',
      createdAt: '',
      updatedAt: '',
      isSending: false,
      isFailed: false,
      localId: '',
      createdLocalAt: DateTime.now(),
      syncStatus: 'sent',
      hiveKey: 0,
    );
  }

  Message copyWith({
    int? id,
    int? conversationId,
    int? senderId,
    String? messageText,
    String? status,
    bool? isRead,
    bool? isSender,
    String? timeAgo,
    List<Attachment>? attachments,
    String? senderName,
    String? senderAvatar,
    String? createdAt,
    String? updatedAt,
    bool? isSending,
    bool? isFailed,
    String? localId,
    int? serverId,
    DateTime? createdLocalAt,
    String? syncStatus,
    int? hiveKey,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      messageText: messageText ?? this.messageText,
      status: status ?? this.status,
      isRead: isRead ?? this.isRead,
      isSender: isSender ?? this.isSender,
      timeAgo: timeAgo ?? this.timeAgo,
      attachments: attachments ?? this.attachments,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSending: isSending ?? this.isSending,
      isFailed: isFailed ?? this.isFailed,
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      createdLocalAt: createdLocalAt ?? this.createdLocalAt,
      syncStatus: syncStatus ?? this.syncStatus,
      hiveKey: hiveKey ?? this.hiveKey,
    );
  }
}
