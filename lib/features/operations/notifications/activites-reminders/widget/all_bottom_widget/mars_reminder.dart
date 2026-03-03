import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/mark_button_check.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MarksReminder extends ConsumerWidget {
  final int id;
  final String title;
  final String subtitle;
  final ReminderModel? activity;

  const MarksReminder({
    super.key,
    required this.subtitle,
    required this.title,
    required this.id,
    required this.activity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(selectedmarkProvider);
    final isSelected = selectedFilter != null;
    final filter = ref.watch(reminderProvider);

    final form = ref.read(formProvider.notifier);

    return PopScope(
      canPop: true,

      onPopInvoked: (didPop) {
        ref.read(selectedmarkProvider.notifier).state = null;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                      ref.read(selectedmarkProvider.notifier).state = null;
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 20,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 40),
          
                  const MarkButtonCheck(title: "Mark as Done"),
                  const MarkButtonCheck(title: "Edit Reminder"),
                  const MarkButtonCheck(title: "Cancel"),
             

                const SizedBox(height: 20),

                FilterSubmitButtion(
                  width: MediaQuery.sizeOf(context).width,
                  buttionColor:
                      isSelected
                          ? AppColors.instance.black600
                          : AppColors.instance.grey300,
                  buttionTextColor: AppColors.instance.grey200,
                  buttiontext: 'Continue',
                  onTap: () {
                    log('Applying action: ${filter.filter}');
                    if (filter.filter == "Mark as Done") {
                      ref.read(reminderProvider.notifier).resetAll();
                      ref.read(selectedmarkProvider.notifier).state = null;
                      log(id.toString());
                      form.updateReminderTocomplet(
                        context: context,
                        type: "complete",
                        id: id.toString(),
                        ref: ref,
                      );
                    } else if (filter.filter == "Edit Reminder") {
                      ref.read(selectedmarkProvider.notifier).state = null;
                      context.pop();
                      ref.read(reminderProvider.notifier).resetAll();
                      ref.read(selectedmarkProvider.notifier).state = null;
                      showUserBottomSheet(
                        context: context,
                        headertitle: title,
                        headersubtitle: subtitle,
                        ref: ref,
                        bottom: BottomSheetView.addReminder,
                        id: id,
                        activity: activity,
                      );
                    } else if (filter.filter == "Cancel") {
                      ref.read(reminderProvider.notifier).resetAll();
                      ref.read(selectedmarkProvider.notifier).state = null;
                      context.pop();
                      showUserBottomSheet(
                        context: context,
                        headertitle: title,
                        headersubtitle: "",
                        ref: ref,
                        bottom: BottomSheetView.removedReminder,
                        id: id,
                      );
                    }
                    // Reset selection after action
                  },
                ),
              ],
            ),
          ),
          if (filter.isLoading) Positioned.fill(child: _buildcontainer()),
        ],
      ),
    );
  }

  Widget _buildcontainer() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }
}
