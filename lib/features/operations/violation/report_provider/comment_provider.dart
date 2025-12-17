// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentProvider =
    AsyncNotifierProvider.autoDispose<CommentNotifer, CommentResponse?>(() {
      return CommentNotifer();
    });

class CommentNotifer extends AutoDisposeAsyncNotifier<CommentResponse?> {
  @override
  Future<CommentResponse?> build() async {
    // First try to load from local storage
    final localComment = await SharedPrefsService.getReportComment();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }
      final id = ref.watch(reportProvider).report.id.toString();
      final freshComment = await ref
          .read(getApiServiceProvider)
          .getreportComment(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (localComment?.toJson() != freshComment.toJson()) {
        await SharedPrefsService.saveReportComment(freshComment);
      }

      return freshComment;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localComment != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localComment;
      }
      rethrow;
    }
  }

  Future<void> refreshComment(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final id = ref.watch(reportProvider).report.id.toString();
        final freshComment = await ref
            .read(getApiServiceProvider)
            .getreportComment(bearerToken: token!, id: id);
        await SharedPrefsService.saveReportComment(freshComment);
        return freshComment;
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401) {
          log(e.toString());
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else if (e.toString().contains("The connection errored") ||
            e.toString().contains("The request connection took longer than")) {
          log(e.toString());
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localComment = await SharedPrefsService.getReportComment();
        if (localComment != null) return localComment;
        rethrow;
      }
    });
  }
}
