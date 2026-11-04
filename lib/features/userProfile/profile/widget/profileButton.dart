import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Widget label;
  final VoidCallback? onPressed;
  const ProfileButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color:
              onPressed != null
                  ? AppColors.instance.black600
                  : AppColors.instance.grey400,

          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(child: label),
      ),
    );
  }
}
