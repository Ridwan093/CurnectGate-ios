import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class BiuldStartText extends StatelessWidget {
  final String text;
  final String subtext;
  BiuldStartText({super.key, required this.text, required this.subtext});
  final color = AppColors.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 30,
            fontWeight: FontFamilies.medium,
            color: color.black100,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtext,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 14,
            fontWeight: FontFamilies.light,
            color: color.black100,
          ),
        ),
      ],
    );
  }
}
