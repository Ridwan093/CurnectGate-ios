import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

Widget showValidationBottomSheet(BuildContext context) {
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
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Image.asset(
          AssetPaths.memberId, // Replace with your logo path
          height: 40,
        ),
        SizedBox(height: 20),

        // Title and subtitle
        Text(
          'Validating your member ID',
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Hold tight, We are checking if your member ID is associated to your selected estate.',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 13,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black400,
          ),
        ),
        SizedBox(height: 35),

        // Validation button with loading indicator
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
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Validating',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black100,
                  ),
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: AppColors.instance.grey200,
                    color: AppColors.instance.yellow500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
