import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committee_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommitteeCard extends StatelessWidget {
  final Committee committee;

  const CommitteeCard({super.key, required this.committee});

  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';
    return '$first$last';
  }

  String truncate(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength).trim()}...';
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('h:mm a').format(dateTime);
  }

  Color _getCategoryColor() {
    if (committee.category?.colorCode != null) {
      try {
        String hex = committee.category!.colorCode!.replaceAll('#', '');
        if (hex.length == 6) return Color(int.parse('0xFF$hex'));
      } catch (_) {}
    }
    return AppColors.instance.teal300;
  }

  Widget _buildLeaderRow(String role, String? name) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            role,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.instance.black400,
            ),
          ),
        ),
        Expanded(
          child: Text(
            name ?? 'N/A',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.instance.black600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String text, {double radius = 20}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: _getCategoryColor(),
      child: Text(
        _getInitials(text),
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.instance.grey200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.instance.grey200,
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.black100.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Avatar + Name + Category
            Row(
              children: [
                _buildAvatar(committee.name ?? 'CM'),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        committee.name ?? 'Unnamed Committee',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      if (committee.category?.name != null)
                        Text(
                          committee.category!.name!,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.black400,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Category Description
            if (committee.category?.description != null)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.category, size: 16, color: _getCategoryColor()),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        committee.category!.description!,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.instance.black600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 12),

            // Leadership
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leadership',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 8),
                if (committee.chairperson != null)
                  _buildLeaderRow(
                    'Chairperson',
                    '${committee.chairperson?.firstname ?? ''} ${committee.chairperson?.lastname ?? ''}',
                  ),
                if (committee.secretary != null)
                  _buildLeaderRow('Secretary', '${committee.secretary ?? ""}'),
              ],
            ),

            const SizedBox(height: 12),

            // Meeting Schedule
            if (committee.meetingSchedule != null ||
                committee.nextMeeting != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meetings',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (committee.meetingSchedule?.day != null)
                    Text(
                      'Schedule: ${committee.meetingSchedule!.day} at ${committee.meetingSchedule?.time ?? ''} (${committee.meetingSchedule?.frequency ?? ''})',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  if (committee.nextMeeting != null)
                    Text(
                      'Next Meeting: ${formatDate(committee.nextMeeting)} at ${formatTime(committee.nextMeeting)}',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        color: AppColors.instance.black600,
                      ),
                    ),
                ],
              ),

            const SizedBox(height: 12),

            // Objectives
            if ((committee.objectives?.isNotEmpty ?? false))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Objectives',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...committee.objectives!.map(
                    (obj) => Text(
                      '- $obj',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 12),

            // Description
            if (committee.description != null &&
                committee.description!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    truncate(committee.description!, maxLength: 200),
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
