import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

void showForcePasswordChangeDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onChangeNow,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent user from tapping outside to close
    builder:
        (context) => AlertDialog(
          backgroundColor: AppColors.instance.grey200,
          title: Text(
            "Password Change Required",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 18,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Maybe Later
              child: Text(
                "Maybe Later",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.medium,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                onChangeNow(); // Navigate
              },
              child: Text(
                "Change Now",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
  );
}
