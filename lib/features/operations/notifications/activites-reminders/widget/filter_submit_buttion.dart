import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class FilterSubmitButtion extends StatelessWidget {
  final String buttiontext;
  final Color buttionColor;
  final VoidCallback onTap;
  final Color buttionTextColor;
  final double width;

  const FilterSubmitButtion({
    super.key,
   this. width = 100,
    required this.buttiontext,
    required this.buttionColor,
    required this.onTap,
    required this.buttionTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,

      decoration: BoxDecoration(
        color: buttionColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          buttiontext,
          style: TextStyle(
            color: buttionTextColor,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
      ),
    );
  }
}
