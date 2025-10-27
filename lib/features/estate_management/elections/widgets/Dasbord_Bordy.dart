
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/election_enum.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_state.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/tab/allTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElectionBody extends ConsumerWidget {
  final ElectionState state;
  const ElectionBody({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final election = state.election;
   

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
                            election.estateName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),
                          // const SizedBox(height: 2),
                          Text(
                            election.memberName,
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
                          election.memberId,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _smallStat('Active', election.activeCount.toString()),
                    _smallStat('Your Votes', election.yourVotes.toString()),
                    _smallStat('Total Voters', election.totalVoters.toString()),
                  ],
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
          Alltab(state:state),
    

  
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
