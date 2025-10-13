import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Visitoractivecount extends StatelessWidget {
  final String title;
  final String count;

  const Visitoractivecount({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 11,
                color: AppColors.instance.black300,
                fontWeight: FontFamilies.bold,
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Text(
                count,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 22,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
