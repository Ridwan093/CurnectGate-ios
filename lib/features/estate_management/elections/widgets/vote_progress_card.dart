import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoteProgressCard extends ConsumerStatefulWidget {
  const VoteProgressCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VoteProgressCardState();
}

class _VoteProgressCardState extends ConsumerState<VoteProgressCard> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(electionProvider);
    final election = state.election;
    final percent = (election.votesSoFar /
            (election.totalVoters == 0 ? 1 : election.totalVoters))
        .clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.instance.teal100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  election.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
              _statusBadge('ACTIVE'),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Cast your vote to shape our community\'s future',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18),
              const SizedBox(width: 8),
              Text('${election.timeLeft.inDays} day left'),
              const SizedBox(width: 12),
              const Icon(Icons.people, size: 18),
              const SizedBox(width: 8),
              Text('${election.votesSoFar} / ${election.totalVoters} voted'),
            ],
          ),
          const SizedBox(height: 12),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 12,
              color: AppColors.instance.teal500,
            ),
          ),
          const SizedBox(height: 8),
          Text('${(percent * 100).round()}% turnout'),
        ],
      ),
    );
  }

  Widget _statusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.instance.teal500,
          fontWeight: FontFamilies.medium,
          fontFamily: FontFamilies.interDisplay,

          fontSize: 12,
        ),
      ),
    );
  }
}
