import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedmarkProvider = StateProvider<String?>((ref) => null);

class MarkButtonCheck extends ConsumerWidget {
  final String title;

  const MarkButtonCheck({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.read(reminderProvider.notifier);
    final selectedFilter = ref.watch(selectedmarkProvider);
    final isSelected = selectedFilter == title;
    final size = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        // Defer state update to avoid recursive build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final notifier = ref.read(selectedmarkProvider.notifier);
          if (isSelected) {
            // Deselect if already selected
            notifier.state = null;
            log('Deselected: $title');
            filter.updateSeletedFilter(notifier.state ?? "");
          } else {
            // Select this item (single selection)
            notifier.state = title;
            filter.updateSeletedFilter(notifier.state ?? "");
            log('Selected: $title');
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        height: 60,
        color: AppColors.instance.grey300,
        width: size.width,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              fontWeight: FontFamilies.bold,
            ),
          ),
          leading: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.instance.teal300
                      : AppColors.instance.grey500,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                isSelected
                    ? Icon(
                      Icons.check,
                      color: AppColors.instance.black600,
                      size: 17,
                    )
                    : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
