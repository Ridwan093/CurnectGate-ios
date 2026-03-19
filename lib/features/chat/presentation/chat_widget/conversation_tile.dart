
import 'package:curnectgate/features/chat/data/chat_model/%20chat_user.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/customise_conversation_tile.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback onTap;

  const ConversationTile({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomiseConversationTile(onTap: onTap, conversation: conversation),

        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
