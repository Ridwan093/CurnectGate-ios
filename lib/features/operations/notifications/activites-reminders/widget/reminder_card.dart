import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderCard extends ConsumerWidget {
  final ReminderModel activity;

  const ReminderCard({super.key, required this.activity});
  String truncateText(String? text, int maxLength) {
    if (text == null || text.isEmpty) return '';
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength - 3)}...';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String truncatedTitle = truncateText(activity.title, 30);
    String truncatedDescription = truncateText(activity.description, 30);
// default color
    switch (activity.category.toString()) {
      case "payment":
        break;
      case "visitor":
        break;
      case "community":
        break;
      case "personal":
        break;
      case "event":
        break;
      case "bill_payment":
        break;

      default:
        break;
    }
    return InkWell(
      onTap: () {
        ref.watch(reminderProvider.notifier).resetAll();
        showUserBottomSheet(
          context: context,
          headertitle: activity.title ?? "",
          headersubtitle: activity.description ?? "",
          ref: ref,
          bottom: BottomSheetView.remidermarks,
          id: activity.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              activity.isDue!
                  ? AppColors.instance.grey300
                  : AppColors.instance.teal200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color:
                        activity.isDue!
                            ? AppColors.instance.error600
                            : AppColors.instance.grey200,
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      "$truncatedTitle ${activity.isDue.toString()}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.instance.black500,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      truncatedDescription,
                      style: TextStyle(
                        color: AppColors.instance.black500,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
