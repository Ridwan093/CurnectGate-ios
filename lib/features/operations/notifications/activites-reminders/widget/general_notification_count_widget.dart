import 'package:curnectgate/core/constants/asset_paths.dart' show AssetPaths;
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/provider/notification_Count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationCount extends ConsumerWidget {
  final VoidCallback onTap;
  final double width;
  final Color color;
  NotificationCount({
    super.key,
    required this.onTap,
    this.width = 0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(getNotificationCount);
    // Replace with your actual comments data
    return reportAsync.when(
      data: (comment) {
        try {
          final comments = comment?.data;
          return comments != null
              ? _buildNotificationBell(
                comment?.data?.count ?? 0,
                context,
                onTap,
                width,
                color,
              )
              : _buildNotificationBell(0, context, onTap, width, color);
        } catch (e) {
          return _buildNotificationBell(0, context, onTap, width, color);
        }
      },
      loading: () {
        try {
          final comment = ref.read(getNotificationCount).value;
          return comment != null
              ? _buildNotificationBell(
                comment.data?.count ?? 0,
                context,
                onTap,
                width,
                color,
              )
              : _buildNotificationBell(0, context, onTap, width, color);
        } catch (e) {
          return _buildNotificationBell(0, context, onTap, width, color);
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration

          // Try to show cached data
          final comment = ref.read(getNotificationCount).value;
          if (comment != null) {
            return _buildNotificationBell(
              comment.data?.count ?? 0,
              context,
              onTap,
              width,
              color,
            );
          }

          // No cached data available
          return _buildNotificationBell(0, context, onTap, width, color);
        } catch (e) {
          return _buildNotificationBell(0, context, onTap, width, color);
          // final comment = ref.read(commentProvider).value;
          // if (comment != null) {
          //   return CommentBody(comment.data);
          // }
        }
      },
    );
  }

  Widget _buildNotificationBell(
    int count,
    BuildContext context,
    VoidCallback onTap,
    double width,
    Color color,
  ) {
    String displayCount = _formatCount(count);

    return Padding(
      padding: EdgeInsets.only(right: width == 0 ? 35 : width),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AssetPaths.dashboardNotification,
              width: 25,
              height: 25,
              color: color,
            ),
            if (count > 0)
              Positioned(
                top: -6,
                right: count > 999 ? -20 : -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.yellow500,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    displayCount,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Format number into compact form (e.g., 1k, 1.2M)
  String _formatCount(int count) {
    if (count >= 1000000) {
      return "${(count / 1000000).toStringAsFixed(1)}M";
    } else if (count >= 1000) {
      return "${(count / 1000).toStringAsFixed(1)}k";
    } else {
      return count.toString();
    }
  }
}
