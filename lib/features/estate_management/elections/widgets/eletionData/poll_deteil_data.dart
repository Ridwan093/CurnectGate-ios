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
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.black400.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: AppColors.instance.grey300.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.instance.teal400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  pos.title ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 18,
                    color: AppColors.instance.black600,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: pos.userHasVoted! 
                      ? AppColors.instance.teal100.withOpacity(0.5)
                      : AppColors.instance.grey200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: pos.userHasVoted! 
                        ? AppColors.instance.teal400.withOpacity(0.5)
                        : Colors.transparent,
                  )
                ),
                child: Text(
                  pos.userHasVoted! ? 'Voted' : 'Not voted',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: pos.userHasVoted! 
                        ? AppColors.instance.teal500 
                        : AppColors.instance.black400,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (pos.description != null && pos.description!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              pos.description!,
              style: TextStyle(
                color: AppColors.instance.black400,
                fontSize: 14,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
          ],
          const SizedBox(height: 18),
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
              ? null
              : () {
                ref
                    .read(electionProvider.notifier)
                    .selectCandidate(positionId, candidateId);
              },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.instance.teal100.withOpacity(0.4) 
              : AppColors.instance.grey200.withOpacity(0.3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? AppColors.instance.teal400
                : AppColors.instance.grey300.withOpacity(0.5),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.instance.teal400 : Colors.transparent,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.instance.grey200,
                radius: 20,
                child: Text(
                  c.name!
                      .split(' ')
                      .map((s) => s.isNotEmpty ? s[0] : '')
                      .take(2)
                      .join(),
                  style: TextStyle(
                    color: AppColors.instance.teal500,
                    fontWeight: FontWeight.w800,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.name ?? "",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.partyAffiliation ?? "Independent",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black400,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline_rounded,
                color: AppColors.instance.black400,
                size: 22,
              ),
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
            if (!hasVoted) ...[
              const SizedBox(width: 4),
              Icon(
                isSelected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected ? AppColors.instance.teal400 : AppColors.instance.grey400,
                size: 26,
              ),
            ] else ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.instance.teal100 : AppColors.instance.grey200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.how_to_vote_rounded, 
                  color: isSelected ? AppColors.instance.teal500 : AppColors.instance.black300,
                  size: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
