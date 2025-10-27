import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/candidate%20detail_dialog.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votNow_container.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/vote_progress_card.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VoteNow extends ConsumerWidget {
  const VoteNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(electionProvider);
    final election = state.election;

    return Column(
      children: [
        VoteProgressCard(),
        const SizedBox(height: 16),
        VotnowContainer(),
        const SizedBox(height: 16),
        ...election.positions
            .map((pos) => _positionCard(pos, state, ref, context))
            .toList(),

        // const SizedBox(height: 40),
        WorkSubmitbutton(label: "Submit Vote", onPressed: () {}),
      ],
    );
  }

  Widget _positionCard(
    PositionModel pos,
    ElectionState state,
    WidgetRef ref,
    BuildContext context,
  ) {
    final selected = state.selections[pos.id];

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
                  pos.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              if (selected == null)
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
            pos.description,
            style: const TextStyle(
              color: Colors.black54,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
          const SizedBox(height: 12),

          // Candidates list
          ...pos.candidates
              .map((c) => _candidateTile(c, pos.id, selected, ref, context))
              .toList(),
        ],
      ),
    );
  }

  Widget _candidateTile(
    Candidate c,
    String positionId,
    String? selectedId,
    WidgetRef ref,
    BuildContext context,
  ) {
    final isSelected = selectedId == c.id;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap:
          () => ref
              .read(electionProvider.notifier)
              .selectCandidate(positionId, c.id),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue.shade200 : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                c.name
                    .split(' ')
                    .map((s) => s.isNotEmpty ? s[0] : '')
                    .take(2)
                    .join(),

                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.teal300,

                  fontWeight: FontFamilies.bold,
                ),
              ),
              backgroundColor: Colors.grey.shade100,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.name,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,

                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.party,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black300,
                    ),
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
                        name: c.name,
                        unit: c.party,
                        role: "Chairman",
                        biography:
                            "Banking professonal with investment expertis.",
                        manifesto:
                            "Gow estate reserves and optimize expenditure",
                        voteShare: 35,
                        totalVotes: 80,
                        imageUrl:
                            "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500",
                        onVote: () {
                          ref
                              .read(electionProvider.notifier)
                              .selectCandidate(positionId, c.id);
                          context.pop();
                        },
                      ),
                );
              },
            ),

            isSelected
                ? Container(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.radio_button_checked,

                    color: AppColors.instance.teal300,
                  ),
                )
                : SizedBox(),
            // selection radio
            // GestureDetector(
            //   behavior: HitTestBehavior.opaque,
            //   onTap:
            //       () => ref
            //           .read(electionProvider.notifier)
            //           .selectCandidate(positionId, c.id),
            //   child:
            //       isSelected
            //           ? Container(
            //             padding: const EdgeInsets.all(6),
            //             child: Icon(
            //               Icons.radio_button_checked,

            //               color: AppColors.instance.teal300,
            //             ),
            //           )
            //           : null,
            // ),
          ],
        ),
      ),
    );
  }
}
