import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

import '../models/eletion_get_models/poll_History/candidate_item.dart';
import '../models/eletion_get_models/poll_History/history_item.dart';

class ElectionHistoryCard extends StatelessWidget {
  final List<HistoryItem>? votes;

  const ElectionHistoryCard({super.key, required this.votes});

  @override
  Widget build(BuildContext context) {
    // Extract ONLY the candidate list (flattened)
    final candidates =
        votes!
            .expand((h) => h.votes ?? [])
            .expand((v) => v.candidates ?? [])
            .toList();

    return Column(children: candidates.map((c) => _candidateTile(c)).toList());
  }

  Widget _candidateTile(CandidateItem c) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.black400.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.instance.grey300.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.instance.teal300.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.instance.teal100,
              backgroundImage:
                  c.mediaUrl != null && c.mediaUrl!.isNotEmpty ? NetworkImage(c.mediaUrl!) : null,
              child:
                  c.mediaUrl == null || c.mediaUrl!.isEmpty
                      ? Text(
                          c.name != null && c.name!.isNotEmpty ? c.name![0] : '?',
                          style: TextStyle(
                            color: AppColors.instance.teal500,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 16,
                          ),
                        )
                      : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.name ?? "Unknown Candidate",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Voted",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.teal400,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.instance.teal100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle_rounded,
              size: 20,
              color: AppColors.instance.teal400,
            ),
          ),
        ],
      ),
    );
  }
}
