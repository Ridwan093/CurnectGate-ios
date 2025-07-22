import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/widget/ScheduleTime_widget.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/Reminder_form.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/datePicker.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/reminderListTile.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/reminder_dropDown.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddReminder extends ConsumerWidget {
  AddReminder({super.key});
  final _controller = TextEditingController();

  final List<String> _reminderList = [
    "Payment",
    "Maintenace",
    "Visitor",
    "Community ",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formPriders = ref.watch(formProvider);
    // final state = ref.read(formProvider.notifier);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 2,
                width: 35,
                color: AppColors.instance.grey300,
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Text(
                  "Close",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.teal300,
                  ),
                ),
              ),
            ),
            Text(
              "Add reminder",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 18,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "stay on top of payment, maintenance, and more.",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 11,
                color: AppColors.instance.black300,
              ),
            ),
            SizedBox(height: 40),
            AddReminderForms(_controller),
            SizedBox(height: 20),
            _buildSmsFallback(),

            SizedBox(height: 20),
            ReminderDropDown(
              items: [],
              selectedValue: '',
              onChanged: (value) {},
              title: 'Repeat?',
            ),
            const SizedBox(height: 20),
            AddReminderDate(),
            const SizedBox(height: 20),
            TimePickerTile(),
            const SizedBox(height: 20),
            ReminderDropDown(
              items: [
                "SMS",
                "Email",
                "Push"

              ],
              selectedValue: '',
              onChanged: (value) {},
              title: 'Notify via',
            ),

            SizedBox(height: 20),

            ReminderListTile(
              title: "Share with household",
              onChanged: (value) {},
              isEnabled: false,
              context: context,
            ),
            const SizedBox(height: 20),

            FilterSubmitButtion(
              buttionColor: AppColors.instance.black600,
              buttionTextColor: AppColors.instance.grey200,
              buttiontext: 'Save reminder',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmsFallback() {
    return WorkDropDown(label: "Category", workTypes: _reminderList);
  }
}
