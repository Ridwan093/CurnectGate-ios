
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final ActivityItem activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color skinColors;
    Color iconColors;

    switch (activity.status) {
      case ActivityStatus.granted:
        icon = Icons.file_download;
        skinColors = AppColors.instance.teal100;
        iconColors = AppColors.instance.teal300;
        break;
      case ActivityStatus.denied:
        icon = Icons.close;
        skinColors = AppColors.instance.error100;
        iconColors = AppColors.instance.error500;
        break;
      case ActivityStatus.completed:
        icon = Icons.check_circle;
        skinColors = AppColors.instance.grey300;
        iconColors = AppColors.instance.teal400;
        break;
      case ActivityStatus.pending:
        icon = Icons.hourglass_empty;
        skinColors = Colors.orange;
        iconColors = AppColors.instance.teal300;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: skinColors),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                child: Icon(icon, color: iconColors, size: 19),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    activity.title,
                    style: TextStyle(
                      color: AppColors.instance.black500,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    activity.subtitle,
                    style: TextStyle(
                      color: AppColors.instance.black500,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 10,
                    ),
                  ),

                  Text(
                    ' ${activity.time}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Text(
              ' ${activity.date}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}