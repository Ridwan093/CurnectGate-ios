import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ActivityCard extends ConsumerWidget {
  final NotificationItem activity;

  const ActivityCard({super.key, required this.activity});
  String formatToTime(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat.jm().format(date); // e.g., 4:21 AM
  }

  String formatToShortMonthDay(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat.MMMd().format(date); // e.g., Mar 24
  }

  Map<String, String> splitByFirstPeriod(String input) {
    final firstPeriodIndex = input.indexOf('.');

    if (firstPeriodIndex != -1 && firstPeriodIndex < input.length - 1) {
      final part1 = input.substring(0, firstPeriodIndex + 1).trim();
      final part2 = input.substring(firstPeriodIndex + 1).trim();

      return {'messagePart': part1, 'extraPart': part2};
    } else {
      // No period found, return full string as message
      return {'messagePart': input.trim(), 'extraPart': ''};
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData icon = Icons.info; // default icon
    Color skinColors = Colors.grey.shade200; // default color
    Color iconColors = Colors.grey;
    switch (activity.statusType) {
      case "validated":
        icon = Icons.verified;
        skinColors = AppColors.instance.teal100;
        iconColors = AppColors.instance.teal500;
        break;
      case "denied":
        icon = Icons.block;
        skinColors = AppColors.instance.error100;
        iconColors = AppColors.instance.error600;
        break;
      case "created":
        icon = Icons.add;
        skinColors = AppColors.instance.grey200;
        iconColors = AppColors.instance.black600;
        break;
      case "dismissed":
        icon = Icons.cancel;
        skinColors = AppColors.instance.grey300;
        iconColors = AppColors.instance.grey500;
        break;
      case "commented":
        icon = Icons.chat_bubble;
        skinColors = AppColors.instance.blue200;
        iconColors = AppColors.instance.blue300;
        break;
      case "assigned":
        icon = Icons.assignment_turned_in;
        skinColors = AppColors.instance.yellow100;
        iconColors = AppColors.instance.teal200;
        break;
      case "resolved":
        icon = Icons.mark_chat_read;
        // ignore: deprecated_member_use
        skinColors = AppColors.instance.teal300.withOpacity(.6);
        ;
        iconColors = AppColors.instance.teal500;
        break;
      case "investigating":
        icon = Icons.saved_search;
        // ignore: deprecated_member_use
        skinColors = AppColors.instance.grey500.withOpacity(.6);
        ;
        iconColors = AppColors.instance.black600;
        break;
      default:
        icon = Icons.help_outline;
        skinColors = AppColors.instance.black200;
        iconColors = AppColors.instance.grey400;
        break;
    }
    final result = splitByFirstPeriod(activity.description ?? "");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: skinColors),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar and Text Column
          CircleAvatar(
            backgroundColor: AppColors.instance.yellow600,
            radius: 18,
            child: Icon(icon, color: iconColors, size: 19),
          ),
          const SizedBox(width: 10),
          // Description and Time (wrap in Expanded to prevent overflow)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result['messagePart'] ?? "",
                  style: TextStyle(
                    color: AppColors.instance.black500,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: result['extraPart'] == "" ? 0 : 4),
                result['extraPart'] == ""
                    ? SizedBox()
                    : Text(
                      result['extraPart'] ?? "",
                      style: TextStyle(
                        color: AppColors.instance.black500,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.medium,
                        fontSize: 10,
                      ),
                    ),
                const SizedBox(height: 4),
                Text(
                  formatToTime(activity.updatedAt ?? ""),
                  style: TextStyle(
                    color: AppColors.instance.black500,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.medium,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Time
          Text(
            formatToShortMonthDay(activity.updatedAt ?? ""),
            style: TextStyle(
              color: AppColors.instance.black400,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.medium,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
