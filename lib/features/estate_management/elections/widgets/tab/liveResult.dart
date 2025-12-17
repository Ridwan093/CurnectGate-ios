import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/candidate_data.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/live_results_data.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/position_data.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/summary_result_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveResultTab extends ConsumerStatefulWidget {
  final ElectionState state;
  final LiveResultsData data;
  const LiveResultTab({super.key, required this.state, required this.data});

  @override
  ConsumerState<LiveResultTab> createState() => _LiveResultTabState();
}

class _LiveResultTabState extends ConsumerState<LiveResultTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final firstPosition = widget.data.positions?.firstOrNull;
      if (firstPosition != null) {
        ref
            .read(electionProvider.notifier)
            .changeResultTab(firstPosition.positionTitle ?? "");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final positions = state.election.positions;

    // 🔹 Add "summary" as main manual tab

    const summaryTab = "summary";
    final active = widget.state.activeResultTab ?? summaryTab;

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
              ...widget.data.positions!.map((p) {
                final isActive = !isSummary && active == p.positionTitle;
                return GestureDetector(
                  onTap:
                      () => ref
                          .read(electionProvider.notifier)
                          .changeResultTab(p.positionTitle.toString()),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? AppColors.instance.yellow600
                              : AppColors.instance.black200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      p.positionTitle ?? "",
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
                            ? AppColors.instance.yellow600
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
          SummaryResuiltData()
        // ✅ When a position tab is active → show candidate results
        else ...[
          _candidateResultSection(widget.state, widget.data),
        ],
      ],
    );
  }

  Widget _candidateResultSection(ElectionState state, LiveResultsData data) {
    final activeTab = state.activeResultTab;

    if (activeTab == null) return const SizedBox();

    // 🔹 Find the position user selected
    final selectedPosition = data.positions?.firstWhere(
      (pos) => pos.positionTitle == activeTab,
      orElse: () => PositionData(),
    );

    // 🔹 Extract candidate list safely
    final candidates = selectedPosition?.candidates ?? [];

    // 🔹 Calculate total votes
    final totalVotes = selectedPosition?.totalVotesCast ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ✅ Total Votes Card
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

        /// 🔥 Candidate Cards
        ...candidates.map((c) {
          final isLeader = c.isWinner ?? false;

          return _candidateResultCard(c, isLeader);
        }),
      ],
    );
  }

  Widget _candidateResultCard(CandidateData c, bool leader) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: leader ? AppColors.instance.blue100 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color:
              leader ? getVoteColor(c.rank ?? 0) : AppColors.instance.grey300,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage:
                // ignore: unnecessary_null_comparison
                c.mediaUrl != null ? NetworkImage(c.mediaUrl ?? "") : null,
            child: c.mediaUrl == null ? Text(c.name![0]) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.name ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  c.partyAffiliation ?? "Independent",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: c.percentage,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  color: getVoteColor(c.rank ?? 0),
                ),
                const SizedBox(height: 6),
                Text(
                  "${c.voteCount} Votes",
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
                "${c.percentage?.toStringAsFixed(1)}%",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: getVoteColor(c.rank ?? 0),
                ),
              ),
              leader
                  ? const Text(
                    "Leading",
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Color getVoteColor(int percent) {
    switch (percent) {
      case 1:
        return AppColors.instance.teal500; // Strong lead
      case 2:
        return AppColors.instance.blue400; // Moderate lead
      case 3:
        return AppColors.instance.yellow500; // Competitive
      default:
        return AppColors.instance.error500; // Low votes
    }
  }
}
