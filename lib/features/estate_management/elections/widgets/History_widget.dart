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
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            backgroundImage:
                c.mediaUrl != null ? NetworkImage(c.mediaUrl!) : null,
            child:
                c.mediaUrl == null
                    ? Text(
                      c.name!
                          .split(' ')
                          .map((s) => s.isNotEmpty ? s[0] : '')
                          .take(2)
                          .join(),
                    )
                    : null,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              c.name ?? "",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: AppColors.instance.teal300,
          ),
        ],
      ),
    );
  }
}
