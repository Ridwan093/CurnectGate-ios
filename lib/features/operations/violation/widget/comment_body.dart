import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model.dart';
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
      itemCount: data.comments.length,
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final comment = data.comments[index];
        final timeAge = TimeagoModel(DateTime.parse(comment.createdAt));
        String userName = comment.user.name;
        String avatarUrl =
            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(userName)}&background=8EC0C9&color=ffffff&size=128';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- User Avatar + Name + Time ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.instance.teal500,
                    radius: 20,
                    backgroundImage: NetworkImage(
                      comment.mediaUrl ?? avatarUrl,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          comment.user.name,
                          style: TextStyle(
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 5,

                          width: 5,
                          decoration: BoxDecoration(
                            color: AppColors.instance.black300,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          timeAge.timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.instance.black300,
                            fontFamily: FontFamilies.interDisplay,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),

              // --- Comment Text ---
              Padding(
                padding: const EdgeInsets.only(left: 52),
                child: Text(
                  comment.comment,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),

              // --- Replies (if any) ---
            ],
          ),
        );
      },
    );
  }
}
