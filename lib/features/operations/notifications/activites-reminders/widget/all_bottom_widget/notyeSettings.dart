import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/reminderListTile.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/time_widget.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SetCustomAlert extends ConsumerWidget {
  const SetCustomAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPriders = ref.watch(formProvider);
    final state = ref.read(formProvider.notifier);
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
              "Set custom alerts",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 18,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Set alerts prefernce for your activites & reminders",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 11,
                color: AppColors.instance.black300,
              ),
            ),
            SizedBox(height: 40),
            _buildSmsFallback(),
      
            SizedBox(height: 20),
            Text(
              "Quiet Hours",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 18,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Mute non-urgent notification during your selected time range.",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black300,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                TimeDropdown(
                  label: 'From',
                  selectedValue:
                      formPriders.fromTime == '' ? null : formPriders.fromTime,
                  onChanged: (val) {
                    state.updateFromTime(val);
                  },
                ),
                const SizedBox(width: 16),
                TimeDropdown(
                  label: 'To',
                  selectedValue:
                      formPriders.toTime == '' ? null : formPriders.toTime,
                  onChanged: (val) {
                    state.updateToTime(val);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ReminderListTile(
              title: "Payment Reminders",
              onChanged: (value) {},
              isEnabled: false,
              context: context,
            ),
            const SizedBox(height: 20),
            ReminderListTile(
              title: "Maintenace Reminders",
              onChanged: (value) {},
              isEnabled: false,
              context: context,
            ),
            const SizedBox(height: 20),
            ReminderListTile(
              title: "Visitor Reminders",
              onChanged: (value) {},
              isEnabled: true,
              context: context,
            ),
            const SizedBox(height: 20),
            ReminderListTile(
              title: "Community Reminders",
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
    return Container(
      height: 80,
      color: AppColors.instance.grey300,
      child: ListTile(
        title: Text(
          "SMS Fallback for urgent alerts",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.bold,
          ),
        ),
        subtitle: Text(
          "Receive SMS notification if critical alerts fail to deliver via push. ",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 11,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
          ),
        ),

        trailing: Switch(
          activeColor: AppColors.instance.teal300,
          thumbColor: WidgetStatePropertyAll(AppColors.instance.grey200),
          value: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
