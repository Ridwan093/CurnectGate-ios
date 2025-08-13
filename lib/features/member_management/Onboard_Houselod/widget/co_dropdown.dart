import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoDropdown extends ConsumerWidget {
  final List<String> item;
  final String? value;
  final String label;
  final String errorKey;
  final Function(String?)? onChanged;
  const CoDropdown({
    super.key,
    required this.item,
    required this.label,
    required this.onChanged,
    required this.value,
    required this.errorKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      value: value,
      icon: Icon(Icons.keyboard_arrow_down, size: 20), // Reduced icon size
      isExpanded: true,
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
          color: AppColors.instance.black300,
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
      items:
          item.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select $errorKey';
        }
        return null;
      },
    );
  }
}
