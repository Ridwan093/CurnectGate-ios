import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart' show FontFamilies;
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/poll_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/poll_deteil_data.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../eletionData/voting_seting_data.dart';

class VoteNow extends ConsumerWidget {
  const VoteNow({super.key});
  Map<String, dynamic> getVotePayload(WidgetRef ref) {
    final selections = ref.read(electionProvider).selections;

    final votes =
        selections.entries.map((entry) {
          return {
            "position_id": int.parse(entry.key),
            "candidate_ids": [
              int.parse(entry.value),
            ], // always list with 1 item
          };
        }).toList();

    return {"votes": votes};
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(electionProvider).id;
    final selections = ref.read(electionProvider).selections;
    final isLoading = ref.watch(formProvider).generateMemberIdLoading;

    return Column(
      children: [
        PollDatas(canRoute: false),

        /// exicute card.
        const SizedBox(height: 16),
        VotingSettingsData(),

        const SizedBox(height: 16),
        // ...polldeteilsAsync!.data!.poll!.positions!
        //     .map((pos) => _positionCard(pos, ref, context))
        //     .toList(),
        PollDeteilData(),

        // const SizedBox(height: 40),
        _buildVoteButton(
          context: context,
          isLoading: isLoading,
          onPressed:
              selections.isNotEmpty
                  ? () {
                    final selectedItem = getVotePayload(ref);

                    log(id.toString());
                    if (isLoading) return;
                    // // Send this to your API
                    ref
                        .read(formProvider.notifier)
                        .casetVote(
                          context: context,
                          id: id,
                          ref: ref,
                          requestData: selectedItem,
                        );

                    // ref.read(formProvider.notifer)
                  }
                  : null,
        ),
      ],
    );
  }

  Widget _buildVoteButton({
    required VoidCallback? onPressed,
    required BuildContext context,
    required bool isLoading,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: onPressed != null
              ? AppColors.instance.black600
              : AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(16),
          boxShadow: onPressed != null ? [
            BoxShadow(
              color: AppColors.instance.black600.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: Center(
          child: isLoading
              ? Loadingstates()
              : Text(
                  "Submit Vote",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: onPressed != null
                        ? Colors.white
                        : AppColors.instance.black400.withOpacity(0.5),
                  ),
                ),
        ),
      ),
    );
  }
}
