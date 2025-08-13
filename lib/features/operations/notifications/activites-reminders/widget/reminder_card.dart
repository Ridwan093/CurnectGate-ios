import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/model/activit_model.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderCard extends ConsumerWidget {
  final ActivityItem activity;

  const ReminderCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        skinColors = AppColors.instance.teal100;
        iconColors = AppColors.instance.teal300;
        break;
    }

    return InkWell(
      onTap: () {
        showUserBottomSheet(
          context: context,
          headertitle: activity.title ,
          headersubtitle: activity.subtitle,
          ref: ref,
          bottom: BottomSheetView.remidermarks,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: skinColors),
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
                    color: AppColors.instance.grey200,
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
