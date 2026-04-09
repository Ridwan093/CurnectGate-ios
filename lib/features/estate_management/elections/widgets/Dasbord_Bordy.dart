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
          // Top estate header (gradient premium card)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.instance.teal500,
                  AppColors.instance.teal400,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.instance.teal400.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
                      ),
                      child: Icon(
                        Icons.how_to_vote_rounded,
                        size: 26,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Estate Election",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamilies.interDisplay,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user!['estate_name'] ?? "Your Estate",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamilies.interDisplay,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Text(
                        "ID: ${user['member_code'] ?? '---'}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                candidateAsync.when(
                  data: (e) {
                    final stats = e?.data?.statistics;
                    return Row(
                      children: [
                        _smallStat('Turnout', "${stats?.turnoutPercentage ?? 0}%"),
                        const SizedBox(width: 8),
                        _smallStat('Your Votes', "${stats?.totalVoted ?? 0}"),
                        const SizedBox(width: 8),
                        _smallStat('Voters', "${stats?.totalVoters ?? 0}"),
                      ],
                    );
                  },
                  error: (_, _) => Row(
                    children: [
                      _smallStat('Turnout', "0%"),
                      const SizedBox(width: 8),
                      _smallStat('Your Votes', "0"),
                      const SizedBox(width: 8),
                      _smallStat('Voters', "0"),
                    ],
                  ),
                  loading: () => Row(
                    children: [
                      _smallStat('Turnout', "-"),
                      const SizedBox(width: 8),
                      _smallStat('Your Votes', "-"),
                      const SizedBox(width: 8),
                      _smallStat('Voters', "-"),
                    ],
                  ),
                ),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          color: active ? AppColors.instance.black600 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: active 
            ? [BoxShadow(color: AppColors.instance.black600.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))] 
            : [BoxShadow(color: AppColors.instance.grey300.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2))],
          border: Border.all(
            color: active ? Colors.transparent : AppColors.instance.grey300, 
            width: 1
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: active ? FontWeight.bold : FontWeight.w600,
            color: active ? Colors.white : AppColors.instance.black400,
            fontSize: 13,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }

  Widget _smallStat(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 22,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
