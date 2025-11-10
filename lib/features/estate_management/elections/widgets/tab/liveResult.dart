import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/sub_tab/sumamry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveResultTab extends ConsumerWidget {
  final ElectionState state;
  const LiveResultTab({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positions = state.election.positions;

    // 🔹 Add "summary" as main manual tab
    const summaryTab = "summary";
    final active = state.activeResultTab ?? summaryTab;

    final isSummary = active == summaryTab;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Scrollable Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              /// ✅ Summary tab button

              /// ✅ Remaining tabs from backend
              ...positions.map((p) {
                final isActive = !isSummary && active == p.id;
                return GestureDetector(
                  onTap:
                      () => ref
                          .read(electionProvider.notifier)
                          .changeResultTab(p.id),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? AppColors.instance.teal300
                              : AppColors.instance.black200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      p.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap:
                    () => ref
                        .read(electionProvider.notifier)
                        .changeResultTab(summaryTab),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSummary
                            ? AppColors.instance.teal300
                            : AppColors.instance.black200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSummary ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ✅ When Summary Tab is Active → show special UI
        if (isSummary)
          SummaryResultTab(state: state)
        // ✅ When a position tab is active → show candidate results
        else
          _candidateResultSection(state),
      ],
    );
  }

  // 🔹 Existing Candidate UI moved here cleanly
  Widget _candidateResultSection(ElectionState state) {
    final active = state.activeResultTab!;
    final position = state.election.positions.firstWhere((p) => p.id == active);
    final candidates = position.candidates;
    final totalVotes = candidates.fold(0, (s, c) => s + (c.totalVotes ?? 0));

    return Column(
      children: [
        // ✅ Existing Total Votes Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.instance.grey300),
          ),
          child: Column(
            children: [
              const Text(
                "Total Votes",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                "$totalVotes",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        /// ✅ Your candidate cards remain same
        ...candidates.map((c) {
          final maxVotes = candidates
              .map((x) => x.totalVotes ?? 0)
              .reduce((a, b) => a > b ? a : b);
          final percent =
              totalVotes == 0 ? 0 : ((c.totalVotes ?? 0) / totalVotes) * 100;
          final leader = (c.totalVotes ?? 0) == maxVotes && maxVotes > 0;

          return _candidateResultCard(c, percent.toDouble(), leader);
        }),
      ],
    );
  }

  Widget _candidateResultCard(Candidate c, double percent, bool leader) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: leader ? AppColors.instance.blue100 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color:
              leader
                  ? getVoteColor(percent).withValues()
                  : AppColors.instance.grey300,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage:
                // ignore: unnecessary_null_comparison
                c.avatarUrl != null ? NetworkImage(c.avatarUrl) : null,
            child: c.avatarUrl == null ? Text(c.name[0]) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  c.party ?? "Independent",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: percent / 100,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  color: getVoteColor(percent),
                ),
                const SizedBox(height: 6),
                Text(
                  "${c.totalVotes} Votes",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${percent.toStringAsFixed(1)}%",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              const Text(
                "Leading",
                style: TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
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
