import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:hive/hive.dart';

class CheckPendingMessage {
  final FirebaseFirestore firestore;

  CheckPendingMessage({required this.firestore});

  Future<void> syncPendingMessages() async {
    final pendingBox = Hive.box<Messages>('pending_messages');
    
    for (var key in pendingBox.keys) {
      final message = pendingBox.get(key);
      if (message == null) continue;

      try {
        final targetId = message.isReceiverCopy ? message.senderID : message.reciverID;
        final currentId = message.isReceiverCopy ? message.reciverID : message.senderID;

        await firestore
            .collection('user')
            .doc(targetId)
            .collection('chat')
            .doc(currentId)
            .collection('message')
            .doc(message.messageId)
            .set(message.toMap());

        await pendingBox.delete(key);
      } catch (e) {
        log('Failed to sync ${message.messageId}: $e');
        await pendingBox.put(key, message.copyWith(isFailed: true));
      }
    }
  }
}