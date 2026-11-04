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
        contentPadding: const EdgeInsets.fromLTRB(
          16,
          16,
          12,
          16,
        ), // ← Key: less right padding for icon
        labelText: 'Daily Time Window',
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
          fontSize: 14,
        ),
        hintText:
            'e.g (9:00 AM - 5:00 PM)', // ← Use hintText instead of hint widget
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black300,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.black400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.black400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.black400, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.error600),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.error600, width: 2),
        ),
      ),
      dropdownColor: Colors.white,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.instance.black600,
        size: 24,
      ),
      isExpanded: true, // ← Critical: makes dropdown take full width
      value: state.selectedTimeWindow,
      items:
          timeWindows.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 15,
                  color: AppColors.instance.black600,
                ),
              ),
            );
          }).toList(),
      onChanged: (value) {
        notifier.updateTimeWindow(value);
        onChanged?.call(value);
      },
    );
  }
}
