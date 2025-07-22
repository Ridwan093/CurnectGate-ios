



import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
    final String title;
    final String description;
    final String currentValue;
    final VoidCallback onTap;
  const SettingWidget({super.key,  required this. title,
    required this. description,
    required this. currentValue,
    required this. onTap,});

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontFamilies.bold,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            color: AppColors.instance.black300,
          ),
        ),
        trailing: Text(
          currentValue,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        onTap: onTap,
      ),
    );
  }


}