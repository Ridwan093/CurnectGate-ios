// providers/chat_providers.dart

import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/%20chat_list_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;

// 2. Messages for one conversation
final messagesProvider = AsyncNotifierProvider.family
    .autoDispose<MessagesNotifier, List<Message>?, int>(MessagesNotifier.new);

class MessagesNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Message>?, int> {
  int get conversationId =>
      arg; // ← This is how you get the family argument (int)

  @override
  Future<List<Message>?> build(int conversationId) async {
    final localMessages = await _loadFromHive();

    try {
      final freshMessages = await ref
          .read(getApiServiceProvider)
          .getMessages(conversationId);

      if (localMessages?.length != freshMessages.length ||
          localMessages?.firstOrNull?.id != freshMessages.firstOrNull?.id) {
        await _saveToHive(freshMessages);
      }

      return freshMessages;
    } catch (e) {
      log("Messages API failed: $e");
      return localMessages;
    }
  }

  Future<void> refreshMessages() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final fresh = await ref
          .read(getApiServiceProvider)
          .getMessages(conversationId);
      await _saveToHive(fresh);
      return fresh;
    });
  }

  Future<List<Message>?> _loadFromHive() async {
    final box = Hive.box<Message>('chat_messages');
    return box.values.where((m) => m.conversationId == conversationId).toList();
  }

  Future<void> _updateConversationCache(Message msg, File? file) async {
    final convBox = Hive.box<Conversation>('conversations');

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
    final box = Hive.box<Message>('chat_messages');

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
    state = AsyncData([...?state.value, temp]);
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

        // Update local message with server data
        local.serverId = realMsg.id;
        local.syncStatus = 'sent';
        local.status = 'sent';
        local.createdAt = realMsg.createdAt;
        local.attachments = realMsg.attachments;

        await local.save();

        // Update UI
        final updated = [...?state.value];
        final index = updated.indexWhere((m) => m.localId == localId);
        if (index != -1) updated[index] = local;
        state = AsyncData(updated);

        await _updateConversationCache(local, file);
      }
    } catch (e) {
      // Fail case
      final local = box.values.firstWhere((e) => e.localId == localId);
      local.syncStatus = "failed";
      local.status = 'failed';
      local.isSending = false;
      local.isFailed = true;

      await local.save();

      final updated = [...?state.value];
      final index = updated.indexWhere((m) => m.localId == localId);
      if (index != -1) updated[index] = local;
      state = AsyncData(updated);
    }
  }

  Future<void> deleteMessage(Message message, BuildContext context) async {
    final box = Hive.box<Message>('chat_messages');

    /// Backup message for rollback
    final backupMessage = message;

    // Optimistic UI: optionally show a loading indicator, but don't remove yet
    final updated = [...?state.value];
    final index = updated.indexWhere((m) => m.localId == message.localId);

    try {
      // 1️⃣ Call API first
      if (message.serverId != null) {
        final success = await ref
            .read(profileRepositoryProvider)
            .deleteMessage(id: message.serverId!, context: context);

        if (success["status"] == true) {
          // 2️⃣ Remove locally if API deletion is successful
          if (message.hiveKey != null && box.containsKey(message.hiveKey)) {
            await box.delete(message.hiveKey);
          }

          if (index != -1) {
            updated.removeAt(index);
          }

          state = AsyncData(updated);
        } else {
          // API returned false → optional: show error to user
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to delete message")),
          );
        }
      }
    } catch (e) {
      // API call failed → optional: show error
      log(e.toString());

      // Rollback UI (if you removed it optimistically)
      if (index != -1 && !updated.contains(backupMessage)) {
        updated.insert(index, backupMessage);
        state = AsyncData(updated);
      }
    }
  }

  Future<void> _saveToHive(List<Message> messages) async {
    final box = Hive.box<Message>('chat_messages');

    // Only delete old messages by Hive key, not by message.id
    final oldMessages =
        box.values.where((m) => m.conversationId == conversationId).toList();

    for (var m in oldMessages) {
      if (m.hiveKey != null && box.containsKey(m.hiveKey)) {
        await box.delete(m.hiveKey);
      }
    }

    for (var msg in messages) {
      // Add to Hive and store hiveKey inside message
      final key = await box.add(msg);
      msg.hiveKey = key;
      await msg.save();
    }

    // Update UI state
    state = AsyncData(messages);
  }

  Future<void> retryPendingMessages(BuildContext context) async {
    final box = Hive.box<Message>('chat_messages');

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
    state = AsyncData(box.values.toList());
  }

  void addIncomingMessage(Map<String, dynamic> data) {
    final newMsg = Message.safeFromJson(data);
    Hive.box<Message>('chat_messages').put(newMsg.id, newMsg);
    state = AsyncData(
      [...?state.value, newMsg]
        ..sort((a, b) => (a.createdAt ?? "").compareTo(b.createdAt ?? "")),
    );
  }
}
