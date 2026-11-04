import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateDetailDialog extends StatelessWidget {
  final String name;
  final String unit;
  final String role;
  final String biography;
  final String manifesto;
  final int voteShare;
  final int totalVotes;
  final String? imageUrl;
  final void Function()? onVote;

  const CandidateDetailDialog({
    super.key,
    required this.name,
    required this.unit,
    required this.role,
    required this.biography,
    required this.manifesto,
    required this.voteShare,
    required this.totalVotes,
    required this.onVote,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // contentPadding: const EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Avatar + Title
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => context.pop(),

                child: Icon(Icons.close, color: AppColors.instance.black600),
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              radius: 36,
              backgroundImage:
                  imageUrl != null ? NetworkImage(imageUrl!) : null,
              child: imageUrl == null ? Text(name[0]) : null,
            ),
            const SizedBox(height: 10),

            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              unit,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.instance.black300,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.instance.grey300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                role,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black500,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _sectionBox(
              icon: Icons.person,
              title: "Biography",
              content: biography,
            ),

            const SizedBox(height: 12),

            _sectionBox(
              icon: Icons.flag,
              title: "Manifesto",
              content: manifesto,
            ),

            const SizedBox(height: 16),

            // Vote Stats Boxes
            Row(
              children: [
                Expanded(
                  child: _statBox(
                    value: "$voteShare%",
                    label: "Current Vote Share",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statBox(value: "$totalVotes%", label: "Total Votes"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Vote button
            WorkSubmitbutton(label: "Vote Now", onPressed: onVote),
          ],
        ),
      ),
    );
  }

  Widget _sectionBox({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: AppColors.instance.teal400),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBox({required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.instance.teal400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.instance.black300),
          ),
        ],
      ),
    );
  }
}
