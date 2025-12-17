import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/summary_result_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/tab/allTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElectionBody extends ConsumerWidget {
  final ElectionState state;
  const ElectionBody({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final candidateAsync = ref.watch(reultSummaryProvider);

    final user = authState.user;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Top estate header (green gradient card)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.instance.teal400,
              // gradient: LinearGradient(
              //   colors: AppColors.instance.teal400.withOpacity(.8),
              // ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.how_to_vote,
                        size: 23,
                        color: AppColors.instance.grey200,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Estate Name",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),
                          // const SizedBox(height: 2),
                          Text(
                            user!['estate_name']?? "",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Member ID',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                          ),
                        ),

                        Text(
                          user['member_code']??"",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                candidateAsync.when(
                  data: (e) {
                    return e?.data?.statistics != null
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _smallStat(
                              'Active',
                              "${e?.data?.statistics?.turnoutPercentage.toString()}%",
                            ),
                            _smallStat(
                              'Your Votes',
                              "${e?.data?.statistics?.totalVoted.toString()}",
                            ),
                            _smallStat(
                              'Total Voters',
                              "${e?.data?.statistics?.totalVoters.toString()}",
                            ),
                          ],
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _smallStat('Active', "0"),
                            _smallStat('Your Votes', "0"),
                            _smallStat('Total Voters', "0"),
                          ],
                        );
                  },
                  error: (_, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _smallStat('Active', "0"),
                        _smallStat('Your Votes', "0"),
                        _smallStat('Total Voters', "0"),
                      ],
                    );
                  },
                  loading: () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _smallStat('Active', "0"),
                        _smallStat('Your Votes', "0"),
                        _smallStat('Total Voters', "0"),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 12),

                // Tabs row (Vote Now / Live Results / History)
              ],
            ),
          ),

          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tabButton(ref, ElectionTab.voteNow, "Vote Now"),
                _tabButton(ref, ElectionTab.liveResult, "Live Result"),
                _tabButton(ref, ElectionTab.history, "History"),
                _tabButton(ref, ElectionTab.candidates, "Candidate"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Alltab(state: state),
        ],
      ),
    );
  }

  Widget _tabButton(WidgetRef ref, ElectionTab tab, String label) {
    final active = state.activeTab == tab;

    return GestureDetector(
      onTap: () => ref.read(electionProvider.notifier).changeTab(tab),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color:
              active ? AppColors.instance.teal400 : AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white60, width: active ? 2 : 1),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontWeight.w600,
            color:
                active
                    ? AppColors.instance.teal100
                    : AppColors.instance.black400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _smallStat(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.teal.shade300.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
