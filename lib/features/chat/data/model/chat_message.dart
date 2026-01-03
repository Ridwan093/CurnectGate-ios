import 'package:hive/hive.dart';

part 'chat_message.g.dart';

@HiveType(typeId: 20)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final String localId;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String senderId;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final bool isSynced;

  @HiveField(5)
  final String? serverId;

  ChatMessage({
    required this.localId,
    required this.content,
    required this.senderId,
    required this.createdAt,
    required this.isSynced,
    this.serverId,
  });

  ChatMessage copyWith({
    bool? isSynced,
    String? serverId,
  }) {
    return ChatMessage(
      localId: localId,
      content: content,
      senderId: senderId,
      createdAt: createdAt,
      isSynced: isSynced ?? this.isSynced,
      serverId: serverId ?? this.serverId,
    );
  }
}
