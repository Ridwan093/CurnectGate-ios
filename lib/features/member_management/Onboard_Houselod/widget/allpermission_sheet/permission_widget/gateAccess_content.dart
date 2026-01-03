// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permission_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/time_restriction_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/TimeBoxe.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/gate_Expired_day.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/repeat_bottom_shet.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/reusable_reason_widget.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GateContet extends ConsumerStatefulWidget {
  final Map<String, Permission>? permission;
  final int id;
  const GateContet({super.key, required this.permission, required this.id});

  @override
  ConsumerState<GateContet> createState() => _FacilityContetState();
}

class _FacilityContetState extends ConsumerState<GateContet> {
  final _rasoncontoller = TextEditingController();
  final _max1Controller = TextEditingController();
  // Helper methods to access permission data
  Permission? get gateAccess => widget.permission?['gate_access'];

  bool? get isGateEnabled => ref.watch(notificationProviders).isFacilityEnabled;

  List<String>? get gate => ref.watch(notificationProviders).facilities;

  Map<String, TimeRestriction>? get timeRestrictions =>
      ref.watch(notificationProviders).facilityConditions?.timeRestrictions;

  @override
  void initState() {
    super.initState();
    // _initializeState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeState();
    });
  }

  String formatDayDifference(String? inputDate) {
    // Handle null or empty input
    if (inputDate == null || inputDate.isEmpty) {
      return "0"; // Default value for invalid input
    }

    try {
      final now = DateTime.now();
      final date = DateTime.parse(inputDate);

      // Strip time to compare only dates
      final today = DateTime(now.year, now.month, now.day);
      final target = DateTime(date.year, date.month, date.day);

      final difference = target.difference(today).inDays;

      // Today should be 1, tomorrow 2, etc.
      return (difference + 1).toString();
    } catch (e) {
      // Handle any parsing errors
      debugPrint('Error parsing date: $e');
      return "0"; // Fallback value for invalid dates
    }
  }

  void _initializeState() {
    final notifier = ref.read(notificationProviders.notifier);
    final gateAccess = widget.permission?['gate_access'];

    if (gateAccess != null) {
      final expiredAt = gateAccess.expiresAt;
      final conditions = gateAccess.conditions;

      final date = formatDayDifference(expiredAt ?? "");
      log(expiredAt! + date);
      notifier.updateGateAccess(
        isActive: gateAccess.isActive ?? false,
        conditions: conditions,
      );

      notifier.updateGateConditions(
        expireday: date,
        timeRestrictions: conditions?.timeRestrictions,
      );

      // Convert TimeRestrictions to start/end time maps
      final startTimes = <String, TimeOfDay?>{};
      final endTimes = <String, TimeOfDay?>{};

      conditions?.timeRestrictions?.forEach((day, restriction) {
        startTimes[_capitalize(day)] = _parseTimeString(
          restriction.startTime ?? '00:00',
        );
        endTimes[_capitalize(day)] = _parseTimeString(
          restriction.endTime ?? '00:00',
        );
      });

      // ignore: invalid_use_of_protected_member
      notifier.state = notifier.state.copyWith(
        startTimes: startTimes,
        endTimes: endTimes,
      );
    }
  }

  TimeOfDay _parseTimeString(String timeString) {
    try {
      final parts = timeString.split(':');
      if (parts.length != 2) throw FormatException('Invalid time format');

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        throw FormatException('Invalid time values');
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      // Fallback to default time (8:00 AM) if parsing fails
      return const TimeOfDay(hour: 8, minute: 0);
    }
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

  String _capitalize(String input) =>
      input[0].toUpperCase() + input.substring(1).toLowerCase();
  void restform() {
    _max1Controller.clear();
    _rasoncontoller.clear();
  }

  void dispose() {
    super.dispose();
    _max1Controller.dispose();
    _rasoncontoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProviders);
    final notifier = ref.read(notificationProviders.notifier);
    final providerstate = ref.read((formProvider.notifier));
    final isLoading = ref.watch(formProvider).gateAccessLoading ?? false;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Gate Access Settings",
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
                // Facility Access Toggle
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
                      Flexible(
                        child: Text(
                          "Enable Gate Access",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontFamilies.bold,
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black600,
                          ),
                        ),
                      ),
                      Switch(
                        inactiveThumbColor: Colors.white,
                        activeTrackColor: AppColors.instance.teal200,
                        value: isGateEnabled!,
                        onChanged: (value) {
                          notifier.updateFacilityAccess(
                            isActive: value,
                            conditions: gateAccess?.conditions,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                ReusableReasonWidget(
                  controller: _rasoncontoller,
                  onChanged: (value) {
                    notifier.updateGateReason(value);
                  },
                  isEnable: !isGateEnabled!,
                ),
                const SizedBox(height: 16),
                // Only show these controls if facility access is enabled

                // Repeat Button
                GestureDetector(
                  onTap:
                      isGateEnabled!
                          ? () =>
                              RepeatBottomShet().showRepeatBottomSheet(context)
                          : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isGateEnabled!
                              ? Colors.white
                              : AppColors.instance.grey200,
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
                        const SizedBox(width: 40),
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
                const SizedBox(height: 16),
                GateExpiredDay(isEnable: isGateEnabled!),
                const SizedBox(height: 20),

                // Time Restrictions
                ..._buildDayTimePickers(context, ref),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Save Button
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
              onPressed:
                  isLoading
                      ? null
                      : () {
                        if (isGateEnabled!) {
                          if (_rasoncontoller.text.isEmpty) {
                            log("Red------------->");
                            showCustomSuccessToast(
                              context: context,
                              message: "Please add a reason",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                          } else if (_rasoncontoller.text.length < 15) {
                            log("blue------------->");
                            showCustomSuccessToast(
                              context: context,
                              message: "Reason must be at least 15 characters",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                            // providerstate.setFacilityPermission(
                            //   context: context,
                            //   id: widget.id,
                            //   ref: ref,
                            // );
                          } else {
                            providerstate.setGatePermission(
                              context: context,
                              id: widget.id,
                              ref: ref,
                            );
                            restform();
                          }
                        } else {
                          providerstate.setGatePermission(
                            context: context,
                            id: widget.id,
                            ref: ref,
                          );
                          restform();
                        }
                      },
              child:
                  isLoading
                      ? Loadingstates()
                      : Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDayTimePickers(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationProviders.notifier);
    final state = ref.watch(notificationProviders); // WATCH not READ!

    final timeRestrictions = state.gateConditions?.timeRestrictions;

    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    const defaultTimeString = '00:00';

    return days.map((day) {
      final dayKey = day.toLowerCase();
      final restriction = timeRestrictions?[dayKey];

      final startTime = _parseTimeString(
        restriction?.startTime ?? defaultTimeString,
      );
      final endTime = _parseTimeString(
        restriction?.endTime ?? defaultTimeString,
      );

      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                day,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
            Row(
              children: [
                // Start Time Picker
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start time',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: FontFamilies.interDisplay,
                        color:
                            isGateEnabled!
                                ? AppColors.instance.black600
                                : AppColors.instance.black300,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Timeboxe(
                      selectedTime: startTime,
                      onTimeSelected: (newTime) {
                        notifier.updateGateTimeRestriction(
                          day: dayKey,
                          startTime: newTime,
                          endTime: endTime,
                        );
                      },
                      isEnable: isGateEnabled,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // End Time Picker
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End time',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: FontFamilies.interDisplay,
                        color:
                            isGateEnabled!
                                ? AppColors.instance.black600
                                : AppColors.instance.black300,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Timeboxe(
                      selectedTime: endTime,
                      onTimeSelected: (newTime) {
                        notifier.updateGateTimeRestriction(
                          day: dayKey,
                          startTime: startTime,
                          endTime: newTime,
                        );
                      },
                      isEnable: isGateEnabled,
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
