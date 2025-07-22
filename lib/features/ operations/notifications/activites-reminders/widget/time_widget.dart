import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class TimeDropdown extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final void Function(String?) onChanged;

  const TimeDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    this.selectedValue,
  });

  List<String> _generateTimes() {
    final times = <String>[];
    for (int hour = 0; hour < 24; hour++) {
      final formatted = "${hour.toString().padLeft(2, '0')}:00";
      times.add(formatted);
    }
    return times;
  }

  @override
  Widget build(BuildContext context) {
    final times = _generateTimes();

    return Expanded(
      child: DropdownButtonFormField<String>(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.instance.black600,
        ),
        value: selectedValue,
        decoration: InputDecoration(
          labelText: "$label *",
          labelStyle: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.instance.black300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.instance.black300),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.instance.black300),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        items:
            times.map((String time) {
              return DropdownMenuItem<String>(
                value: time,
                child: Text(
                  time,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
