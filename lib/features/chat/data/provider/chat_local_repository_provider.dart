
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/local/chat_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';




final chatLocalRepositoryProvider = Provider<ChatLocalRepository>((ref) {
  final box = Hive.box<ChatMessage>('chat_messages');
  return ChatLocalRepository(box);
});
