import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onTap;
  const ViewMoreButton({super.key, required this.buttontext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.instance.black600,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttontext,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),
      ),
    );
  }
}
