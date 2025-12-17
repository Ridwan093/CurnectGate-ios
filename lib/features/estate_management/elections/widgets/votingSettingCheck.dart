import 'package:curnectgate/features/estate_management/elections/provider/Voting_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Votingsettingcheck extends ConsumerWidget {
  final Widget child;
  const Votingsettingcheck({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              poll!.data!.settings!.votingEnabled! &&
              poll.data?.settings! != null;
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
