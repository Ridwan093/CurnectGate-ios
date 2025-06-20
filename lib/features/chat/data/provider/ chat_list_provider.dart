// chat_list_provider.dart
import 'package:curnectgate/features/chat/data/chat_model/%20chat_user.dart';
import 'package:curnectgate/features/chat/data/chat_model/%20mock_chat_service.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_state.dart';

import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatListProvider = StateNotifierProvider<ChatListNotifier, List<Conversation>>((ref) {
  final chatState = ref.watch(chatProvider);
  return ChatListNotifier(chatState);
});

class ChatListNotifier extends StateNotifier<List<Conversation>> {
  final ChatState _chatState;
  
  ChatListNotifier(this._chatState) : super(MockChatService.getConversations(_chatState));

  void updateFromChatState(ChatState chatState) {
    state = MockChatService.getConversations(chatState);
  }

  Future<void> refresh() async {
    state = MockChatService.getConversations(_chatState);
  }

  List<Conversation> search(String query) {
    if (query.isEmpty) return MockChatService.getConversations(_chatState);
    
    final lowerQuery = query.toLowerCase();
    return MockChatService.getConversations(_chatState).where((conv) {
      final userMatch = conv.user.name.toLowerCase().contains(lowerQuery) ||
          conv.user.role.toLowerCase().contains(lowerQuery);
      
      final lastMessageMatch = conv.lastMessage?.text.toLowerCase().contains(lowerQuery) ?? false;
      
      return userMatch || lastMessageMatch;
    }).toList();
  }
}