import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/chat_model/%20chat_user.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomiseConversationTile extends ConsumerWidget {
  final VoidCallback onTap;
  final Conversation conversation;
  const CustomiseConversationTile( {super.key, required  this.onTap, required this.conversation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final lastMessage = conversation.lastMessage;
  final double avatarSize = MediaQuery.of(context).size.width * 0.12; // Responsive avatar size
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align all items to top
          children: [
            // Avatar
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: avatarSize / 2,
                backgroundImage: NetworkImage(conversation.user.avatarUrl),
              ),
            ),

            // Main Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Row (Name, Role, Time)
                  Row(
                    children: [
                      // Name + Role
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              conversation.user.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontWeight: FontFamilies.bold,
                                color: AppColors.instance.black600,
                              ),
                            ),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: AppColors.instance.black600,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              conversation.user.role,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontWeight: FontFamilies.medium,
                                color: AppColors.instance.black600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Time
                      if (lastMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            DateFormat('HH:mm').format(lastMessage.time),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Message Preview
                  if (lastMessage != null)
                    _buildMessagePreview(lastMessage)
                  else
                    Text(
                      'No messages yet',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
            ),

            // Unread Indicator
            // if (conversation.unreadCount > 0) ...[
            //   const SizedBox(width: 8),
            //   Container(
            //     padding: const EdgeInsets.all(6),
            //     decoration: const BoxDecoration(
            //       color: Colors.red,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Text(
            //       conversation.unreadCount.toString(),
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 12,
            //       ),
            //     ),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }


  Widget _buildMessagePreview(ChatMessage message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        if (message.text.isNotEmpty)
          LayoutBuilder(
            builder: (context, constraints) {
              // Check if text is longer than our threshold (27 chars)
              if (message.text.length <= 27) {
                // Single line with ellipsis if needed
                return Text(
                  message.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                );
              } else {
                // For texts longer than 27 characters
                final firstLine = message.text.substring(0, 27);
                final remaining = message.text.substring(27);

                // Check if remaining text is very short (4 chars or less)
                if (remaining.length <= 4) {
                  // Show first line with ellipsis
                  return Text(
                    '$firstLine...',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  );
                } else {
                  // Show two lines properly
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        firstLine,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                      Text(
                        '${remaining.substring(0, remaining.length > 6 ? 6 : remaining.length)}...',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                    ],
                  );
                }
              }
            },
          ),
        if (message.image != null || message.file != null) ...[
          const SizedBox(height: 10),

          Container(
            margin: const EdgeInsets.only(left: 10),
            constraints: const BoxConstraints(maxWidth: 200),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.instance.grey400, width: 0.7),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  message.image != null ? Icons.image : Icons.insert_drive_file,
                  size: 16,
                  color: AppColors.instance.teal300,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    message.selectedFileName ??
                        (message.image != null ? 'Image' : 'File'),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.instance.black300,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
