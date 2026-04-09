// providers/chat_providers.dart

import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;

// 2. Messages for one conversation
final messagesProvider = NotifierProvider.family
    .autoDispose<MessagesNotifier, List<Message>, int>(MessagesNotifier.new);

class MessagesNotifier extends AutoDisposeFamilyNotifier<List<Message>, int> {
  int get conversationId =>
      arg; // ← This is how you get the family argument (int)

  @override
  List<Message> build(int conversationId) {
    // Load synchronously from Hive using the current user's scoped box
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Message>(chatMessagesBoxName(userId));
    final localMessages =
        box.values.where((m) => m.conversationId == conversationId).toList();

    // Fetch fresh messages in the background
    _fetchFreshMessages();

    return localMessages;
  }

  Future<void> _fetchFreshMessages() async {
    try {
      final freshMessages = await ref
          .read(getApiServiceProvider)
          .getMessages(conversationId);

      if (state.length != freshMessages.length ||
          state.firstOrNull?.id != freshMessages.firstOrNull?.id) {
        await _saveToHive(freshMessages);
      }
    } catch (e) {
      log("Messages API failed: $e");
    }
  }

  Future<void> refreshMessages() async {
    try {
      final fresh = await ref
          .read(getApiServiceProvider)
          .getMessages(conversationId);
      await _saveToHive(fresh);
    } catch (e) {
      log("Refresh failed: $e");
    }
  }

  Future<void> _updateConversationCache(Message msg, File? file) async {
    final userId = ref.read(currentUserIdProvider);
    final convBox = Hive.box<Conversation>(conversationsBoxName(userId));

    final conv = convBox.get(msg.conversationId);

    if (conv == null) return;

    final attachments = <Attachment>[];
    final now = DateTime.now();

    if (file != null) {
      final size = await file.length();
      final ext = path.extension(file.path).replaceFirst('.', '').toLowerCase();

      final isImage = ['jpg', 'jpeg', 'png', 'webp', 'gif'].contains(ext);
      final isDocument = ['pdf', 'doc', 'docx', 'txt'].contains(ext);
      final isVideo = ['mp4', 'mov', 'avi', 'mkv'].contains(ext);

      log("Path: ${file.path}");
      log("Ext: $ext");
      log("isImage: $isImage");

      attachments.add(
        Attachment(
          id: now.millisecondsSinceEpoch,
          fileName: path.basename(file.path),
          fileUrl: null,
          localPath: file.path,
          fileType: ext,
          mimeType: '',
          fileSize: size,
          fileSizeReadable: '${(size / 1024).toStringAsFixed(1)} KB',
          isImage: isImage,
          isDocument: isDocument,
          isVideo: isVideo,
        ),
      );
    }

    final sender = Sender(
      id: msg.senderId ?? 0,
      firstname: msg.senderName ?? '',
      lastname: '',
      fullName: msg.senderName ?? '',
      avatarUrl: msg.senderAvatar,
      role: '',
    );

    final latest = LatestMessage(
      id: msg.id ?? 0,
      conversationId: msg.conversationId ?? 0,
      senderId: msg.senderId ?? 0,
      sender: sender,
      messageText: msg.messageText ?? "",
      status: msg.status ?? "",
      read: msg.isRead ?? false,
      isSender: msg.isSender ?? false,
      createdAt: msg.createdAt ?? "",
      updatedAt: msg.createdAt ?? "",
      timeAgo: msg.createdAt ?? "",
      attachments: attachments,
    );

    final updated = Conversation(
      id: conv.id,
      estateId: conv.estateId,
      type: conv.type,
      title: conv.title,
      participants: conv.participants,
      latestMessage: latest,
      lastMessageAt: msg.createdAt ?? "",
      unreadCount: conv.unreadCount,
      settings: conv.settings,
      createdAt: conv.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
    );

    await convBox.put(conv.id, updated);

    ref.read(conversationListProvider.notifier).updateConversation(updated);
  }

  Future<void> sendMessage({
    required String text,
    File? file,
    required BuildContext context,
  }) async {
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Message>(chatMessagesBoxName(userId));

    final localId = DateTime.now().millisecondsSinceEpoch.toString();
    final now = DateTime.now();

    // ---------- LOCAL ATTACHMENT ----------
    final attachments = <Attachment>[];

    if (file != null) {
      final size = await file.length();
      final ext = file.path.split('.').last.toLowerCase();

      attachments.add(
        Attachment(
          id: now.millisecondsSinceEpoch,
          fileName: file.path.split('/').last,
          fileUrl: null, // Will be set after upload
          localPath: file.path,
          fileType: ext,
          mimeType: '',
          fileSize: size,
          fileSizeReadable: '${(size / 1024).toStringAsFixed(1)} KB',
          isImage: ['jpg', 'jpeg', 'png', 'webp'].contains(ext),
          isDocument: ['pdf', 'doc', 'docx'].contains(ext),
          isVideo: false,
        ),
      );
    }

    // ---------- TEMP MESSAGE ----------
    final temp = Message(
      id: now.millisecondsSinceEpoch,
      conversationId: conversationId,
      senderId: 2, // your user ID
      messageText: text,
      status: 'sending',
      isRead: false,
      isSender: true,
      createdAt: now.toIso8601String(),
      attachments: attachments,
      localId: localId,
      serverId: null,
      syncStatus: "sending",
      createdLocalAt: now,
      isSending: true,
      isFailed: false,
    );

    // Add to Hive and store hiveKey
    final hiveKey = await box.add(temp);
    temp.hiveKey = hiveKey;
    await temp.save();

    // Optimistic UI update
    state = [...state, temp];
    await _updateConversationCache(temp, file);

    // ---------- TRY SEND ----------
    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .sendMessage(
            message: text,
            context: context,
            file: file,
            id: conversationId,
          );

      if (response['success'] == true) {
        final realJson = response['data']['message'];
        final realMsg = Message.safeFromJson(realJson);

        // Match using localId
        final local = box.values.firstWhere((e) => e.localId == localId);

        // Preserve local paths for attachments
        if ((local.attachments ?? []).isNotEmpty &&
            (realMsg.attachments ?? []).isNotEmpty) {
          for (int i = 0; i < (local.attachments ?? []).length; i++) {
            realMsg.attachments![i].localPath = local.attachments![i].localPath;
          }
        }

        // Update local message with server data using copyWith to update final 'id'
        final finalMsg = local.copyWith(
          id: realMsg.id,
          serverId: realMsg.id,
          syncStatus: 'sent',
          status: 'sent',
          createdAt: realMsg.createdAt,
          attachments: realMsg.attachments,
        );

        // Replace the Hive entry at the same key
        if (local.hiveKey != null) {
          await box.put(local.hiveKey, finalMsg);
        }

        // Update UI
        final updated = [...state];
        final index = updated.indexWhere((m) => m.localId == localId);
        if (index != -1) updated[index] = finalMsg;
        state = updated;

        await _updateConversationCache(finalMsg, file);
      }
    } catch (e) {
      // Fail case
      final local = box.values.firstWhere((e) => e.localId == localId);
      local.syncStatus = "failed";
      local.status = 'failed';
      local.isSending = false;
      local.isFailed = true;

      await local.save();

      final updated = [...state];
      final index = updated.indexWhere((m) => m.localId == localId);
      if (index != -1) updated[index] = local;
      state = updated;
    }
  }

  Future<void> deleteMessage(Message message, BuildContext context) async {
    /// Backup message for rollback
    final backupMessage = message;

    // Safely find the message in the UI list using either the server ID or the local ID
    final updated = [...state];
    final index = updated.indexWhere(
      (m) =>
          (m.id != null && m.id == message.id) ||
          (m.localId != null && m.localId == message.localId),
    );

    try {
      // 1️Call API first
      final targetId = message.serverId ?? message.id;
      if (targetId != null) {
        final success = await ref
            .read(profileRepositoryProvider)
            .deleteMessage(id: targetId, context: context);

        if (success["status"] == true ||
            success["status"] == "success" ||
            success["success"] == true ||
            success["message"] != null) {
          // 2 Remove locally safely using HiveObject delete
          try {
            await message.delete();
          } catch (e) {
            log("Local delete error: $e");
          }

          if (index != -1) {
            updated.removeAt(index);
          }

          state = updated;

          // Tell conversation list to refresh to recalculate latest message
          try {
            ref.read(conversationListProvider.notifier).refreshConversations();
          } catch (e) {
            log("Conversation refresh error: $e");
          }
        }
      }
    } catch (e) {
      // API call failed → optional: show error
      log(e.toString());

      // Rollback UI (if you removed it optimistically)
      if (index != -1 && !updated.contains(backupMessage)) {
        updated.insert(index, backupMessage);
        state = updated;
      }
    }
  }

  // In get_list_message.dart
  // In get_list_message.dart
  void markMessagesAsReadLocally() {
    final currentMessages = [...state];
    bool hasChanges = false;

    for (var i = 0; i < currentMessages.length; i++) {
      final m = currentMessages[i];
      // ONLY act on RECEIVED messages (we never "read" our own sent messages)
      if (m.isRead != true && m.isSender != true) {
        m.isRead = true;
        m.save(); // HiveObject.save() is fine to fire-and-forget here
        hasChanges = true;
      }
    }

    if (hasChanges) {
      state = currentMessages; // Updates the UI
    }
  }

  void markSentMessagesAsReadLocally() {
    final currentMessages = [...state];
    bool hasChanges = false;

    for (var i = 0; i < currentMessages.length; i++) {
      final m = currentMessages[i];
      // Mark our SENT messages as read when the other person reads them
      if (m.isRead != true && m.isSender == true) {
        m.isRead = true;
        m.save();
        hasChanges = true;
      }
    }

    if (hasChanges) {
      state = currentMessages;
    }
  }
  Future<void> _saveToHive(List<Message> freshMessages) async {
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Message>(chatMessagesBoxName(userId));

    // Create maps for faster lookup
    final idMap = {
      for (var m in box.values)
        if (m.id != null) m.id!: m,
    };
    final serverIdMap = {
      for (var m in box.values)
        if (m.serverId != null) m.serverId!: m,
    };

    for (var msg in freshMessages) {
      if (msg.id == null) continue;

      //  Find existing by server ID OR by matching the server version
      final existing = idMap[msg.id] ?? serverIdMap[msg.id];

      if (existing != null) {
        // UPDATE existing
        // If the ID in Hive was a temporary one (timestamp), replace it
        if (existing.id != msg.id) {
          log(
            "Replacing temporary ID ${existing.id} with server ID ${msg.id}",
          );
          final updated = existing.copyWith(
            id: msg.id,
            serverId: msg.id,
            messageText: msg.messageText,
            status: msg.status,
            isRead: msg.isRead,
            attachments: msg.attachments,
            createdAt: msg.createdAt,
            updatedAt: msg.updatedAt,
            syncStatus: 'sent',
          );
          if (existing.hiveKey != null) {
            await box.put(existing.hiveKey, updated);
          }
        } else {
          // ID matches, just update fields
          existing.messageText = msg.messageText;
          existing.status = msg.status;
          existing.isRead = msg.isRead;
          existing.attachments = msg.attachments;
          existing.createdAt = msg.createdAt;
          existing.updatedAt = msg.updatedAt;
          existing.syncStatus = 'sent';
          await existing.save();
        }
      } else {
        // ➕ ADD new (it's truly new)
        final key = await box.add(msg);
        msg.hiveKey = key;
        await msg.save();
      }
    }

    // Sync state from Hive (clean)
    state =
        box.values.where((m) => m.conversationId == conversationId).toList()
          ..sort((a, b) => (a.createdAt ?? "").compareTo(b.createdAt ?? ""));
  }

  Future<void> retryPendingMessages(BuildContext context) async {
    final userId = ref.read(currentUserIdProvider);
    final box = Hive.box<Message>(chatMessagesBoxName(userId));

    final pending = box.values.where((m) => m.syncStatus != "sent").toList();

    for (final msg in pending) {
      try {
        final response = await ref
            .read(profileRepositoryProvider)
            .sendMessage(
              message: msg.messageText ?? '',
              context: context,
              file:
                  msg.attachments?.isNotEmpty == true
                      ? File(msg.attachments!.first.fileUrl!)
                      : null,
              id: msg.conversationId!,
            );

        if (response['success'] == true) {
          final real = Message.safeFromJson(response['data']['message']);

          msg.serverId = real.id;
          msg.syncStatus = "sent";
          msg.status = 'sent';
          msg.createdAt = real.createdAt;
          msg.attachments = real.attachments;

          await msg.save();
        }
      } catch (_) {
        msg.syncStatus = "failed";
        await msg.save();
      }
    }

    /// refresh UI
    state =
        box.values.where((m) => m.conversationId == conversationId).toList();
  }
  Future<void> addIncomingMessage(Map<String, dynamic> data) async {
    try {
      final newMsg = Message.safeFromJson(data);
      final userId = ref.read(currentUserIdProvider);
      final box = Hive.box<Message>(chatMessagesBoxName(userId));

      final isMe = newMsg.senderId.toString() == userId.toString();

      // 1. Check if message already exists in STATE
      int stateIndex = state.indexWhere(
        (m) => m.id == newMsg.id || m.serverId == newMsg.id,
      );

      //  2. If not found and it's ME, try matching pending message
      if (stateIndex == -1 && isMe) {
        stateIndex = state.indexWhere((m) {
          final mTime = DateTime.tryParse(m.createdAt ?? '');
          final nTime = DateTime.tryParse(newMsg.createdAt ?? '');

          return m.isSender == true &&
              (m.serverId == null || m.serverId == 0) &&
              m.messageText == newMsg.messageText &&
              mTime != null &&
              nTime != null &&
              mTime.difference(nTime).inSeconds.abs() < 5;
        });
      }

      //  3. UPDATE EXISTING MESSAGE (CRITICAL FIX)
      if (stateIndex != -1) {
        log(" Updating existing message (NO DUPLICATE)");

        final existing = state[stateIndex];

        // Preserve local attachment paths
        if ((existing.attachments ?? []).isNotEmpty &&
            (newMsg.attachments ?? []).isNotEmpty) {
          for (
            int i = 0;
            i < existing.attachments!.length && i < newMsg.attachments!.length;
            i++
          ) {
            newMsg.attachments![i].localPath =
                existing.attachments![i].localPath;
          }
        }

        final updatedMsg = existing.copyWith(
          id: newMsg.id,
          serverId: newMsg.id,
          status: newMsg.status ?? 'sent',
          createdAt: newMsg.createdAt,
          attachments: newMsg.attachments,
          syncStatus: 'sent',
          isRead: newMsg.isRead
        );

        //  UPDATE IN HIVE (NOT ADD, NOT DELETE)
        if (existing.hiveKey != null) {
          await box.put(existing.hiveKey, updatedMsg);
        } else {
          // fallback safety (rare)
          final key = await box.add(updatedMsg);
          updatedMsg.hiveKey = key;
          await updatedMsg.save();
        }

        // Update UI
        final updated = [...state];
        updated[stateIndex] = updatedMsg;
        state = updated;

        return;
      }

      //  4. ADD NEW MESSAGE (only if truly new)
      log(" Adding NEW incoming message");

      final newMessage = Message(
        id: newMsg.id,
        conversationId: newMsg.conversationId,
        senderId: newMsg.senderId,
        messageText: newMsg.messageText,
        status: 'sent',
        isRead: newMsg.isRead,
        isSender: isMe,
        timeAgo: newMsg.timeAgo,
        attachments: newMsg.attachments,
        senderName: newMsg.senderName,
        senderAvatar: newMsg.senderAvatar,
        createdAt: newMsg.createdAt,
        updatedAt: newMsg.updatedAt,
        syncStatus: 'sent',
      );

      //  IMPORTANT: NEVER use put(id) here
      final key = await box.add(newMessage);
      newMessage.hiveKey = key;
      await newMessage.save();

      final updatedState = [...state, newMessage];
      updatedState.sort(
        (a, b) => (a.createdAt ?? "").compareTo(b.createdAt ?? ""),
      );

      state = updatedState;
    } catch (e, stack) {
      log(" addIncomingMessage ERROR: $e");
      log(stack.toString());
    }
  }
}
