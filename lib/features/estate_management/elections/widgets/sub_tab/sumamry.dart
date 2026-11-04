import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/candidate.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/position.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/results_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/flam_container.dart';
import 'package:flutter/material.dart';

/// SummaryResultTab: implements the Summary UI you described
class SummaryResultTab extends StatelessWidget {
  final ResultsData data;
  const SummaryResultTab({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // winners: top candidate per position, in ballot order (positions order)
    final winnerList =
        data.positions?.map((position) {
          final Candidate? winner =
              (position.winners?.isNotEmpty ?? false)
                  ? position.winners!.first
                  : null;

          return {
            "positionTitle": position.positionTitle,
            "winner": winner,
            "totalVotes": position.totalVotes ?? 0,
          };
        }).toList() ??
        [];

    // small helpers for summary stats
    // final totalPositions = state.election.positions.length;
    // final totalCandidates = state.election.positions.fold<int>(
    //   0,
    //   (s, p) => s + p.candidates.length,
    // );
    // final totalVotesAll = state.election.positions.fold<int>(
    //   0,
    //   (s, p) =>
    //       s + p.candidates.fold<int>(0, (t, c) => t + (c.totalVotes ?? 0)),
    // );

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
                    Flexible(
                      child: Text(
                        "Election Winners",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontFamilies.bold,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // winners list inside the card (one row per position)
                Column(
                  children:
                      winnerList.where((entry) => entry["winner"] != null).map((
                        entry,
                      ) {
                        final String posTitle =
                            entry["positionTitle"] as String;
                        final Candidate winner = entry["winner"] as Candidate;
                        final int votes = winner.votes ?? 0;
                        final int totalVotes = entry["totalVotes"] as int;

                        final double percent =
                            totalVotes == 0 ? 0.0 : (votes / totalVotes) * 100;

                        return _winnerCard(
                          winner: winner,
                          name: winner.candidateName ?? "No winner",
                          party: "",
                          imageUrl: "",
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
              data.positions!
                  .where(
                    (p) =>
                        (p.candidates?.any((c) => c.isWinner == true) ?? false),
                  )
                  .map((p) {
                    final winner = p.candidates!.firstWhere(
                      (c) => c.isWinner == true,
                    );

                    return _eletionWinnerDetailesCard(
                      leader: winner,
                      p: p,
                      leaderPct: winner.percentage?.toDouble() ?? 0.0,
                      leaderVotes: winner.votes ?? 0,
                    );
                  })
                  .toList(),
        ),
        const SizedBox(height: 20),

        // Small stats row (bottom area)
        Row(
          children: [
            Expanded(
              child: _turnBoxe(
                valueColor: AppColors.instance.blue600,
                title: "Total Votes Cast",
                value: "${data.statistics?.totalVoted}",
                color: AppColors.instance.yellow600.withOpacity(.1),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _turnBoxe(
                valueColor: AppColors.instance.yellow600,
                title: "Voter Turnout",
                value: "${data.statistics?.turnoutPercentage}%",
                color: AppColors.instance.blue600.withOpacity(.1),
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
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: valueColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.black400,
              fontFamily: FontFamilies.interDisplay,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$value",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 32,
              color: valueColor,
              fontFamily: FontFamilies.interDisplay,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _winnerCard({
    required Candidate? winner,
    required String name,
    required String party,
    required String imageUrl,
    required int votes,
    required String posTitle,
    required double percent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.instance.yellow600.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.instance.yellow600.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.instance.yellow600,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: (imageUrl.isNotEmpty) ? NetworkImage(imageUrl) : null,
              child: name.isNotEmpty && imageUrl.isEmpty 
                  ? Text(
                      name.substring(0, 1),
                      style: TextStyle(
                        color: AppColors.instance.yellow600,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ) 
                  : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.instance.black400,
                    fontFamily: FontFamilies.interDisplay,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
                if (party.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    party,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.instance.black300,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ]
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
                  fontWeight: FontWeight.w800,
                  color: AppColors.instance.yellow600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$votes votes",
                style: TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.black500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _eletionWinnerDetailesCard({
    required Candidate? leader,
    required Position p,
    required double leaderPct,
    required int leaderVotes,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
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
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.instance.teal400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  p.positionTitle ?? "Unknown Position",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                "$leaderVotes",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  color: AppColors.instance.teal500,
                  fontFamily: FontFamilies.interDisplay,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.instance.grey200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Text(
                    (leader?.candidateName ?? 'U').substring(0, 1),
                    style: TextStyle(
                      color: AppColors.instance.teal500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leader?.candidateName ?? 'TBD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.instance.black600,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.trending_up, size: 14, color: AppColors.instance.teal400),
                          const SizedBox(width: 4),
                          Text(
                            "Leading by ${leaderPct.toStringAsFixed(0)}%",
                            style: TextStyle(
                              color: AppColors.instance.teal500,
                              fontFamily: FontFamilies.interDisplay,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: (leaderPct / 100).clamp(0.0, 1.0),
                          minHeight: 6,
                          backgroundColor: AppColors.instance.grey300.withOpacity(0.6),
                          color: getVoteColor(leaderPct),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right_rounded, color: AppColors.instance.black300),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getVoteColor(double percent) {
    switch (percent) {
      case >= 45:
        return AppColors.instance.teal500; // Strong lead
      case >= 30:
        return AppColors.instance.blue400; // Moderate lead
      case >= 15:
        return AppColors.instance.yellow500; // Competitive
      default:
        return AppColors.instance.error500; // Low votes
    }
  }
}
