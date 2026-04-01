import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/report_provider/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Buildcommentcount extends ConsumerWidget {
  const Buildcommentcount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(commentProvider);
    return reportAsync.when(
      data: (comment) {
        try {
          final comments = comment?.data;
          return comments != null
              ? _buildCount(
                count: (comments.comments?.length ?? 0).toString(),
              )
              : _buildCount(count: '0');
        } catch (e) {
          return _buildCount(count: "0");
        }
      },
      loading: () {
        try {
          final comment = ref.read(commentProvider).value;
          return comment != null
              ? _buildCount(
                count: (comment.data?.comments?.length ?? 0).toString(),
              )
              : _buildCount(count: "0");
        } catch (e) {
          return _buildCount(count: "0");
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration

          // Try to show cached data
          final comment = ref.read(commentProvider).value;
          if (comment != null) {
            return _buildCount(
              count: (comment.data?.comments?.length ?? 0).toString(),
            );
          }

          // No cached data available
          return _buildCount(count: "0");
        } catch (e) {
          // final comment = ref.read(commentProvider).value;
          // if (comment != null) {
          //   return CommentBody(comment.data);
          // }

          return _buildCount(count: "0");
        }
      },
    );
  }

  String checkCount(String value) {
    try {
      // Convert string to integer
      int number = int.parse(value);
      // Check if number is greater than 99
      if (number > 99) {
        return "99+";
      }
      // Return original value if 99 or less
      return value;
    } catch (e) {
      // Handle invalid input (non-numeric string)
      return value; // or return "0" or another fallback based on your needs
    }
  }

  Widget _buildCount({required String count}) {
    return Expanded(
      child: Text(
        "(${checkCount(count)}) Comments",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 15,
          color: AppColors.instance.black500,
          fontWeight: FontFamilies.bold,
        ),
      ),
    );
  }
}
