import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DatePickerTile extends ConsumerWidget {
  const DatePickerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(
      generateNotifierProvider.select((state) => state.selectedDate),
    );

    return InkWell(
      onTap: () => _showDatePicker(context, ref),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Text(
            'Schedule date',
            style: TextStyle(
              fontWeight: FontFamilies.medium,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            selectedDate != null
                ? DateFormat('dd/MM/yyyy').format(selectedDate)
                : "Select date",
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.calendar_today_outlined,
            size: 20,
            color: AppColors.instance.black500,
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          ref.read(generateNotifierProvider).selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.instance.yellow400,
              onPrimary: AppColors.instance.black600,
              onSurface: AppColors.instance.black300,
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
      ref.read(generateNotifierProvider.notifier)
        ..setSelectedDate(picked)
        ..setValidityMinute(30); // Or your default/current value
    }
  }
}
