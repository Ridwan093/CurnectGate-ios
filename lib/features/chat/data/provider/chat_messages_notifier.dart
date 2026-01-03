import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/provider/chat_local_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ChatMessagesNotifier extends StateNotifier<List<ChatMessage>> {
  final Ref ref;

  ChatMessagesNotifier(this.ref) : super([]) {
    _loadLocalMessages();
  }

  void _loadLocalMessages() {
    final localMessages = ref.read(chatLocalRepositoryProvider).getAll();
    state = localMessages;
  }

  void refresh() {
    _loadLocalMessages();
  }

  void addLocalMessage(ChatMessage message) {
    state = [...state, message];
  }
}
