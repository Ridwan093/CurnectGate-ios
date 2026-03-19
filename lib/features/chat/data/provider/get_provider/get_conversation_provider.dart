// providers/chat_providers.dart

// 1. Conversation List Provider (Message List Page)
import 'dart:developer';

import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Conversation List Provider (Message List Page)
final conversationListProvider = AsyncNotifierProvider.autoDispose<
  ConversationListNotifier,
  List<Conversation>?
>(
  ConversationListNotifier.new, // Use .new for cleaner syntax
);

class ConversationListNotifier
    extends AutoDisposeAsyncNotifier<List<Conversation>?> {
  @override
  Future<List<Conversation>?> build() async {
    // 1. Load from Hive first (instant display)
    final localConversations = await _loadFromHive();

    try {
      // 2. Fetch fresh list from API
      final freshConversations =
          await ref.read(getApiServiceProvider).getListConversation();

      // 3. Save to Hive if data changed (compare length + first ID as simple check)
      if (localConversations?.length != freshConversations.length ||
          localConversations?.firstOrNull?.id !=
              freshConversations.firstOrNull?.id) {
        await _saveToHive(freshConversations);
      }

      return freshConversations;
    } catch (e) {
      log("Conversation API failed: $e");
      // Fallback to local Hive data
      return localConversations;
    }
  }

  // Public refresh method (call from Reverb listener or pull-to-refresh)
  Future<void> refreshConversations() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final fresh = await ref.read(getApiServiceProvider).getListConversation();
      await _saveToHive(fresh);
      return fresh;
    });
  }

  void updateConversation(Conversation conv) async {
    final old = state.value ?? [];
    final index = old.indexWhere((c) => c.id == conv.id);

    final updated = [...old];
    if (index != -1) {
      updated[index] = conv;
    } else {
      updated.add(conv);
    }

    state = AsyncData(updated);

    // Also save to Hive
    var box = await getConversationsBox();

    box.put(conv.id, conv);
  }

  Future<List<Conversation>?> _loadFromHive() async {
    var box = await getConversationsBox();

    return box.values.toList();
  }

  Future<void> _saveToHive(List<Conversation> conversations) async {
    var box = await getConversationsBox();

    await box.clear();
    for (var conv in conversations) {
      await box.put(conv.id, conv);
    }
  }
}
