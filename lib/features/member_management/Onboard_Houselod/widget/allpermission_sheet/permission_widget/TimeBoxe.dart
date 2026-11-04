import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Timeboxe extends ConsumerWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimeSelected;
  final bool? isEnable;
  const Timeboxe({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
    this.isEnable = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap:
          isEnable!
              ? () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(alwaysUse24HourFormat: true),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          timePickerTheme: TimePickerThemeData(
                            backgroundColor: Colors.white,
                            hourMinuteColor:
                                AppColors
                                    .instance
                                    .grey300, // ✅ Highlighted background
                            hourMinuteTextColor:
                                Colors.black, // ✅ Text color in header
                            hourMinuteShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            dialBackgroundColor: Colors.grey.shade100,
                            dialHandColor: AppColors.instance.yellow500,
                            dialTextColor: Colors.black,
                            entryModeIconColor: AppColors.instance.black600,
                            dayPeriodColor: AppColors.instance.blue400,
                            dayPeriodTextColor: Colors.white,
                            helpTextStyle: const TextStyle(color: Colors.black),
                          ),
                          colorScheme: ColorScheme.light(
                            primary:
                                AppColors
                                    .instance
                                    .black600, // ✅ Circle selection & active color
                            onPrimary:
                                Colors.white, // ✅ Text in selected circle
                            onSurface:
                                AppColors
                                    .instance
                                    .black600, // ✅ Default label color
                          ),
                        ),
                        child: child!,
                      ),
                    );
                  },
                );
                if (time != null) {
                  onTimeSelected(time);
                }
              }
              : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isEnable!
                    ? AppColors.instance.black500
                    : AppColors.instance.black300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          selectedTime != null
              ? '${selectedTime?.hour.toString().padLeft(2, '0')}:${selectedTime?.minute.toString().padLeft(2, '0')}'
              : '00:00',
          style: TextStyle(
            color:
                isEnable!
                    ? AppColors.instance.black500
                    : AppColors.instance.black300,
          ),
        ),
      ),
    );
  }
}
