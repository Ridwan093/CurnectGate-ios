
import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

// ignore: unused_element
class DurationButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DurationButton({super.key, 
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.all(6.0),

        padding: EdgeInsets.all(12),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color:
                  isSelected
                      ? AppColors.instance.black600
                      : AppColors.instance.black300,
              width: isSelected ? 2 : 1,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color:
                  isSelected
                      ? AppColors.instance.black600
                      : AppColors.instance.black300,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
