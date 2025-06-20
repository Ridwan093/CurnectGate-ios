// chat_user.dart

import 'package:curnectgate/features/chat/data/chat_model/message_state.dart';

class ChatUser {
  final String id;
  final String name;
  final String role;
  final String avatarUrl;
  
  ChatUser({
    required this.id,
    required this.name,
    required this.role,
    required this.avatarUrl,
  });
}

// conversation.dart
class Conversation {
  final String id;
  final ChatUser user;
  final ChatMessage? lastMessage;
  final int unreadCount;
  
  Conversation({
    required this.id,
    required this.user,
    this.lastMessage,
    this.unreadCount = 0,
  });
  
  factory Conversation.fromChatState(String userId, ChatUser user, ChatState state) {
    final userMessages = state.messages.where((msg) => !msg.isMe).toList();
    return Conversation(
      id: userId,
      user: user,
      lastMessage: userMessages.isNotEmpty ? userMessages.last : null,
      unreadCount: userMessages.where((msg) => !msg.isMe).length,
    );
  }
}