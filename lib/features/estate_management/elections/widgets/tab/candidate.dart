import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/Candidate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EletionCandidate extends ConsumerWidget {
  const EletionCandidate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(electionProvider);
    final election = state.election;

    return Column(
      children: [
        ...election.positions
            .map((pos) => _positionCard(pos, state, ref, context))
            .toList(),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
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
          ],
        ),

        const SizedBox(height: 12),

        // Candidates list
        ...pos.candidates
            .map((c) => _candidateTile(c, pos.id, selected, ref, context))
            .toList(),
      ],
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
          () => showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: '',
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder:
                (_, __, ___) => CandidateDialog(
                  name: "Tunde Adeyemi",
                  role: "President",
                  party: "New Dawn",
                  bio: "Engineer and urban planning specialist",
                  voteShare: 22,
                  totalVotes: 220,
                  avatarUrl:
                      "https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=500",
                ),
            transitionBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          ),

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
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
                  const SizedBox(height: 4),
                  Text(
                    "Banking professonal with investment expertis.",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),
            ),

            // IconButton(
            //   icon: const Icon(Icons.arrow_forward_ios, size: 12),
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder:
            //           (_) => CandidateDetailDialog(
            //             name: c.name,
            //             unit: c.party,
            //             role: "Chairman",
            //             biography:
            //                 "Banking professonal with investment expertis.",
            //             manifesto:
            //                 "Gow estate reserves and optimize expenditure",
            //             voteShare: 35,
            //             totalVotes: 80,
            //             imageUrl:
            //                 "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500",
            //             onVote: () {
            //               ref
            //                   .read(electionProvider.notifier)
            //                   .selectCandidate(positionId, c.id);
            //               context.pop();
            //             },
            //           ),
            //     );
            //   },
            // ),
            Container(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 12,

                color: AppColors.instance.teal300,
              ),
            ),

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
