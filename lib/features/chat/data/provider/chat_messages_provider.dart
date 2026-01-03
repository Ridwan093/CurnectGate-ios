import 'package:curnectgate/features/chat/data/provider/chat_messages_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chat_message.dart';


final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<ChatMessage>>(
  (ref) => ChatMessagesNotifier(ref),
);
