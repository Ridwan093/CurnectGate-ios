import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/filter_button_check.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Filter extends ConsumerWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(selectedFiltersProvider);
    final isSelected = selectedFilter != null;
    final filter = ref.read(reminderProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          Text(
            "Filter & Sort",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Filter only activites you want to see",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),

          //       "Payment",

          // "Visitor",
          // "Community ",
          // "Personal",

          // "Event",
          // "Bill Payment",
          SizedBox(height: 40),
          FilterButtonCheck(title: "Payment"),
          FilterButtonCheck(title: "Visitor"),
          FilterButtonCheck(title: "Community"),
          FilterButtonCheck(title: "Event"),
          FilterButtonCheck(title: "Bill Payment"),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FilterSubmitButtion(
                  buttionColor: AppColors.instance.grey500,
                  buttionTextColor: AppColors.instance.black600,
                  buttiontext: 'Reset',
                  onTap: () {
                    filter.updateSeletedFilter("");
                    log(selectedFilter ?? "");

                    ref
                        .read(getReminderProvider.notifier)
                        .refreshReminder(context, ref);

                    context.pop();
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FilterSubmitButtion(
                  width: MediaQuery.sizeOf(context).width,
                  buttionColor:
                      isSelected
                          ? AppColors.instance.black600
                          : AppColors.instance.grey300,
                  buttionTextColor: AppColors.instance.grey200,
                  buttiontext: 'Apply',
                  onTap: () {
                    log(selectedFilter ?? "");
                    ref
                        .read(getReminderProvider.notifier)
                        .refreshReminder(context, ref);

                    context.pop();
                  },

                  // Reset selection after action
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
