import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimePickerTile extends ConsumerWidget {
  const TimePickerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(
      generateNotifierProvider.select((state) => state.selectedTime),
    );

    return InkWell(
      onTap: () => _showTimePicker(context, ref),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Text(
            'Time',
            style: TextStyle(
              fontWeight: FontFamilies.medium,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            selectedTime != null ? _formatTime(selectedTime) : "0:00 AM",
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour =
        time.hourOfPeriod == 0
            ? 12
            : time.hourOfPeriod; // Handle 12-hour format
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period'; // Format: 2:30 PM
  }

  Future<void> _showTimePicker(BuildContext context, WidgetRef ref) async {
    final initialTime =
        ref.read(generateNotifierProvider).selectedTime ?? TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.instance.yellow400,
              onPrimary: AppColors.instance.grey200,
              onSurface: AppColors.instance.black500,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.instance.black500,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      log(picked.toString());
      log(picked.hourOfPeriod.toString());
      ref.read(generateNotifierProvider.notifier)
        ..setSelectedTime(picked)
        ..setValidityMinute(30);
    }
  }
}
