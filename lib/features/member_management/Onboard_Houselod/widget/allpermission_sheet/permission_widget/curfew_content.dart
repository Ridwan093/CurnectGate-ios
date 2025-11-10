import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permission_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/TimeBoxe.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/repeat_bottom_shet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurfewContent extends ConsumerWidget {
  final Map<String, Permission>? permission;

  const CurfewContent({super.key, required this.permission});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProviders);
    final notifier = ref.read(notificationProviders.notifier);
    final providerstate = ref.read((formProvider.notifier));
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Curfew Settings",
            style: TextStyle(
              fontSize: 17,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Main container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Disable curfew switch
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Disable Curfew",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontFamilies.bold,
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      Switch(
                        inactiveThumbColor: Colors.white,
                        activeTrackColor: AppColors.instance.teal200,
                        value: !state.isCurfewEnabled,
                        onChanged: (value) {
                          notifier.toggleCurfew(!value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Repeat button
                GestureDetector(
                  onTap:
                      !state.isCurfewEnabled
                          ? () {
                            RepeatBottomShet().showRepeatBottomSheet(context);
                          }
                          : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Repeat",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontFamilies.bold,
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        SizedBox(width: 40),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  state.repeatDays.isEmpty
                                      ? "Never"
                                      : _getShortDays(state.repeatDays),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontFamilies.interDisplay,
                                    color: AppColors.instance.black400,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Days list
                ..._buildDayTimePickers(context, ref),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Save button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // providerstate.setCurfew(
                //               context: context,
                //               id: widget.id,
                //               ref: ref,
                //             );
                //             restform();
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getShortDays(List<String> days) {
    const shortMap = {
      'Monday': 'Mon',
      'Tuesday': 'Tue',
      'Wednesday': 'Wed',
      'Thursday': 'Thu',
      'Friday': 'Fri',
      'Saturday': 'Sat',
      'Sunday': 'Sun',
    };

    return days.map((d) => shortMap[d] ?? d).join(', ');
  }

  List<Widget> _buildDayTimePickers(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProviders);
    final notifier = ref.read(notificationProviders.notifier);
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return days.map((day) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Day name on the left
            Text(
              day,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamilies.interDisplay,
                color:
                    !state.isCurfewEnabled
                        ? AppColors.instance.black600
                        : AppColors.instance.black300,
                fontWeight: FontFamilies.bold,
              ),
            ),
            // Time pickers on the right
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start time',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: FontFamilies.interDisplay,
                        color:
                            !state.isCurfewEnabled
                                ? AppColors.instance.black600
                                : AppColors.instance.black300,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Timeboxe(
                      isEnable: !state.isCurfewEnabled,
                      selectedTime: state.startTimes[day],

                      onTimeSelected:
                          (time) => notifier.updateStartTime(day, time),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End time',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: FontFamilies.interDisplay,
                        color:
                            !state.isCurfewEnabled
                                ? AppColors.instance.black600
                                : AppColors.instance.black300,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Timeboxe(
                      selectedTime: state.endTimes[day],
                      isEnable: !state.isCurfewEnabled,
                      onTimeSelected:
                          (time) => notifier.updateEndTime(day, time),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }
}
