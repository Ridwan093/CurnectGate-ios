import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class Buttonss extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const Buttonss({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
