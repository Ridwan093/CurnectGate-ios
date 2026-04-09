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
   ref.listen<AsyncValue<dynamic>>(
    votingSettingsProvider,
    (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          final errorStr = error.toString().toLowerCase();

          if (errorStr.contains("access denied")) {
            // Only set the error if it's different from the previous one
            // (prevents duplicates when the provider keeps the same error)
            if (previous?.hasError != true || 
                previous?.error.toString() != error.toString()) {
              
              ref.read(electionProvider.notifier).setError(error.toString());
            }
          }
        },
      );
    },
    // Optional: fireImmediately: false (default) is usually what you want
  );

          // final message = getUserFriendlyError(error);
          // showCustomSuccessToast(
          //   context: context,
    
    final voteSetting = ref.watch(votingSettingsProvider);
    //   if (voteSetting?.data?.settings != null &&
    //       voteSetting!.data!.settings!.votingEnabled!) {
    //     return child;
    //   } else {
    //     return Container();
    //   }
    //   // VoteProgressCard(),
    // }

    return voteSetting.when(
      data: (poll) {
        try {
          final polls =
              (poll?.data?.settings?.votingEnabled ?? false) &&
              poll?.data?.settings! != null;
          return polls ? child : SizedBox.shrink();
        } catch (e) {
          return SizedBox.shrink();
        }
      },

      loading: () {
        try {
          return SizedBox.shrink();
        } catch (e) {
          return SizedBox.shrink();
        }
      },
      error: (error, stack) {
        return SizedBox.shrink();
      },
    );
  }
}
