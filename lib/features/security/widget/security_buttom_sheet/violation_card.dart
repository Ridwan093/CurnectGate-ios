import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ParkingViolationCard extends StatelessWidget {
  final String violationType;
  final String reportedBy;
  final bool? isInvestigation;
  final bool? isDismissing;
  final String resolutionType;
  final String date;
  final String? imageUrl; // Add this for evidence image
  final VoidCallback onDismiss;
  final VoidCallback onAccept;

  const ParkingViolationCard({
    super.key,
    required this.violationType,
    required this.reportedBy,

    required this.resolutionType,
    required this.date,
    this.imageUrl,
    this.isInvestigation = false,
    this.isDismissing = false,
    required this.onDismiss,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.grey300,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null) ...[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Text(
                    violationType,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontFamilies.bold,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  Text(
                    "Report By $reportedBy",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontFamilies.bold,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black300,
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text(
                    "Date: $date",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontFamilies.bold,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black300,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Violation Description

                  // Evidence Image (conditional)

                  // Action Buttons
                  if (isDismissing ?? false) ...[
                    _dismissingBanner(
                      isDismissing: true,
                      title: "Report Dismissing",
                    ),
                  ] else if (isInvestigation ?? false) ...[
                    _resolevedMarks(
                      onTap: onDismiss,
                      buttonText: "Marked as resolved ",
                    ),
                  ] else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: _buildButton(
                            onTap: onDismiss,
                            buttonText: "Dismiss",
                            buttonColor: AppColors.instance.grey300,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: _buildButton(
                            onTap: onAccept,
                            buttonText: "Resolved",
                            buttonColor: AppColors.instance.teal300,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dismissingBanner({
    required bool isDismissing,
    required String title,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color:
            isDismissing
                ? AppColors.instance.error200
                : AppColors.instance.black600,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color:
                  isDismissing
                      ? AppColors.instance.black600
                      : AppColors.instance.black600,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            isDismissing ? Icons.close : Icons.done,
            color:
                isDismissing
                    ? AppColors.instance.black600
                    : AppColors.instance.black600,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onTap,
    required String buttonText,
    required Color buttonColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
        ),

        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _resolevedMarks({
    required VoidCallback onTap,
    required String buttonText,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.instance.teal200,

          borderRadius: BorderRadius.circular(6),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontSize: 12,
                fontWeight: FontFamilies.bold,
              ),
            ),
            Flexible(
              child: Icon(Icons.done, color: AppColors.instance.black600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildinvestigationButton({
    required VoidCallback onTap,
    required String buttonText,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.instance.teal300,
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.instance.black600,
          ),
          borderRadius: BorderRadius.circular(6),
        ),

        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),
      ),
    );
  }
}
