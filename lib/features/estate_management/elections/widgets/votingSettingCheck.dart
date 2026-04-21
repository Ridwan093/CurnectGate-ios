import 'package:curnectgate/features/estate_management/elections/provider/Voting_setting_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Votingsettingcheck extends ConsumerWidget {
  final Widget child;
  const Votingsettingcheck({super.key, required this.child});
  String getUserFriendlyError(Object error) {
    if (error is DioException) {
      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        final message = data['message']?.toString() ?? "";

        // Handle permission errors
        if (message.toLowerCase().contains("access denied") ||
            error.response?.statusCode == 403) {
          return "You don’t have permission to perform this action.";
        }

        // Otherwise return backend message if it's clean
        if (message.isNotEmpty && message.length < 120) {
          return message;
        }
      }
    }

    return "Something went wrong. Please try again.";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(votingSettingsProvider, (previous, next) {
      if (next.hasError) {
        final err = next.error;
        final errorStr = err.toString().toLowerCase();
        bool isAccessDenied = false;

        if (err is DioException && err.response?.statusCode == 403) {
          isAccessDenied = true;
        } else if (errorStr.contains("access denied")) {
          isAccessDenied = true;
        }

        if (isAccessDenied) {
          // Only set the error if it's different from the previous one
          if (previous?.hasError != true ||
              previous?.error.toString() != err.toString()) {
            ref.read(electionProvider.notifier).setError(err.toString());
          }
        }
      }
    });

    final voteSetting = ref.watch(votingSettingsProvider);

    if (voteSetting.hasValue) {
      final poll = voteSetting.value;
      try {
        final polls =
            (poll?.data?.settings?.votingEnabled ?? false) &&
            poll?.data?.settings != null;
        return polls ? child : const SizedBox.shrink();
      } catch (e) {
        return const SizedBox.shrink();
      }
    }

    return const SizedBox.shrink();
  }
}
