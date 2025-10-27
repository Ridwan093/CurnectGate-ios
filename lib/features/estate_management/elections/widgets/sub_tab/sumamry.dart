import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/flam_container.dart';
import 'package:flutter/material.dart';

/// SummaryResultTab: implements the Summary UI you described
class SummaryResultTab extends StatelessWidget {
  final ElectionState state;
  const SummaryResultTab({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    // winners: top candidate per position, in ballot order (positions order)
    final winners =
        state.election.positions.map((p) {
          final sorted = List.of(p.candidates)
            ..sort((a, b) => (b.totalVotes ?? 0).compareTo(a.totalVotes ?? 0));
          final top = sorted.isNotEmpty ? sorted.first : null;
          return {'positionTitle': p.title, 'winner': top};
        }).toList();

    // small helpers for summary stats
    final totalPositions = state.election.positions.length;
    final totalCandidates = state.election.positions.fold<int>(
      0,
      (s, p) => s + p.candidates.length,
    );
    final totalVotesAll = state.election.positions.fold<int>(
      0,
      (s, p) =>
          s + p.candidates.fold<int>(0, (t, c) => t + (c.totalVotes ?? 0)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section 1: Election Winners Card (big)
        GlowingBorder(
          isWinner: true,
          borderRadius: 16,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.instance.grey300),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 40,
                      color: AppColors.instance.yellow600,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Election Winners",
                      style: TextStyle(
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // winners list inside the card (one row per position)
                Column(
                  children:
                      winners.map((entry) {
                        final posTitle = entry['positionTitle'] as String;
                        final winner = entry['winner'];
                        final name = 'Chinedu Okafor';
                        final party = 'Independent';
                        final votes = 70;
                        // compute percentage relative to all votes in that position
                        final positionCandidates =
                            state.election.positions
                                .firstWhere((p) => p.title == posTitle)
                                .candidates;
                        final posTotal = positionCandidates.fold<int>(
                          0,
                          (t, c) => t + (c.totalVotes ?? 0),
                        );
                        final percent =
                            posTotal == 0 ? 0.0 : ((votes) / posTotal) * 100;

                        return _winnerCard(
                          winner: winner,
                          name: name,
                          party: party,
                          imageUrl: '',
                          votes: votes,
                          posTitle: posTitle,
                          percent: percent,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 18),

        // Section label
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Detailed Results by Position",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Section 3: Detailed per-position cards (one card per position showing top candidate with progress & "leading by X%")
        Column(
          children:
              state.election.positions.map((p) {
                final candidates = p.candidates;
                final posTotal = candidates.fold<int>(
                  0,
                  (t, c) => t + (c.totalVotes ?? 0),
                );
                // sort by votes desc
                final sorted = List.of(candidates)..sort(
                  (a, b) => (b.totalVotes ?? 0).compareTo(a.totalVotes ?? 0),
                );
                final leader = sorted.isNotEmpty ? sorted.first : null;
                final leaderVotes = leader?.totalVotes ?? 0;
                final leaderPct =
                    posTotal == 0 ? 0.0 : (leaderVotes / posTotal) * 100;

                return _eletionWinnerDetailesCard(
                  leader: leader,
                  p: p,
                  leaderPct: leaderPct,
                  leaderVotes: leaderVotes,
                );
              }).toList(),
        ),

        const SizedBox(height: 20),

        // Small stats row (bottom area)
        Row(
          children: [
            Expanded(
              child: _turnBoxe(
                title: "Total Votes Cast",
                value: "300",
                color: AppColors.instance.grey200.withOpacity(.4),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child:_turnBoxe(
                title: "Voter Turnout",
                value: "45%",
                color: AppColors.instance.grey200.withOpacity(.4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _turnBoxe({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.instance.black400,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "$value",
            style: TextStyle(
              fontWeight: FontFamilies.bold,
              fontSize: 35,
              color: AppColors.instance.teal400,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
        ],
      ),
    );
  }

  Widget _winnerCard({
    required Object? winner,
    required String name,
    required String party,
    required String imageUrl,
    required int votes,
    required String posTitle,
    required double percent,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: AppColors.instance.teal100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              radius: 22,
              backgroundImage:
                  (("" ?? '').isNotEmpty) ? NetworkImage("") : null,
              child:
                  (winner == null || ("" ?? '').isEmpty)
                      ? Text(name.substring(0, 1))
                      : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontFamilies.bold,
                      color: Colors.black54,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ), // role on top (style A)
                  const SizedBox(height: 2),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    party,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${percent.toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.teal400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$votes votes",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _eletionWinnerDetailesCard({
    required Candidate? leader,
    required PositionModel p,
    required double leaderPct,
    required int leaderVotes,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.instance.grey400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // role title

          // small row: dot + top candidate + score
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.instance.teal400,

                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  p.title,
                  style: const TextStyle(
                    fontWeight: FontFamilies.bold,
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "$leaderVotes",
                style: TextStyle(
                  fontWeight: FontFamilies.bold,
                  fontSize: 24,
                  fontFamily: FontFamilies.interDisplay,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Row with avatar, name + leading text, progress and chevron
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.instance.teal300,
                radius: 22,
                backgroundImage:
                    (leader?.avatarUrl != null &&
                            (leader!.avatarUrl ?? '').isNotEmpty)
                        ? NetworkImage(leader.avatarUrl)
                        : null,
                child:
                    (leader == null || (leader.avatarUrl ?? '').isEmpty)
                        ? Text((leader?.name ?? 'U').substring(0, 1))
                        : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leader?.name ?? 'TBD',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilies.interDisplay,
                      ),
                    ),
                    // const SizedBox(height: 4),
                    Text(
                      "Leading by ${leaderPct.toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: AppColors.instance.teal400,
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: (leaderPct / 100).clamp(0.0, 1.0),
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        color: AppColors.instance.teal400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }
}
