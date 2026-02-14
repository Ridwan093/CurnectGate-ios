import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/report_provider/comment_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/comment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Buildcommentlist extends ConsumerWidget {
  final int id;
  const Buildcommentlist({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(commentProvider);
    // Replace with your actual comments data
    return reportAsync.when(
      data: (comment) {
        try {
          final comments = comment?.data;
          return comments != null ? CommentBody(comments) : _buildEmtyBody();
        } catch (e) {
          return _buildErrorUI(e.toString(), ref, context);
        }
      },
      loading: () {
        try {
          final comment = ref.read(commentProvider).value;
          final comments = comment?.data;
          return comment?.data != null
              ? CommentBody(comments!)
              : _buildLoadingState();
        } catch (e) {
          return _buildErrorUI(e.toString(), ref, context);
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return _buildSessionExpiredUI();
          }

          // Try to show cached data
          final comment = ref.read(commentProvider).value;
          final comments = comment?.data;
          if (comment != null) {
            return CommentBody(comments!);
          }
          if (comment != null) {
            final comments = comment.data;
            return CommentBody(comments!);
          }

          // No cached data available
          return _buildErrorUI(
            error.toString().toLowerCase().contains("connection")
                ? "Connection failed. Please check your network"
                : "Failed to load reports",
            ref,
            context,
          );
        } catch (e) {
          // final comment = ref.read(commentProvider).value;
          // if (comment != null) {
          //   return CommentBody(comment.data);
          // }

          return _buildErrorUI(e.toString(), ref, context);
        }
      },
    );
  }

  // Helper Widgets
  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }

  Widget _buildSessionExpiredUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Your session has expired"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            /* your login logic */
            child: Text(
              "Login Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorUI(String error, WidgetRef ref, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: AppColors.instance.error600,
          ),
          const SizedBox(height: 16),
          Text(
            "Failed to load comment",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 16,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.split(':').first,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.instance.grey200,
            ),
            onPressed:
                () => ref
                    .read(commentProvider.notifier)
                    .refreshComment(context, ref, id),
            child: Text(
              "Try Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.navMessages, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "No comment made on this report Yet!",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }
}
