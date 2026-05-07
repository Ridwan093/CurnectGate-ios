import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  final Color? valueColor;

  const Rows({
    required this.label,
    required this.value,
    this.bold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: colors.black400,
            fontWeight: bold ? FontFamilies.bold : FontFamilies.regular,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            fontWeight: bold ? FontFamilies.bold : FontFamilies.medium,
            color: valueColor ?? colors.black600,
          ),
        ),
      ],
    );
  }
}
