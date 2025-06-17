import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Daytimewindow extends ConsumerWidget {
  final List<String> timeWindows;
  final ValueChanged<String?>? onChanged;

  const Daytimewindow({super.key, required this.timeWindows, this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workOrderFormProvider);
    final notifier = ref.read(workOrderFormProvider.notifier);

    return DropdownButtonFormField<String>(
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        color: AppColors.instance.black600,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black400),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black400),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.error600),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.error600),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Daily Time Window',
      ),
      value: state.selectedTimeWindow,
      items:
          timeWindows.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (value) {
        notifier.updateTimeWindow(value);
        onChanged?.call(value);

      },
      hint: Text(
        'e.g (9:00 AM - 5:00 PM)',
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black300,
          fontSize: 13,
        ),
      ),
    );
  }
}
