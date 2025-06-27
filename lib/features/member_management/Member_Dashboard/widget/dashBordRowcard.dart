

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Dashbordrowcard extends StatelessWidget {
   final String icon;
    final String title;
    final VoidCallback onTap;
  const Dashbordrowcard({super.key, required this .icon,
    required this .title,
    required this. onTap,});

  @override
  Widget build(BuildContext context) {
   return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 90,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 20),
              SizedBox(height: 17),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 11,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}