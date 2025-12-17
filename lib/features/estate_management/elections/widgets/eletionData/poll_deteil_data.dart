import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/candidate_details.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/position_item_details.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_deteil_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/candidate%20detail_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollDeteilData extends ConsumerWidget {
  const PollDeteilData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final polldeteilsAsync = ref.watch(pollDetailsProvider);
    return polldeteilsAsync.when(
      data: (poll) {
        try {
          final polls = poll?.data;
          return polls != null
              ? Column(
                children: [
                  ...polls.poll!.positions!
                      .map((pos) => _positionCard(pos, ref, context))
                      .toList(),
                ],
              )
              : EmptyBodys(message: "No Poll Deteils?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(pollDetailsProvider.notifier)
                    .refreshPollDeteils(context, ref),
            firstMessae: "Faile to load Poll Deteils?",
          );
        }
      },
      loading: () {
        try {
          final polls = ref.read(pollDetailsProvider).value;
          return polls != null
              ? Column(
                children: [
                  ...polls.data!.poll!.positions!
                      .map((pos) => _positionCard(pos, ref, context))
                      .toList(),
                ],
              )
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(pollDetailsProvider.notifier)
                    .refreshPollDeteils(context, ref),
            firstMessae: "Faile to load Poll Deteils?",
          );
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error is DioException && error.response?.statusCode == 401) {
            return Expiresessionbody();
          }

          // Try to show cached data
          final polls = ref.read(pollDetailsProvider).value;
          if (polls != null) {
            return Column(
              children: [
                ...polls.data!.poll!.positions!
                    .map((pos) => _positionCard(pos, ref, context))
                    .toList(),
                // Emmergencybody(error: error.toString()),
              ],
            );
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(pollDetailsProvider.notifier)
                    .refreshPollDeteils(context, ref),
            firstMessae: "Faile to load Poll Deteils?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(pollDetailsProvider.notifier)
                    .refreshPollDeteils(context, ref),
            firstMessae: "Faile to load Poll deteils?",
          );
        }
      },
    );
  }

  Widget _positionCard(
    PositionItemDetails pos,

    WidgetRef ref,
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.instance.teal400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pos.title ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              if (pos.userHasVoted! == false)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Not voted',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,

                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Voted',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,

                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            pos.description ?? "",
            style: const TextStyle(
              color: Colors.black54,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
          const SizedBox(height: 12),

          // Candidates list
          ...pos.candidates!
              .map((c) => _candidateTile(c, pos, ref, context))
              .toList(),
        ],
      ),
    );
  }

  // Widget _candidateTile(
  //   CandidateDetails c,
  //   PositionItemDetails pos,

  //   WidgetRef ref,
  //   BuildContext context,
  // ) {
  //   return GestureDetector(
  //     behavior: HitTestBehavior.opaque,
  //     onTap:
  //         () => ref.read(electionProvider.notifier).selectCandidate("4", "4"),
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 6),
  //       padding: const EdgeInsets.all(12),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color:
  //               pos.userHasVoted! ? Colors.blue.shade200 : Colors.grey.shade200,
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           CircleAvatar(
  //             child: Text(
  //               c.name!
  //                   .split(' ')
  //                   .map((s) => s.isNotEmpty ? s[0] : '')
  //                   .take(2)
  //                   .join(),

  //               style: TextStyle(
  //                 fontFamily: FontFamilies.interDisplay,
  //                 color: AppColors.instance.teal300,

  //                 fontWeight: FontFamilies.bold,
  //               ),
  //             ),
  //             backgroundColor: Colors.grey.shade100,
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   c.name ?? "",
  //                   style: TextStyle(
  //                     fontFamily: FontFamilies.interDisplay,
  //                     color: AppColors.instance.black600,

  //                     fontWeight: FontFamilies.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   c.partyAffiliation ?? "",
  //                   style: TextStyle(
  //                     fontFamily: FontFamilies.interDisplay,
  //                     color: AppColors.instance.black300,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           IconButton(
  //             icon: const Icon(Icons.info_outline),
  //             onPressed: () {
  //               showDialog(
  //                 context: context,
  //                 builder:
  //                     (_) => CandidateDetailDialog(
  //                       name: c.name ?? "",
  //                       unit: c.partyAffiliation ?? "",
  //                       role: pos.title ?? "",
  //                       biography: c.bio ?? "",
  //                       manifesto: "",
  //                       voteShare: 35,
  //                       totalVotes: 80,
  //                       imageUrl: c.mediaUrl ?? "",
  //                       onVote: () {
  //                         // ref
  //                         //     .read(electionProvider.notifier)
  //                         //     .selectCandidate(positionId, c.id);
  //                         context.pop();
  //                       },
  //                     ),
  //               );
  //             },
  //           ),

  //           // ? Container(
  //           //   padding: const EdgeInsets.all(6),
  //           //   child: Icon(
  //           //     Icons.radio_button_checked,

  //           //     color: AppColors.instance.teal300,
  //           //   ),
  //           // )
  //           // : SizedBox(),
  //           // selection radio
  //           // GestureDetector(
  //           //   behavior: HitTestBehavior.opaque,
  //           //   onTap:
  //           //       () => ref
  //           //           .read(electionProvider.notifier)
  //           //           .selectCandidate(positionId, c.id),
  //           //   child:
  //           //       isSelected
  //           //           ? Container(
  //           //             padding: const EdgeInsets.all(6),
  //           //             child: Icon(
  //           //               Icons.radio_button_checked,

  //           //               color: AppColors.instance.teal300,
  //           //             ),
  //           //           )
  //           //           : null,
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _candidateTile(
    CandidateDetails c,
    PositionItemDetails pos,
    WidgetRef ref,
    BuildContext context,
  ) {
    final positionId = pos.id.toString();
    final candidateId = c.id.toString();

    // Watch current selection for this position
    final selectedCandidateId = ref.watch(
      electionProvider.select((state) => state.selections[positionId]),
    );

    final isSelected = selectedCandidateId == candidateId;
    final hasVoted = pos.userHasVoted == true;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap:
          hasVoted
              ? null // Optional: disable selection if already voted
              : () {
                ref
                    .read(electionProvider.notifier)
                    .selectCandidate(positionId, candidateId);
              },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.instance.teal300.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                isSelected
                    ? AppColors.instance.teal300
                    : (hasVoted ? Colors.grey.shade300 : Colors.grey.shade200),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Text(
                c.name!
                    .split(' ')
                    .map((s) => s.isNotEmpty ? s[0] : '')
                    .take(2)
                    .join(),
                style: TextStyle(
                  color: AppColors.instance.teal300,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.partyAffiliation ?? "Independent",
                    style: TextStyle(color: AppColors.instance.black300),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => CandidateDetailDialog(
                        name: c.name ?? "",
                        unit: c.partyAffiliation ?? "",
                        role: pos.title ?? "",
                        biography: c.bio ?? "",
                        manifesto: "",
                        voteShare: 35,
                        totalVotes: 80,
                        imageUrl: c.mediaUrl ?? "",
                        onVote:
                            hasVoted
                                ? null
                                : () {
                                  ref
                                      .read(electionProvider.notifier)
                                      .selectCandidate(positionId, candidateId);
                                  context.pop();
                                },
                      ),
                );
              },
            ),
            // Radio button indicator
            if (!hasVoted)
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: isSelected ? AppColors.instance.teal300 : Colors.grey,
              )
            else
              const Icon(Icons.how_to_vote, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
