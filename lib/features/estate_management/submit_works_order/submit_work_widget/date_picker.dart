import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePickerField extends ConsumerWidget {
  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime?) onDateSelected;
  final String? errorText;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?>? onChanged;
  final Color? buttonColor;          // New parameter
  final Color? selectionColor;       // New parameter
  final Color? textColor;           // New parameter

  const DatePickerField({
    super.key,
    required this.label,
    required this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.errorText,
    this.selectedDate,
    this.onChanged,
    this.buttonColor,               // Optional custom button color
    this.selectionColor,            // Optional custom selection color
    this.textColor,                 // Optional custom text color
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime.now(),
          lastDate: lastDate ?? DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                  primary: selectionColor ?? theme.colorScheme.primary, // Selection color
                  onPrimary: Colors.white,                             // Selected text color
                  surface: buttonColor ?? theme.colorScheme.surface,   // Header background
                  onSurface: textColor ?? theme.colorScheme.onSurface, // Unselected text
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: buttonColor ?? theme.primaryColor, // Button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        onDateSelected(selectedDate);
        onChanged?.call(selectedDate);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor ?? theme.primaryColor, // Border color
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor ?? theme.primaryColor, // Focused border color
              width: 2.0,
            ),
          ),
        
          suffixIcon: Icon(
            Icons.calendar_today,
            color: buttonColor ?? theme.primaryColor, // Calendar icon color
          ),
        ),
        child: Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : label,
          style: TextStyle(
            color: selectedDate != null 
                ? (textColor ?? Colors.black) 
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}