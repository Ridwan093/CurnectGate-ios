import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends ConsumerWidget {
  DatePickerWidget({super.key});

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.instance.yellow500, // Header background color
              onPrimary: Colors.black, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    AppColors.instance.yellow500, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      ref
          .read(formProvider.notifier)
          .updatestartDate(_dateFormat.format(picked));

      // Log the selected date
      debugPrint('Selected Date: ${_dateFormat.format(picked)}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(formProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Start Date',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontFamilies.bold,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, ref),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.startdate!.isNotEmpty
                    ? state.startdate ?? ''
                    : 'Select Date',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
