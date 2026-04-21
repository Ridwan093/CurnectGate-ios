import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddReminderDate extends ConsumerStatefulWidget {
  const AddReminderDate({super.key});

  @override
  ConsumerState<AddReminderDate> createState() => _AddReminderDateState();
}

class _AddReminderDateState extends ConsumerState<AddReminderDate> {
  bool _isDatePickerOpen = false;
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    String dateString = ref.watch(reminderProvider).time;

    if (dateString.isNotEmpty) {
      DateTime dateTime = DateTime.parse(dateString);
      final DateFormat formatter = DateFormat('MMM d, yyyy HH:mm');
      formattedDate = formatter.format(dateTime);
    }

    return AbsorbPointer(
      absorbing: _isDatePickerOpen,
      child: InkWell(
        onTap:
            _isDatePickerOpen ? null : () => _showDateTimePicker(context, ref),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Text(
              'Date & Time*',
              style: TextStyle(
                fontWeight: FontFamilies.medium,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Text(
              formattedDate != null ? formattedDate! : "Select",
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamilies.interDisplay,
                color:
                    formattedDate != null
                        ? AppColors.instance.black600
                        : AppColors.instance.black400,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.calendar_today,
              size: 18,
              color: AppColors.instance.black400,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context, WidgetRef ref) async {
    if (_isDatePickerOpen) return;

    setState(() {
      _isDatePickerOpen = true;
    });

    try {
      final notifer = ref.read(reminderProvider.notifier);
      final currentDate =
          ref.read(generateNotifierProvider).selectedDate ?? DateTime.now();

      final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.instance.yellow400,
                onPrimary: AppColors.instance.black600,
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

      if (datePicked != null) {
        final TimeOfDay? timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentDate),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.instance.yellow400,
                  onPrimary: AppColors.instance.black600,
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

        if (timePicked != null) {
          final DateTime combinedDateTime = DateTime(
            datePicked.year,
            datePicked.month,
            datePicked.day,
            timePicked.hour,
            timePicked.minute,
          );

          // Use a small delay to avoid gesture conflicts
          Future.delayed(const Duration(milliseconds: 50), () {
            ref
                .read(generateNotifierProvider.notifier)
                .setSelectedDate(combinedDateTime);
            ref
                .read(generateNotifierProvider.notifier)
                .setSelectedTime(timePicked);
            notifer.updateTime(combinedDateTime.toString());
          });
        }
      }
    } finally {
      // Ensure we always reset the state
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _isDatePickerOpen = false;
          });
        }
      });
    }
  }
}
