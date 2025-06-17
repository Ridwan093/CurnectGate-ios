import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const CustomRadio({super.key, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color:selected?AppColors.instance.black600:AppColors.instance.grey400, width: selected ? 8 : 2),
        ),
        child:
            selected
                ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration:  BoxDecoration(
                      color: AppColors.instance.grey200,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
