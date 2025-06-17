
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MessageReply {
  final String message;
  final bool isMe;
  final MessageEnum messageEnum;

  MessageReply(this.message, this.isMe, this.messageEnum);
}

final messageReplyProvider = StateProvider<MessageReply?>((ref) => null);

