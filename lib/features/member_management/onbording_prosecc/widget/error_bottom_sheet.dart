import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

Widget buildErrorContent(String erro, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    padding: EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.cancel, color: AppColors.instance.error600),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        SizedBox(height: 20),

        // Title and subtitle
        Text(
          'Menber ID not confirmed',
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          erro,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 13,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black400,
          ),
        ),
        SizedBox(height: 40),

        // GO BACK BUTTON
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.instance.black600,
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // Add your validation logic here
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                'Go Back',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black100,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
