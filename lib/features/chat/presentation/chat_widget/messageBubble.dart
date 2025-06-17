import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MessageBubble extends ConsumerWidget {
  final Messages message;
  final bool isCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Status indicators
    final (icon, color, statusText) = _getMessageStatus(message);

    return isCurrentUser
        ? _buildsenderMessageCard(
          context: context,
          icon: icon,
          color: color,
          statusText: statusText,
        )
        : _buildrecivermessageCard(
          context: context,
          icon: icon,
          color: color,
          statusText: statusText,
        );
  }

  Widget _buildsenderMessageCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String statusText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.7),

            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: Radius.zero,
              bottomRight: const Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              
              children: [
                // Message content
                if (message.repliedMessage.isNotEmpty) ...[
                  _buildReplyPreview(context),
                  const SizedBox(height: 8),
                ],
                _buildMessageContent(),

                // Timestamp and status
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(message.timeSend),
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white70 : Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                    if (isCurrentUser) ...[
                      const SizedBox(width: 8),
                      Icon(icon, size: 14, color: color),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildrecivermessageCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String statusText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: const Radius.circular(12),

              bottomRight: Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
            
              children: [
                // Message content
                if (message.repliedMessage.isNotEmpty) ...[
                  _buildReplyPreview(context),
                  const SizedBox(height: 8),
                ],
                _buildMessageContent(),

                // Timestamp and status
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(message.timeSend),
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white70 : Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                    if (isCurrentUser) ...[
                      const SizedBox(width: 8),
                      Icon(icon, size: 14, color: color),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageContent() {
    return switch (message.type) {
      MessageEnum.text => Text(message.text),
      MessageEnum.image => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          message.text,
          width: 200,
          loadingBuilder: (_, child, progress) {
            return progress == null
                ? child
                : Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value:
                          progress.expectedTotalBytes != null
                              ? progress.cumulativeBytesLoaded /
                                  progress.expectedTotalBytes!
                              : null,
                    ),
                  ),
                );
          },
        ),
      ),
      _ => const Icon(Icons.file_present), // For other file types
    };
  }

  Widget _buildReplyPreview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.black.withOpacity(0.1) : Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.repliedTo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isCurrentUser ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message.repliedMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isCurrentUser ? Colors.white70 : Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  (IconData, Color, String) _getMessageStatus(Messages message) {
    return switch (message.isReceiverCopy) {
      // ignore: constant_pattern_never_matches_value_type
      'failed' => (Icons.error_outline, Colors.red, 'Failed'),
      // ignore: constant_pattern_never_matches_value_type
      'sent' => (Icons.done, Colors.grey, 'Sent'),
      // ignore: constant_pattern_never_matches_value_type
      'delivered' => (Icons.done_all, Colors.grey, 'Delivered'),
      // ignore: constant_pattern_never_matches_value_type
      'read' => (Icons.done_all, Colors.blue, 'Read'),
      _ => (Icons.access_time, Colors.grey, 'Sending...'),
    };
  }
}
