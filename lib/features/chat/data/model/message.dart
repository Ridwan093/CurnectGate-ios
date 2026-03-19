// lib/models/message.dart
import 'package:hive_flutter/hive_flutter.dart';

part 'message.g.dart';

@HiveType(typeId: 0)
class Message extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int conversationId;

  @HiveField(2)
  final int senderId;

  @HiveField(3)
  final String messageText;

  @HiveField(4)
  final String status;

  @HiveField(5)
  final bool isRead;

  @HiveField(6)
  final bool isSender;

  @HiveField(7)
  final String createdAt;

  @HiveField(8)
  final List<String> attachments; // URLs or paths

  // Optional: store minimal sender info if needed
  @HiveField(9)
  final String? senderName;

  @HiveField(10)
  final String? senderAvatar;

  Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.messageText,
    required this.status,
    required this.isRead,
    required this.isSender,
    required this.createdAt,
    required this.attachments,
    this.senderName,
    this.senderAvatar,
  });

  // Factory from your API JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      conversationId: json['conversation_id'],
      senderId: json['sender_id'],
      messageText: json['message_text'] ?? '',
      status: json['status'] ?? 'sent',
      isRead: json['read'] ?? false,
      isSender: json['is_sender'] ?? false,
      createdAt: json['created_at'],
      attachments: List<String>.from(json['attachments'] ?? []),
      senderName: json['sender']?['full_name'],
      senderAvatar: json['sender']?['avatar_url'],
    );
  }

  // For debugging or sending back if needed
  Map<String, dynamic> toJson() => {
        'id': id,
        'conversation_id': conversationId,
        'sender_id': senderId,
        'message_text': messageText,
        'status': status,
        'read': isRead,
        'is_sender': isSender,
        'created_at': createdAt,
        'attachments': attachments,
      };
}