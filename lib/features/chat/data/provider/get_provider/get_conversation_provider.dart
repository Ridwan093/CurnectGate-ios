// providers/chat_providers.dart

// 1. Conversation List Provider (Message List Page)
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

// 1. Conversation List Provider (Message List Page)
final conversationListProvider =
    NotifierProvider.autoDispose<ConversationListNotifier, List<Conversation>>(
      ConversationListNotifier.new,
    );

class ConversationListNotifier extends AutoDisposeNotifier<List<Conversation>> {
  @override
  List<Conversation> build() {
    // Load from Hive synchronously using this user's scoped box
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Conversation>(conversationsBoxName(userId));
    final localConversations = box.values.toList();

    // Ensure local database load is properly sorted by time
    localConversations.sort((a, b) {
      final aTime = a.lastMessageAt ?? a.updatedAt ?? "";
      final bTime = b.lastMessageAt ?? b.updatedAt ?? "";
      return bTime.compareTo(aTime);
    });

    // 2. Fetch fresh list in background
    _fetchFresh();

    return localConversations;
  }

  Future<void> _fetchFresh() async {
    try {
      final freshConversations =
          await ref.read(getApiServiceProvider).getListConversation();

      if (state.length != freshConversations.length ||
          state.firstOrNull?.id != freshConversations.firstOrNull?.id) {
        await _saveToHive(freshConversations);
      }
    } catch (e) {
      log("Conversation API failed: $e");
    }
  }

  Future<void> refreshConversations() async {
    try {
      final fresh = await ref.read(getApiServiceProvider).getListConversation();
      await _saveToHive(fresh);
    } catch (e) {
      log("Refresh failed: $e");
    }
  }

  void updateConversation(Conversation conv) {
    final old = state;
    final index = old.indexWhere((c) => c.id == conv.id);

    final updated = [...old];
    if (index != -1) {
      updated[index] = conv;
    } else {
      updated.insert(0, conv); // new convos usually come first
    }

    // Sort to ensure the most recent conversation moves to the top
    updated.sort((a, b) {
      final aTime = a.lastMessageAt ?? a.updatedAt ?? "";
      final bTime = b.lastMessageAt ?? b.updatedAt ?? "";
      return bTime.compareTo(aTime);
    });

    state = updated;

    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Conversation>(conversationsBoxName(userId));
    box.put(conv.id, conv);
  }

  // Called natively from reverb_service.dart on global real-time event
  Future<void> updateLastMessage({
    required int conversationId,
    required Map<String, dynamic> message,
  }) async {
    log("Reverb: Triggering list refresh for conversation $conversationId");
    // Triggering a background refresh pulls the absolute latest data safely,
    // natively handling unread counts and message object parsers automatically!
    await refreshConversations();
  }

  // In get_conversation_provider.dart
  void markConversationAsReadLocally(int conversationId) {
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Conversation>(conversationsBoxName(userId));
    final conv = box.get(conversationId);

    if (conv != null && (conv.unreadCount ?? 0) > 0) {
      final updated = Conversation(
        id: conv.id,
        estateId: conv.estateId,
        type: conv.type,
        title: conv.title,
        participants: conv.participants,
        latestMessage: conv.latestMessage,
        lastMessageAt: conv.lastMessageAt,
        unreadCount: 0, // Reset the unread count locally
        settings: conv.settings,
        createdAt: conv.createdAt,
        updatedAt: DateTime.now().toIso8601String(),
      );

      updateConversation(updated); // Save to hive and update UI
    }
  }

  Future<void> _saveToHive(List<Conversation> conversations) async {
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Conversation>(conversationsBoxName(userId));

    await box.clear();
    for (var conv in conversations) {
      await box.put(conv.id, conv);
    }

    state = conversations;
  }
}
