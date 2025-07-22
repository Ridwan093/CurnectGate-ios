import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/reminder_card.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderTab extends ConsumerWidget {
  const ReminderTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remiders = [
      ActivityItem(
        title: 'Pay your water bill',
        subtitle: 'Tusday 9, 10:10 AM',
        time: '10:30 AM',
        status: ActivityStatus.pending,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Join community event',
        subtitle: 'Wednesday 9, 10 AM',
        time: '10:30 AM',
        status: ActivityStatus.pending,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Pay your water bill',
        subtitle: 'Tusday 9, 10:10 AM',
        time: '10:30 AM',
        status: ActivityStatus.denied,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Pay your water bill',
        subtitle: 'Tusday 9, 10:10 AM',
        time: '10:30 AM',
        status: ActivityStatus.completed,
        date: "mar 24",
        actualDate: "Done",
      ),
    ];

    // Group by date
    final groupedActivities = <String, List<ActivityItem>>{};
    for (var reminder in remiders) {
      if (!groupedActivities.containsKey(reminder.actualDate)) {
        groupedActivities[reminder.actualDate] = [];
      }
      groupedActivities[reminder.actualDate]!.add(reminder);
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
                  (activity) => ReminderCard(activity: activity),
                ),
              ],
            );
          }).toList(),
    );
  }
}
