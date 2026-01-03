
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:hive/hive.dart';


class ChatLocalRepository {
  final Box<ChatMessage> _box;

  ChatLocalRepository(this._box);

  List<ChatMessage> getAll() {
    final messages = _box.values.toList();
    messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return messages;
  }

  Future<void> save(ChatMessage message) async {
    await _box.put(message.localId, message);
  }

  Future<void> markSynced({
    required String localId,
    required String serverId,
  }) async {
    final msg = _box.get(localId);
    if (msg == null) return;

    await _box.put(
      localId,
      msg.copyWith(isSynced: true, serverId: serverId),
    );
  }

  List<ChatMessage> getPending() {
    return _box.values.where((m) => !m.isSynced).toList();
  }
}
