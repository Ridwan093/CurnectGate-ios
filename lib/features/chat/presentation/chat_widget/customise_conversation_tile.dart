import 'package:cached_network_image/cached_network_image.dart';
import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomiseConversationTile extends ConsumerWidget {
  final VoidCallback onTap;
  final Conversation conversation;
  const CustomiseConversationTile({
    super.key,
    required this.onTap,
    required this.conversation,
  });

  String getFormattedTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(
        dateString,
      ); // parse the string into DateTime
      return DateFormat('hh:mm a').format(dateTime); // format it
    } catch (e) {
      return ''; // fallback if parsing fails
    }
  }

  String _formatRole(String role) {
    return role
        .replaceAll('_', ' ')
        .split(' ')
        .map((e) => e.isNotEmpty ? e[0].toUpperCase() + e.substring(1) : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastMessage = conversation.latestMessage;
    final double avatarSize = MediaQuery.of(context).size.width * 0.12;

    final authState = ref.watch(authProvider);
    final currentUserId = authState.user?["id"];

    Participant? otherParticipant;

    final participants = conversation.participants;

    if (participants != null && participants.isNotEmpty) {
      otherParticipant = participants.firstWhere(
        (p) => p.userId?.toString() != currentUserId?.toString(),
        orElse: () => participants.first,
      );
    }

    final avatarUrl = otherParticipant?.avatarUrl ?? "";

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
              child: Stack(
                clipBehavior: Clip.none, // allows badge to overflow the circle
                children: [
                  CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: avatarUrl,
                        width: avatarSize,
                        height: avatarSize,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Loadingstates(),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.person,
                              color: AppColors.instance.black600,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, // place at bottom-right
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color:
                            (otherParticipant?.onlineStatus ?? "offline")
                                    .toLowerCase()
                                    .contains("online")
                                ? AppColors.instance.teal500
                                : Colors.grey, // online status color
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              Colors
                                  .white, // add border to separate from avatar
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
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
                              conversation.title ?? "",
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
                              _formatRole(otherParticipant?.role ?? ""),
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
                            getFormattedTime(lastMessage.createdAt),
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

            if ((conversation.unreadCount ?? 0) > 0) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.instance.teal400,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  conversation.unreadCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMessagePreview(LatestMessage message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        if ((message.messageText ?? "").isNotEmpty)
          LayoutBuilder(
            builder: (context, constraints) {
              // Check if text is longer than our threshold (27 chars)
              if ((message.messageText ?? "").length <= 27) {
                // Single line with ellipsis if needed
                return Text(
                  message.messageText ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                );
              } else {
                // For texts longer than 27 characters
                final firstLine = (message.messageText ?? "").substring(0, 27);
                final remaining = (message.messageText ?? "").substring(27);

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

        if (message.attachments != null && message.attachments!.isNotEmpty)
          ...message.attachments!.map((attachment) {
            return Container(
              margin: const EdgeInsets.only(left: 10, bottom: 4),
              constraints: const BoxConstraints(maxWidth: 200),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.instance.grey400,
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getAttachmentIcon(attachment),
                    size: 16,
                    color: AppColors.instance.teal300,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      attachment.fileName ?? attachment.fileType ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.instance.black300,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
      ],
    );
  }

  IconData _getAttachmentIcon(Attachment attachment) {
    if (attachment.isImage ?? false) return Icons.image;
    if (attachment.isDocument ?? false) return Icons.picture_as_pdf;
    if (attachment.isVideo ?? false) return Icons.videocam;

    return Icons.insert_drive_file; // fallback for unknown types
  }
}
