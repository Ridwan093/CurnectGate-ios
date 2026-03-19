import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. The main async provider (Hive + API + Reverb) — already built earlier
final conversationListProvider = AsyncNotifierProvider.autoDispose<
  ConversationListNotifier,
  List<Conversation>?
>(ConversationListNotifier.new);

// 2. Search wrapper provider — keeps your existing search logic
// This is what your ChatListScreen watches (coversationSearchProvider)
final coversationSearchProvider =
    StateNotifierProvider<ChatSearchNotifier, List<Conversation>>((ref) {
      // Watch the real async provider
      final asyncConversations = ref.watch(conversationListProvider);

      // Start with current data (or empty if loading/error)
      final initialList = asyncConversations.value ?? [];

      final notifier = ChatSearchNotifier(initialList);

      // Listen to real-time changes from conversationListProvider
      ref.listen(conversationListProvider, (previous, next) {
        final updatedList = next.value ?? [];
        notifier.updateFromRealList(updatedList);
      });

      return notifier;
    });

class ChatSearchNotifier extends StateNotifier<List<Conversation>> {
  ChatSearchNotifier(super.state);

  void updateFromRealList(List<Conversation> newList) {
    state = newList;
  }

  Future<void> refresh(WidgetRef ref) async {
    // Trigger full refresh from the real provider
    await ref.read(conversationListProvider.notifier).refreshConversations();
    // State will auto-update via the ref.listen above
  }

  List<Conversation> search(String query) {
    if (query.isEmpty) return state;

    final lowerQuery = query.toLowerCase();

    return state.where((conv) {
      // Search in title
      final titleMatch = (conv.title ?? "").toLowerCase().contains(lowerQuery);

      // Search in participants' names
      final participantMatch = conv.participants!.any(
        (p) => (p.fullName ?? "").toLowerCase().contains(lowerQuery),
      );

      // Search in latest message text
      final lastMessageMatch =
          (conv.latestMessage?.messageText ?? "").toLowerCase().contains(
            lowerQuery,
          ) ??
          false;

      return titleMatch || participantMatch || lastMessageMatch;
    }).toList();
  }
}
