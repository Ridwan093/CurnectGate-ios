import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitiesTab extends ConsumerWidget {
  const ActivitiesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = [
      ActivityItem(
        title: 'Access Granted to jamms at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.completed,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Granted to jamms at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.completed,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Denied - Invalid OTP by Okon',
        subtitle: 'Entry Approved via OTP. 789899',
        time: '02:15 PM',
        status: ActivityStatus.denied,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Granted to jamms at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.granted,
        date: "mar 24",
        actualDate: "May 2, 2025",
      ),
    ];

    // Group by date
    final groupedActivities = <String, List<ActivityItem>>{};
    for (var activity in activities) {
      if (!groupedActivities.containsKey(activity.actualDate)) {
        groupedActivities[activity.actualDate] = [];
      }
      groupedActivities[activity.actualDate]!.add(activity);
    }

    return ListView(
      children:
          groupedActivities.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black300,
                      fontSize: 16,
                    ),
                  ),
                ),
                ...entry.value.map(
                  (activity) => ActivityCard(activity: activity),
                ),
              ],
            );
          }).toList(),
    );
  }
}
