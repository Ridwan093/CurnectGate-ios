import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkDropDown extends ConsumerWidget {
  final List<String> workTypes;
  final String label;
  final ValueChanged<String?>? onChanged;

  const WorkDropDown({
    super.key,
    required this.workTypes,
    this.label = "Work type",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workOrderFormProvider);
    final notifier = ref.read(workOrderFormProvider.notifier);

    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      icon: Icon(Icons.keyboard_arrow_down),
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        color: AppColors.instance.black600,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        labelText: label,
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
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black600,
          fontSize: 13,
        ),
        errorStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.error600,
          fontSize: 12,
        ),
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black300,
          fontSize: 13,
        ),
      ),
      value: state.workType == "" ? null : state.workType,
      items:
          workTypes.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (value) {
        notifier.updateWorkType(value);
        onChanged?.call(value);
        // Update form validation
      },
      hint: Text(
        label,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black300,
          fontSize: 13,
        ),
      ),
    );
  }
}
