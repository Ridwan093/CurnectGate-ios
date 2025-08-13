import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
class StepIndicator extends StatelessWidget {
  final int current;
  final int total;

  const StepIndicator({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontSize: 14,
            fontWeight: FontFamilies.medium,
          ),
          children: [
            const TextSpan(text: 'Step '),
            TextSpan(text: '$current '),
            const TextSpan(text: 'of '),
            TextSpan(text: '$total'),
          ],
        ),
      ),
    );
  }
}
