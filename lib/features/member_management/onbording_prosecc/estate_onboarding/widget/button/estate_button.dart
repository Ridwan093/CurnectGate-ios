import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const ActionButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.fromLTRB(23, 16, 23, 10),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color:
              onPressed != null
                  ? AppColors.instance.black600
                  : AppColors.instance.grey400,

                  borderRadius: BorderRadius.circular(10)
        ),

        child: Center(
          child: Text(
            label,
            style:  TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 15,
              fontWeight: FontFamilies.medium,
              color: onPressed != null
                  ? AppColors.instance.black100
                  : AppColors.instance.black300, 
            ),
          ),
        ),
      ),
    );
  }
}
