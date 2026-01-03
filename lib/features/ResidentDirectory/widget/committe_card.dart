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

  String truncateWithEllipsis(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength).trim()}...';
  }

  String? formatDateFromDateTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  String formatTimeFromDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('h:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.instance.grey200,
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.black100.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Committee Name and Avatar
            _buildCardHeader(context),

            const SizedBox(height: 16),

            // Category Information
            if (committee.category != null) _buildCategorySection(),

            const SizedBox(height: 12),

            // Leadership Section
            _buildLeadershipSection(),

            const SizedBox(height: 12),

            // Meeting Information
            if (committee.meetingSchedule != null ||
                committee.nextMeeting != null)
              _buildMeetingSection(),

            const SizedBox(height: 8),

            // Description
            if (committee.description?.isNotEmpty ?? false)
              _buildDescriptionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: _getCategoryColor(),
                child: Center(
                  child: Text(
                    _getInitials(committee.name ?? "CM"),
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.grey200,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      committee.name ?? "Unnamed Committee",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontWeight.bold,
                        color: AppColors.instance.black600,
                        fontSize: 18,
                      ),
                    ),
                    if (committee.category?.name != null)
                      Text(
                        committee.category?.name ?? "",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black400,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getCategoryColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.category, size: 16, color: _getCategoryColor()),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (committee.category?.description != null)
                  Expanded(
                    child: Text(
                      committee.category!.description!,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadershipSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Leadership",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        if (committee.chairperson != null)
          _buildLeaderRow("Chairperson", committee.chairperson ?? "N/A"),
        if (committee.secretary != null)
          _buildLeaderRow("Secretary", committee.secretary ?? "N/A"),
      ],
    );
  }

  Widget _buildLeaderRow(String role, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              role,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeetingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meetings",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        if (committee.meetingSchedule?.day != null)
          _buildMeetingDetailRow("Schedule", committee.meetingSchedule!.day!),
        if (committee.nextMeeting != null)
          _buildMeetingDetailRow(
            "Next Meeting",
            "${formatDateFromDateTime(committee.nextMeeting)} at ${formatTimeFromDateTime(committee.nextMeeting)}",
          ),
      ],
    );
  }

  Widget _buildMeetingDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,

          softWrap: true,
          committee.description!,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black500,
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor() {
    if (committee.category?.colorCode != null) {
      try {
        // Convert hex color code to Color
        String hexColor = committee.category!.colorCode!.replaceAll("#", "");
        if (hexColor.length == 6) {
          return Color(int.parse("0xFF$hexColor"));
        }
      } catch (e) {
        // If color parsing fails, return a default color
      }
    }
    return AppColors.instance.teal300; // Default color
  }
}
