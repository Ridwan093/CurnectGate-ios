import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';

final chatMessagesProvider = StreamProvider.family<List<Messages>, String>((ref, chatId) {
  final firestore = FirebaseFirestore.instance;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  return firestore
      .collection('user')
      .doc(currentUserId)
      .collection('chat')
      .doc(chatId)
      .collection('message')
      .orderBy('timeSend', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Messages.fromMap(doc.data())).toList())
      .handleError((error) {
        debugPrint('Error fetching messages: $error');
        return <Messages>[];
      });
});
