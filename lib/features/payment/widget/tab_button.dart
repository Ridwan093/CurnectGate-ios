import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 48, // Material minimum tap target
          ),
          child: Container(
            alignment: Alignment.center,

            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 3),
            decoration:
                isSelected
                    ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.instance.grey400,
                          spreadRadius: 2,
                          blurRadius: 3,
                        ),
                      ],
                    )
                    : null,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isSelected
                        ? AppColors.instance.black600
                        : AppColors.instance.black300,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
