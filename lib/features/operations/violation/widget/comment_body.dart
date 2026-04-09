import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model/comment_data.dart';
import 'package:curnectgate/features/operations/violation/model/timeAgo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentBody extends ConsumerWidget {
  final CommentData data;
  const CommentBody(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.comments?.length ?? 0,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final comment = data.comments![index];
        final createdAt = comment.createdAt;
        final isInternal = comment.isInternal == 1;

        final parsedDate =
            createdAt == null ? null : DateTime.tryParse(createdAt);

        if (parsedDate == null) {
          return const SizedBox.shrink();
        }

        final timeAge = TimeagoModel(parsedDate);

        String userName = comment.user?.name ?? "User";
        String avatarUrl =
            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(userName)}&background=8EC0C9&color=ffffff&size=128';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar with premium border
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isInternal ? AppColors.instance.yellow500 : AppColors.instance.teal500.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.instance.grey200,
                    radius: 18,
                    backgroundImage: NetworkImage(
                      comment.mediaUrl ?? avatarUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Name and Time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              userName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.instance.black600,
                                fontFamily: FontFamilies.interDisplay,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          if (isInternal) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.instance.yellow500.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "INTERNAL",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.instance.yellow500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(width: 6),
                          Icon(
                            Icons.circle,
                            size: 4,
                            color: AppColors.instance.black300,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            timeAge.timeAgo,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.instance.black300,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      
                      // Comment Bubble-style container
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isInternal 
                              ? AppColors.instance.yellow500.withOpacity(0.05) 
                              : AppColors.instance.grey200.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          comment.comment ?? "",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black500,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                IconButton(
                  icon: Icon(Icons.more_horiz, color: AppColors.instance.black300, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
