// reusable_visitor_card.dart
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class VisitorCard extends StatelessWidget {
  final String userName;
  final String purposeOfVisit;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final String accessCode;
  final VoidCallback? onChangePressed;
  final bool showExpiry;

  const VisitorCard({
    super.key,
    required this.userName,
    required this.purposeOfVisit,
    this.selectedDate,
    this.selectedTime,
    this.accessCode = '234JHJH3',
    this.onChangePressed,
    this.showExpiry = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.instance.grey300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardHeader(context),
            const SizedBox(height: 10),
            _buildDetailRow(
              title: "Type",
              value: purposeOfVisit,
              isCode: false,
            ),
            _buildDetailRow(
              title: "End",
              value: selectedDate != null ? _formatDate(selectedDate!) : "",
              time: selectedTime != null ? formatTimeOfDay(selectedTime!) : "",
              isEndDate: true,
            ),
            _buildDetailRow(
              title: "Code",
              value: accessCode,
              isCode: true,
              showExpiry: showExpiry,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              child: Center(
                child: Text(
                  _getInitials(userName),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              userName,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,

                fontSize: 20,
              ),
            ),
          ],
        ),
        if (onChangePressed != null)
          InkWell(
            onTap: onChangePressed,
            child: Text(
              "Change",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.teal300,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailRow({
    required String title,
    required String value,
    bool isCode = false,
    bool isEndDate = false,
    String time = "",
    bool showExpiry = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black300,
            ),
          ),
          Row(
            children: [
              if (isCode && showExpiry)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "Expired in 30 days",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.error500,
                      fontSize: 10,
                    ),
                  ),
                ),
              if (isEndDate && time.isNotEmpty)
                Text(
                  "$value - $time",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 13,
                    color: AppColors.instance.black600,
                  ),
                )
              else
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 13,
                    color: AppColors.instance.black600,
                  ),
                ),
              if (isCode)
                InkWell(
                  onTap: () => Clipboard.setData(ClipboardData(text: value)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.asset(
                      AssetPaths.clipboard,
                      height: 15,
                      width: 15,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';
    return '$first$last';
  }

  String _formatDate(DateTime date) {
    return DateFormat('d, MMM').format(date);
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g. 2:00 PM
  }
}
